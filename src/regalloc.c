//
// Created by Zhao Xiaodong on 2018/5/31.
//

#include "flowgraph.h"
#include "liveness.h"
#include "color.h"
#include "regalloc.h"

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

struct RA_result RA_regAlloc(F_frame f, AS_instrList il) {
    G_graph flowgraph = FG_AssemFlowGraph(il);
    struct Live_graph lg = Live_liveness(flowgraph);

    G_graph ig = lg.graph;
    Temp_map initial = F_get_tempmap();
    Temp_tempList registers = Union_Temp_tempList(F_calleesaves(), F_callersaves());
    struct COL_result col_result = COL_color(ig, initial, registers);
    struct RA_result res;

    // todo: return directly from COL_result
    res.coloring = col_result.coloring;
    res.il = il;
    return res;
}
