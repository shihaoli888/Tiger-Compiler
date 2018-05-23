//
// Created by Zhao Xiaodong on 2018/5/14.
//

#include "temp.h"
#include "tree.h"
#include "canon.h"

typedef struct expRefList_ *expRefList;
struct expRefList_ {
    T_exp *head;
    expRefList tail;
};

/*
 * expRefList的构造函数
 */
expRefList ExpRefList(T_exp *exp, expRefList tail) {
    expRefList res = (expRefList) checked_malloc(sizeof(*res));
    res->head = exp;
    res->tail = tail;
    return res;
}

struct stmExp {
    T_stm stm;
    T_exp exp;
};

/*
 * stmExp的构造函数
 */
struct stmExp StmExp(T_stm stm, T_exp exp) {
    struct stmExp res;
    res.stm = stm;
    res.exp = exp;
    return res;
}

static bool isNop(T_stm x);

static bool commute(T_stm x, T_exp y);

static struct stmExp do_exp(T_exp exp);

static T_stm do_stm(T_stm stm);

static T_stm reorder(expRefList refList);

static T_stm seq(T_stm x, T_stm y);

static T_stmList linear(T_stm stm, T_stmList right);

static expRefList get_call_reflist(T_exp callExp);

static C_stmListList start_block(T_stmList stmList, Temp_label done);

static C_stmListList end_block_and_gen_others(T_stmList prevStmList, T_stmList currStmList, Temp_label done);

/*
 * 判断是不是Nop
 */
static bool isNop(T_stm x) {
    return x->kind == T_EXP && x->u.EXP->kind == T_CONST;
}

/*
 * 判断是否可以交换
 */
static bool commute(T_stm x, T_exp y) {
    return isNop(x) || y->kind == T_NAME || y->kind == T_CONST; // todo: 为什么name可以commute
}

/*
 * 得到CALL语句的子语句指针
 */
static expRefList get_call_reflist(T_exp callExp) {
    expRefList res = ExpRefList(&callExp->u.CALL.fun, NULL);
    expRefList p = res;
    T_expList p_args = callExp->u.CALL.args;
    while (p_args) {
        p->tail = ExpRefList(&p_args->head, NULL);
        p_args = p_args->tail;
        p = p->tail;
    }
    return res;
}

/*
 * 找出所有ESEQ的statement，合并重组到一个stm钟
 */
static T_stm reorder(expRefList refList) {
    if (!refList)
        return T_Exp(T_Const(0));
    if ((*refList->head)->kind == T_CALL) {
        Temp_temp temp = Temp_newtemp();
        // 对call的规则
        *refList->head = T_Eseq
                (
                        T_Move(T_Temp(temp), *refList->head),
                        T_Temp(temp)
                );
    }

    // 一般的规则
    struct stmExp head = do_exp(*refList->head);
    T_stm others = reorder(refList->tail);

    if (commute(others, head.exp)) {
        *refList->head = head.exp;
        return seq(head.stm, others);
    }

    Temp_temp temp = Temp_newtemp();
    *refList->head = T_Temp(temp);
    return seq(
            head.stm,
            seq(
                    T_Move(T_Temp(temp), head.exp),
                    others
            )
    );
}

/*
 * 简化一个sequence
 */
static T_stm seq(T_stm x, T_stm y) {
    if (isNop(x)) {
        return y;
    }
    if (isNop(y)) {
        return x;
    }
    return T_Seq(x, y);
}

/*
 * 转化一个exp，结果为statement以及一个转化好的exp
 */
static struct stmExp do_exp(T_exp exp) {
    switch (exp->kind) {
        case T_BINOP:
            return StmExp(
                    reorder(
                            ExpRefList(
                                    &exp->u.BINOP.left,
                                    ExpRefList(&exp->u.BINOP.right, NULL)
                            )
                    ),
                    exp
            );
        case T_MEM:
            return StmExp(
                    reorder(
                            ExpRefList(&exp->u.MEM, NULL)
                    ),
                    exp
            );
        case T_ESEQ: {
            struct stmExp x = do_exp(exp->u.ESEQ.exp); // 拿到eseq的exp进行转换
            return StmExp(
                    // 新的stm包含了原来的和eseq的stm中的内容
                    seq(
                            do_stm(exp->u.ESEQ.stm),
                            x.stm
                    ),
                    x.exp
            );
        }
        case T_CALL:
            return StmExp(
                    reorder(get_call_reflist(exp)),
                    exp
            );
        default:
            return StmExp(reorder(NULL), exp);
    }
}

/*
 * 转化一个statement
 */
static T_stm do_stm(T_stm stm) {
    switch (stm->kind) {
        case T_SEQ:
            return seq(do_stm(stm->u.SEQ.left), do_stm(stm->u.SEQ.right));
        case T_JUMP:
            return seq(
                    reorder(ExpRefList(&stm->u.JUMP.exp, NULL)),
                    stm
            );
        case T_CJUMP:
            return seq(
                    reorder(
                            ExpRefList(&stm->u.CJUMP.left,
                                       ExpRefList(&stm->u.CJUMP.right, NULL))
                    ),
                    stm
            );
        case T_EXP:
            if (stm->u.EXP->kind == T_CALL)
                return seq(
                        reorder(get_call_reflist(stm->u.EXP)),
                        stm
                );
            else
                return seq(
                        reorder(ExpRefList(&stm->u.EXP, NULL)),
                        stm
                );
        case T_MOVE:
            if (stm->u.MOVE.dst->kind == T_TEMP) {
                if (stm->u.MOVE.src->kind == T_CALL)
                    return seq(
                            reorder(get_call_reflist(stm->u.MOVE.src)),
                            stm
                    );
                else
                    return seq(
                            reorder(ExpRefList(&stm->u.MOVE.src, NULL)),
                            stm
                    );
            } else if (stm->u.MOVE.dst->kind == T_MEM) {
                return seq(
                        reorder(
                                ExpRefList(&stm->u.MOVE.dst->u.MEM,
                                           ExpRefList(&stm->u.MOVE.src, NULL)
                                )
                        ),
                        stm
                );
            } else if (stm->u.MOVE.dst->kind == T_ESEQ) {
                T_stm s = stm->u.MOVE.dst->u.ESEQ.stm;
                stm->u.MOVE.dst = s->u.MOVE.dst->u.ESEQ.exp;
                return do_stm(T_Seq(s, stm)); // todo: 为什么这样，s在什么时候执行？？
            }
        default:
            return stm;
    }
}

/*
 * 递归的将修改过的树转化成list
 */
static T_stmList linear(T_stm stm, T_stmList right) {
    if (stm->kind == T_SEQ) {
        return linear(stm->u.SEQ.left, linear(stm->u.SEQ.right, right));
    } else {
        return T_StmList(stm, right);
    }
}

/*
 * constructor of C_stmListList
 */
static C_stmListList C_StmListList(T_stmList head, C_stmListList tail) {
    C_stmListList res = (C_stmListList) checked_malloc(sizeof(*res));
    res->head = head;
    res->tail = tail;
    return res;
}

static C_stmListList end_block_and_gen_others(T_stmList prevStmList, T_stmList currStmList, Temp_label done) {
    if (!currStmList) {
        // 结束，添加到done的JUMP
        T_stmList stmList = T_StmList(T_Jump(T_Name(done), Temp_LabelList(done, NULL)), NULL);
        return end_block_and_gen_others(prevStmList, stmList, done);
    }
    if (currStmList->head->kind == T_JUMP || currStmList->head->kind == T_CJUMP) {
        // 正常的block，结束
        T_stmList newStmList = currStmList->tail;
        prevStmList->tail = currStmList;
        currStmList->tail = NULL;

        // 生成其它的blocks
        return start_block(newStmList, done);
    } else if (currStmList->head->kind == T_LABEL) {
        // 需要结束，但需要添加JUMP语句
        T_stm jump_stm = T_Jump(
                T_Name(currStmList->head->u.LABEL),
                Temp_LabelList(currStmList->head->u.LABEL, NULL)
        );
        prevStmList->tail = T_StmList(jump_stm, NULL);

        // 生成其它的blocks
        return start_block(currStmList, done);
    } else {
        // 普通语句 advance
        prevStmList->tail = currStmList;

        return end_block_and_gen_others(currStmList, currStmList->tail, done);
    }
}

static C_stmListList start_block(T_stmList stmList, Temp_label done) {
    if (!stmList)
        return NULL;
    T_stm head = stmList->head;
    if (head->kind == T_LABEL) {
        return C_StmListList(stmList, end_block_and_gen_others(stmList, stmList->tail, done));
    } else {
        // 如果一开始不是label，那就建一个重新来过
        Temp_label label = Temp_newlabel();
        T_stmList newStmList = T_StmList(T_Label(label), stmList);
        return start_block(newStmList, done);
    }
}

static S_table table;

static void initTable(C_stmListList stmListList) {
    table = S_empty();
    C_stmListList curr = stmListList;
    while (curr) {
        S_enter(table, curr->head->head->u.LABEL, curr->head);
        curr = curr->tail;
    }
}

static T_stmList gen_trace(T_stmList head_stmList) {
    // remove record of this block (marked as used)
    S_enter(table, head_stmList->head->u.LABEL, NULL);

    T_stmList second_last_stmList = head_stmList;
    while (second_last_stmList->tail->tail)
        second_last_stmList = second_last_stmList->tail;
    T_stmList last_stmList = second_last_stmList->tail;
    T_stm last_stm = second_last_stmList->tail->head;

    if (last_stm->kind == T_JUMP) {
        T_stmList dst = (T_stmList) S_look(table, last_stm->u.JUMP.jumps->head);
        if (dst) { // todo:...
            // 删掉多余的JUMP
            second_last_stmList->tail = gen_trace(dst);
        } else {
            // 不能删
            last_stmList->tail = NULL;
        }
    } else if (last_stm->kind == T_CJUMP) {
        T_stmList true_dst = (T_stmList) S_look(table, last_stm->u.CJUMP.true);
        T_stmList false_dst = (T_stmList) S_look(table, last_stm->u.CJUMP.false);

        if (false_dst) {
            // 不用做额外的操作
            last_stmList->tail = gen_trace(false_dst);
        } else if (true_dst) {
            // 把条件和跳转反一下
            T_stm flipped_jump = T_Cjump(T_notRel(last_stm->u.CJUMP.op),
                                         last_stm->u.CJUMP.left,
                                         last_stm->u.CJUMP.right,
                                         last_stm->u.CJUMP.false,
                                         last_stm->u.CJUMP.true
            );
            last_stmList->head = flipped_jump;
            last_stmList->tail = gen_trace(true_dst);
        } else {
            // 手动添加false跳转
            Temp_label false_label = Temp_newlabel();
            last_stmList->head = T_Cjump(last_stm->u.CJUMP.op,
                                         last_stm->u.CJUMP.left,
                                         last_stm->u.CJUMP.right,
                                         last_stm->u.CJUMP.true,
                                         false_label
            );
            last_stmList->tail = T_StmList(T_Label(false_label), NULL);
        }
    }

    return head_stmList;
}


////////////////// interface function implementation ////////////////

T_stmList C_linearize(T_stm stm) {
    return linear(do_stm(stm), NULL);
}

struct C_block C_basicBlocks(T_stmList stmList) {
    struct C_block res;
    Temp_label done = Temp_newlabel(); // fake done label for end
    res.label = done;
    res.stmLists = start_block(stmList, done);
    return res;
}

T_stmList C_traceSchedule(struct C_block b) {
    initTable(b.stmLists);

    T_stmList dummy_head_res = T_StmList(NULL, NULL); // todo: little trick, not good
    T_stmList p_stmList = dummy_head_res;
    C_stmListList curr_stmListList = b.stmLists;

    while (curr_stmListList) {
        if (S_look(table, curr_stmListList->head->head->u.LABEL)) {
            p_stmList->tail = gen_trace(curr_stmListList->head);
//            p_stmList = p_stmList->tail;
            while (p_stmList->tail)
                p_stmList = p_stmList->tail;
        } else {
            curr_stmListList = curr_stmListList->tail;
        }
    }

    return dummy_head_res->tail;
}
