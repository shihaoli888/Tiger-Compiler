
//
// Created by Zhao Xiaodong on 2018/5/14.
//

#ifndef LJZ_TC_CANON_H
#define LJZ_TC_CANON_H

#include "tree.h"
#include "temp.h"

typedef struct C_stmListList_ *C_stmListList;
struct C_stmListList_ {
    T_stmList head;
    C_stmListList tail;
};

struct C_block {
    C_stmListList stmLists;
    Temp_label label;
};

T_stmList C_linearize(T_stm stm);

struct C_block C_basicBlocks(T_stmList stmList);

T_stmList C_traceSchedule(struct C_block b);

#endif //LJZ_TC_CANON_H
