//
// Created by Zhao Xiaodong on 2018/5/31.
//

#include "flowgraph.h"
#include "liveness.h"
#include "color.h"
#include "regalloc.h"

static Temp_tempList Union_Temp_tempList(Temp_tempList l1, Temp_tempList l2) {
    if (!l1)
        return l2;
    if (!l2)
        return l1;
    Temp_tempList p = l1;
    while (p->tail) {
        p = p->tail;
    }
    p->tail = l2;
    return l1;
}

struct RA_result RA_regAlloc(F_frame f, AS_instrList il) {
    Temp_tempList spilledNodes = NULL;
    struct COL_result col_result;
    do {
        G_graph flowgraph = FG_AssemFlowGraph(il);
        struct Live_graph lg = Live_liveness(flowgraph);

        G_graph ig = lg.graph;
        Temp_map initial = F_get_tempmap();
//    Temp_tempList registers = F_registers();
        Temp_tempList registers = Union_Temp_tempList(F_calleesaves(), F_callersaves());
        col_result = COL_color(ig, initial, registers);
        spilledNodes = col_result.spills;
        // todo: rewrite program
        if (spilledNodes) {
            fprintf(stderr, "spill not supported\n");
            assert(0);
        }
    } while (!spilledNodes);

    struct RA_result res;
    res.coloring = col_result.coloring;
    res.il = il; // todo: rewrite update
    return res;
}
