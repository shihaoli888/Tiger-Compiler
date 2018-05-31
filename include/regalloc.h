//
// Created by Zhao Xiaodong on 2018/5/31.
//

#ifndef LJZ_TC_REGALLOC_H
#define LJZ_TC_REGALLOC_H

#include "temp.h"
#include "assem.h"
#include "frame.h"

struct RA_result {
    Temp_map coloring;
    AS_instrList il;
};

struct RA_result RA_regAlloc(F_frame f, AS_instrList il);

#endif //LJZ_TC_REGALLOC_H
