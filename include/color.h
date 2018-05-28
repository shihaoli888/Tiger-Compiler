//
// Created by Zhao Xiaodong on 2018/5/28.
//

#ifndef LJZ_TC_COLOR_H
#define LJZ_TC_COLOR_H

#include "temp.h"
#include "graph.h"

struct COL_result {
    Temp_map coloring;
    Temp_tempList spills;
};

struct COL_result COL_color(G_graph ig, Temp_map initial, Temp_tempList regs);

#endif //LJZ_TC_COLOR_H
