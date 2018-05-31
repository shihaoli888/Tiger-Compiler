//
// Created by Zhao Xiaodong on 2018/5/31.
//

#include "flowgraph.h"
#include "liveness.h"
#include "color.h"
#include "regalloc.h"

struct RA_result RA_regAlloc(F_frame f, AS_instrList il) {
    G_graph flowgraph = FG_AssemFlowGraph(il);
    struct Live_graph lg = Live_liveness(flowgraph);

    G_graph ig = lg.graph;
    Temp_map initial = F_get_tempmap();
    Temp_tempList registers = F_registers();
    struct COL_result col_result = COL_color(ig, initial, registers);
    struct RA_result res;

    // todo: return directly from COL_result
    res.coloring = col_result.coloring;
    res.il = il;
    return res;
}
