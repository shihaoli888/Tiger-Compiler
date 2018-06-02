//
// Created by Zhao Xiaodong on 2018/5/31.
//

#include <string.h>
#include <assem.h>
#include "assem.h"
#include "flowgraph.h"
#include "liveness.h"
#include "color.h"
#include "regalloc.h"

#define DEBUG_IT 1

static char FRAME_SIZE[30];

static Temp_tempList Union_Temp_tempList(Temp_tempList l1, Temp_tempList l2) {
    Temp_tempList res = NULL;
    for (; l1; l1 = l1->tail) {
        res = Temp_TempList(l1->head, res);
    }
    for (; l2; l2 = l2->tail) {
        res = Temp_TempList(l2->head, res);
    }
    return res;
}

static TAB_table allocSpillTemp(F_frame f, Temp_tempList spillNodes) {
    TAB_table table = TAB_empty();
    for (; spillNodes; spillNodes = spillNodes->tail) {
        F_access access = F_allocLocal(f, TRUE);
        TAB_enter(table, spillNodes->head, access);
    }
    return table;
}

static bool checkInstDefTemp(AS_instr inst, Temp_temp temp) {
    Temp_tempList defs = NULL;
    switch (inst->kind) {
        case I_OPER:
            defs = inst->u.OPER.dst;
            break;
        case I_LABEL:
            break;
        case I_MOVE:
            defs = inst->u.MOVE.dst;
        default:
            break;
    }
    for (; defs; defs = defs->tail) {
        if (defs->head == temp)
            return TRUE;
    }
    return FALSE;
}

static bool checkInstUseTemp(AS_instr inst, Temp_temp temp) {
    Temp_tempList uses = NULL;
    switch (inst->kind) {
        case I_OPER:
            uses = inst->u.OPER.src;
            break;
        case I_LABEL:
            break;
        case I_MOVE:
            uses = inst->u.MOVE.src;
        default:
            break;
    }
    for (; uses; uses = uses->tail) {
        if (uses->head == temp)
            return TRUE;
    }
    return FALSE;
}

static void replaceTempListTemp(Temp_tempList tempList, Temp_temp from, Temp_temp to) {
    for (; tempList; tempList = tempList->tail) {
        if (tempList->head == from)
            tempList->head = to;
    }
}

static void replaceTemp(AS_instrList instList, Temp_temp from, Temp_temp to) {
    for (; instList; instList = instList->tail) {
        AS_instr inst = instList->head;
        if (checkInstUseTemp(inst, from)) {
            switch (inst->kind) {
                case I_OPER:
                    replaceTempListTemp(inst->u.OPER.src, from, to);
//                    replaceTempListTemp(inst->u.OPER.dst, from, to);
                    break;
                case I_MOVE:
                    replaceTempListTemp(inst->u.MOVE.src, from, to);
//                    replaceTempListTemp(inst->u.MOVE.dst, from, to);
                    break;
                default:
                    break;
            }
        }
        if (checkInstDefTemp(inst, from))
            break;
    }
}

static AS_instrList insertLoad(AS_instrList prev, Temp_temp temp, F_access access) {
    Temp_temp newTemp = Temp_newtemp();
    AS_instr load =
            AS_Oper(
                    FormatString("lw `d0, %d+%s(`s0)\n", F_inFrameOffset(access), FRAME_SIZE),
                    Temp_TempList(newTemp, NULL),
                    Temp_TempList(F_SP(), NULL),
                    NULL
            );
    AS_instrList follow = prev->tail;
    prev->tail = AS_InstrList(load, follow);
    replaceTemp(prev->tail->tail, temp, newTemp);
    return prev->tail;
}

static AS_instrList insertStore(AS_instrList prev, Temp_temp temp, F_access access) {
    AS_instr store =
            AS_Oper(
                    FormatString("sw `s0, %d+%s(`s1)\n", F_inFrameOffset(access), FRAME_SIZE),
                    NULL,
                    Temp_TempList(temp,
                                  Temp_TempList(F_SP(), NULL)),
                    NULL
            );
    AS_instrList follow = prev->tail;
    prev->tail = AS_InstrList(store, follow);
    return prev->tail;
}

static AS_instrList
insertLoadStore(AS_instrList prev, Temp_tempList defTemps, Temp_tempList useTemps, TAB_table allocInfo) {
    for (; useTemps; useTemps = useTemps->tail) {
        Temp_temp temp = useTemps->head;
        F_access access = (F_access) TAB_look(allocInfo, temp);
        prev = insertLoad(prev, temp, access);
    }
    for (; defTemps; defTemps = defTemps->tail) {
        Temp_temp temp = defTemps->head;
        F_access access = (F_access) TAB_look(allocInfo, temp);
        prev = insertStore(prev->tail, temp, access);
    }
    return prev;
}

static AS_instrList rewriteProgram(AS_instrList instrList, Temp_tempList spillNodes, TAB_table allocInfo) {
    AS_instrList res = AS_InstrList(AS_Label("dummy head", Temp_newlabel()), instrList);
    AS_instrList prev = res;
    AS_instrList curr = res->tail;
    while (curr) {
        AS_instr inst = curr->head;
        Temp_tempList defTemps = NULL;
        Temp_tempList useTemps = NULL;
        for (Temp_tempList p = spillNodes; p; p = p->tail) {
            Temp_temp temp = p->head;
            if (checkInstDefTemp(inst, temp)) {
                defTemps = Temp_TempList(temp, defTemps);
            }
            if (checkInstUseTemp(inst, temp)) {
                useTemps = Temp_TempList(temp, useTemps);
            }
        }
        if (defTemps || useTemps)
            prev = insertLoadStore(prev, defTemps, useTemps, allocInfo);
        else
            prev = prev->tail;
        curr = prev->tail;
    }

    return res->tail;
}

static void show_nodeinfo(FILE *out, void *info) {
    Temp_map m = F_get_tempmap();
    string name = Temp_look(m, (Temp_temp) info);
    if (name == NULL)
        fprintf(out, "t%d\t", getTmpnum((Temp_temp) info));
    else fprintf(out, "%s\t", name);

}

struct RA_result RA_regAlloc(F_frame f, AS_instrList il) {
    FRAME_SIZE[0] = '\0';
    strcpy(FRAME_SIZE, Temp_labelstring(F_name(f)));
    strcpy(FRAME_SIZE + strlen(Temp_labelstring(F_name(f))), "_FRAMESIZE");

    Temp_tempList spilledNodes = NULL;
    struct COL_result col_result;
#if DEBUG_IT
    int MAX_LOOP = 5; // todo: only for debug
    int currLoop = 0;
    FILE *assemFile = fopen("debugAssem.s", "w");
    FILE *assemBeforeAllocFile = fopen("debugAssemBeforeAlloc.s", "w");
    FILE *graph = fopen("debugGraph.txt", "w");
#endif
    do {
        spilledNodes = NULL;
#if 1
        AS_printInstrList(assemBeforeAllocFile, il, F_get_tempmap());
#endif
        G_graph flowgraph = FG_AssemFlowGraph(il);
        struct Live_graph lg = Live_liveness(flowgraph);
#if 1
        G_show(graph, G_nodes(lg.graph), show_nodeinfo);
        fprintf(graph, "\n--------\n");
#endif

        G_graph ig = lg.graph;
        Temp_map initial = F_get_tempmap();
//    Temp_tempList registers = F_registers();
        Temp_tempList registers = Union_Temp_tempList(F_calleesaves(), F_callersaves());
//        Temp_tempList registers = Union_Temp_tempList(F_calleesaves(), NULL);
        col_result = COL_color(ig, initial, registers);
        spilledNodes = col_result.spills;
        if (spilledNodes) {
            TAB_table allocInfo = allocSpillTemp(f, spilledNodes);
            il = rewriteProgram(il, spilledNodes, allocInfo);
#if 1
            AS_printInstrList(assemFile, il, col_result.coloring);
#endif
        }
        currLoop++;
        if (currLoop >= MAX_LOOP)
            break;
    } while (spilledNodes);
    if (currLoop >= MAX_LOOP)
        assert(0);

    fclose(graph);
    fclose(assemFile);
    fclose(assemBeforeAllocFile);

    struct RA_result res;
    res.coloring = col_result.coloring;
    res.il = il; // todo: rewrite update
    return res;
}
