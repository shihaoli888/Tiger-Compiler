//
// Created by Zhao Xiaodong on 2018/5/28.
//

#include <assem.h>
#include "color.h"

static enum COL_nodeType {
    COL_NODE_PRECOLORED,
    COL_NODE_INITIAL,
    COL_NODE_SIMPLIFYWORKLIST,
    COL_NODE_FREEZEWORKLIST,
    COL_NODE_SPILLWORKLIST,
    COL_NODE_SPILLEDNODES,
    COL_NODE_COALESEDNODES,
    COL_NODE_COLOREDNODES,
    COL_NODE_SELECTSTACK
};

static Temp_map precolored; // todo: temp_map使用
static Temp_tempList initial; // todo: templist使用
static Temp_tempList simplifyWorklist = NULL;
static Temp_tempList freezeWorklist = NULL;
static Temp_tempList spillWorklist = NULL;
static Temp_tempList spilledNodes = NULL;
static Temp_tempList coalesedNodes = NULL;
static Temp_tempList coloredNodes = NULL;
static Temp_tempList selectStack = NULL;

static enum COL_moveType {
    COL_MOVE_COALESED,
    COL_MOVE_CONSTRAINED,
    COL_MOVE_FROZEN,
    COL_MOVE_WORKLIST,
    COL_MOVE_ACTIVE
};

static AS_instrList coalesedMoves = NULL; // todo: AS_instrList使用
static AS_instrList constrainedMoves = NULL;
static AS_instrList frozenMoves = NULL;
static AS_instrList worklistMoves = NULL;
static AS_instrList activeMoves = NULL;

static Temp_tempList Diff_tempList(Temp_tempList list, Temp_temp x) {
    if (!list)
        return NULL;
    if (list->head == x)
        return list->tail;
    Temp_tempList p = list;
    while (p->tail) {
        if (p->tail->head == x) {
            p->tail = p->tail->tail; // todo: not free memory
            return list;
        }
    }
}

static void MakeWorkList() {
    // todo: ...
    Temp_tempList curr = initial;
    while (curr) {
        initial = Diff_tempList(initial, curr->head);
        curr = curr->tail;
        if G_degree()
    }
}

static void Simplify() {

}

static void Coalesce() {

}

static void Freeze() {

}

static void Selectspill() {

}

static void Main() {
    // todo: liveness analysis
    MakeWorkList();

    while (simplifyWorklist != NULL || worklistMoves != NULL || freezeWorklist != NULL || spillWorklist != NULL) {
        if (simplifyWorklist)
            Simplify();
        else if (worklistMoves)
            Coalesce();
        else if (freezeWorklist)
            Freeze();
        else if (spillWorklist)
            Selectspill();
    }

    if (spilledNodes) {
        // todo: deal with spill
        fprintf(stderr, "spill happen, not supported till now..\n");
    }
}

struct COL_result COL_color(G_graph ig, Temp_map initial, Temp_tempList regs) {
    printf("coloring..");
    struct COL_result res; // todo: temp return for compile
    return res;
}
