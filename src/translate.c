/**
 * @brief 
 * 
 * @file translate.c
 * @author lishihao
 * @date 2018-06-09
 */
#include "translate.h"
#include "frame.h"
#include "tree.h"

typedef struct patchList_ *patchList;

struct patchList_ { Temp_label *head; patchList tail; };

struct Cx {
	patchList trues;
	patchList falses;
	T_stm stm;
};

struct Tr_exp_ {
	enum {Tr_ex,Tr_nx,Tr_cx} kind;
	union {
		T_exp ex;
		T_stm nx;
		struct Cx cx;
	}u;
};

struct Tr_level_ {
	Tr_level parent;
	F_frame frame;
//	Tr_access static_list;
	Tr_accessList formals;
};

struct Tr_access_ {
	Tr_level level;
	F_access access;
};

Tr_accessList Tr_AccessList(Tr_access head, Tr_accessList tail) {
	Tr_accessList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}
Tr_expList Tr_ExpList(Tr_exp head, Tr_expList tail) {
	Tr_expList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}

static void doPatch(patchList tList, Temp_label label) {
	for (; tList; tList = tList->tail) {
		*(tList->head) = label;
	}
}

patchList joinPatch(patchList first, patchList second) {
	if (!first) return second;
	for (; first->tail; first = first->tail);
	first->tail = second;
	return first;
}

static Tr_exp Tr_Ex(T_exp ex) {
	Tr_exp tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = Tr_ex;
	tmp->u.ex = ex;
	return tmp;
}

static Tr_exp Tr_Nx(T_stm nx) {
	Tr_exp tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = Tr_nx;
	tmp->u.nx = nx;
	return tmp;
}

static Tr_exp Tr_Cx(patchList trues, patchList falses, T_stm stm) {
	Tr_exp tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = Tr_cx;
	tmp->u.cx.falses = falses;
	tmp->u.cx.trues = trues;
	tmp->u.cx.stm = stm;
	return tmp;
}

static patchList PatchList(Temp_label *head, patchList tail) {
	patchList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}


static T_exp unEx(Tr_exp e) {
	switch (e->kind)
	{
	case Tr_ex:
	{
		return e->u.ex;
	}
	case Tr_cx:
	{
		Temp_temp r = Temp_newtemp();
		Temp_label t = Temp_newlabel(), f = Temp_newlabel();
		doPatch(e->u.cx.trues, t);
		doPatch(e->u.cx.falses, f);
		return T_Eseq(T_Move(T_Temp(r), T_Const(1)),
			T_Eseq(e->u.cx.stm,
				T_Eseq(T_Label(f),
					T_Eseq(T_Move(T_Temp(r), T_Const(0)),
						T_Eseq(T_Label(t), T_Temp(r))))));
	}
	case Tr_nx:
	{
		return T_Eseq(e->u.nx, T_Const(0));
	}
	}
	assert(0);
}

static T_stm unNx(Tr_exp e) {
	switch (e->kind)
	{
	case Tr_ex:
	{
		return T_Exp(e->u.ex);
	}
	case Tr_nx:
	{
		return e->u.nx;
	}
	case Tr_cx:
	{
		return unNx(Tr_Ex(unEx(e)));
	}
	}
	assert(0);
}

static struct Cx unCx(Tr_exp e) {
	switch (e->kind)
	{
	case Tr_ex:
	{
		struct Cx tmp;
		tmp.stm = T_Cjump(T_ne, T_Const(0), e->u.ex, NULL, NULL);
		tmp.trues = PatchList(&((tmp.stm)->u.CJUMP.true), NULL);
		tmp.falses = PatchList(&((tmp.stm)->u.CJUMP.false), NULL);
		return tmp;
	}
	case Tr_nx:
	{
		assert(0);
	}
	case Tr_cx:
	{
		return e->u.cx;
	}
	}
	assert(0);
}

static Tr_level outmost = NULL;

Tr_level Tr_outmost(void){
	if (outmost == NULL) {
		Tr_level level = checked_malloc(sizeof(*level));
		level->parent =NULL;
		level->frame = F_newFrame(Temp_namedlabel("tigerMain"), NULL);
		level->formals = NULL;
		outmost = level;
	}
	return outmost;
}

static Tr_accessList make_trformals_list(Tr_level level) {
	Tr_accessList ret = NULL, p = NULL;
	F_accessList f = F_formals(level->frame);
	if (!f) return NULL;
	else {
		//ȥ��̬��
		f = f->tail;
		for (; f; f = f->tail) {
			Tr_access tmp = checked_malloc(sizeof(*tmp));
			tmp->level = level;
			tmp->access = f->head;
			if (!ret) {
				ret = Tr_AccessList(tmp, NULL);
				p = ret;
			}
			else {
				p->tail = Tr_AccessList(tmp, NULL);
				p = p->tail;
			}
		}
	}
	return ret;
}

Tr_level Tr_newLevel(Tr_level parent, Temp_label name, U_boolList formals) {
	Tr_level level = checked_malloc(sizeof(*level));
	level->parent = parent;
	level->frame = F_newFrame(name, U_BoolList(TRUE, formals));//�Ӹ���̬��λ
	level->formals = make_trformals_list(level);
	return level;
}

Tr_accessList Tr_formals(Tr_level level) {
	return level->formals;
}

Tr_access Tr_allocLocal(Tr_level level, bool escape) {
	Tr_access tmp = checked_malloc(sizeof(*tmp));
	tmp->level = level;
	tmp->access = F_allocLocal(level->frame, escape);
	return tmp;
}

Tr_levelList Tr_LevelList(Tr_level head, Tr_levelList tail) {
	Tr_levelList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}

Temp_label Tr_levelName(Tr_level level) {
	return F_name(level->frame);
}

Tr_exp Tr_simpleVar(Tr_access acc, Tr_level lev) {
	T_exp tmp = NULL;
	for (; lev; lev = lev->parent) {
		if (lev == acc->level) {//ͬһǶ�ײ�
			if (tmp == NULL) {
				return Tr_Ex( F_Exp(acc->access, T_Temp(F_FP())));
			}
			else {
				return Tr_Ex(F_Exp(acc->access, tmp));
			}
		}
		else {//��ͬǶ�ײ㣬�Ҿ�̬��
			if (tmp == NULL) {
				tmp = F_Exp(F_formals(lev->frame)->head, T_Temp(F_FP()));
			}
			else {
				tmp = F_Exp(F_formals(lev->frame)->head, tmp);
			}
		}
	}
	assert(0);
}

Tr_exp Tr_fieldVar(Tr_exp base, Tr_exp offset) {
	return Tr_Ex(
		T_Mem(T_Binop(T_plus, unEx(base), 
			T_Binop(T_mul, unEx(offset), T_Const(get_wordsize()))
		))
	);
}

Tr_exp Tr_subsriptVar(Tr_exp base, Tr_exp offset) {
	return Tr_Ex(
		T_Mem(T_Binop(T_plus,unEx(base),
			T_Binop(T_mul, unEx(offset), T_Const(get_wordsize()))
		))
	);
}

Tr_exp Tr_opExp(Tr_exp leftt, Tr_exp rightt, A_oper op) {
	T_exp left = unEx(leftt);
	T_exp right = unEx(rightt);
	switch (op)
	{
	case A_plusOp:
	{
		return Tr_Ex(T_Binop(T_plus, left, right));
	}
	case A_minusOp:
	{
		return Tr_Ex(T_Binop(T_minus, left, right));
	}
	case A_timesOp:
	{
		return Tr_Ex(T_Binop(T_mul, left, right));
	}
	case A_divideOp:
	{
		return Tr_Ex(T_Binop(T_div, left, right));
	}
	case A_eqOp:
	{
		T_stm stm = T_Cjump(T_eq, left, right, NULL, NULL);
		patchList trues = PatchList(&(stm->u.CJUMP.true), NULL);
		patchList falses = PatchList(&(stm->u.CJUMP.false), NULL);
		return Tr_Cx(trues, falses, stm);
	}
	case A_neqOp:
	{
		T_stm stm = T_Cjump(T_ne, left, right, NULL, NULL);
		patchList trues = PatchList(&(stm->u.CJUMP.true), NULL);
		patchList falses = PatchList(&(stm->u.CJUMP.false), NULL);
		return Tr_Cx(trues, falses, stm);
	}
	case A_ltOp:
	{
		T_stm stm = T_Cjump(T_lt, left, right, NULL, NULL);
		patchList trues = PatchList(&(stm->u.CJUMP.true), NULL);
		patchList falses = PatchList(&(stm->u.CJUMP.false), NULL);
		return Tr_Cx(trues, falses, stm);
	}
	case A_leOp:
	{
		T_stm stm = T_Cjump(T_le, left, right, NULL, NULL);
		patchList trues = PatchList(&(stm->u.CJUMP.true), NULL);
		patchList falses = PatchList(&(stm->u.CJUMP.false), NULL);
		return Tr_Cx(trues, falses, stm);
	}
	case A_gtOp:
	{
		T_stm stm = T_Cjump(T_gt, left, right, NULL, NULL);
		patchList trues = PatchList(&(stm->u.CJUMP.true), NULL);
		patchList falses = PatchList(&(stm->u.CJUMP.false), NULL);
		return Tr_Cx(trues, falses, stm);
	}
	case A_geOp:
	{
		T_stm stm = T_Cjump(T_ge, left, right, NULL, NULL);
		patchList trues = PatchList(&(stm->u.CJUMP.true), NULL);
		patchList falses = PatchList(&(stm->u.CJUMP.false), NULL);
		return Tr_Cx(trues, falses, stm);
	}
	}
	assert(0);
}

Tr_exp Tr_ifthenelse(Tr_exp test, Tr_exp then, Tr_exp elsess) {
	struct Cx e1 = unCx(test);
	Temp_label t = Temp_newlabel();
	Temp_label f = Temp_newlabel();
	doPatch(e1.trues, t);
	doPatch(e1.falses, f);
	Temp_temp r = Temp_newtemp();
	Temp_label final = Temp_newlabel();
	T_stm jump = T_Jump(T_Name(final), Temp_LabelList(final, NULL));
	//��ʱ������򵥵���
	return Tr_Ex(T_Eseq(e1.stm,
		T_Eseq(T_Label(t),
			T_Eseq(T_Move(T_Temp(r), unEx(then)),
				T_Eseq(jump,
					T_Eseq(T_Label(f),
						T_Eseq(T_Move(T_Temp(r), unEx(elsess)),
							T_Eseq(T_Label(final), T_Temp(r))
						)
					)
				)
			)
		)
	));
}

Tr_exp Tr_ifthen(Tr_exp test, Tr_exp then) {
	struct Cx e1 = unCx(test);
	Temp_label t = Temp_newlabel(),f=Temp_newlabel();
	doPatch(e1.trues, t);
	doPatch(e1.falses, f);
	return Tr_Nx(T_Seq(e1.stm, T_Seq(T_Label(t), T_Seq(unNx(then), T_Label(f)))));
}

Tr_exp Tr_iffExp(Tr_exp test, Tr_exp then, Tr_exp elsess) {
	if (elsess) return Tr_ifthenelse(test, then, elsess);
	else return Tr_ifthen(test, then);
}


Tr_exp Tr_recordExp(Tr_expList exps, int offsets[], int n) {
	Temp_temp r = Temp_newtemp();
	T_exp mmalloc = F_externalCall(String("allocRecord"),T_ExpList(T_Const(n*get_wordsize()), NULL));
	T_stm mov = T_Move(T_Temp(r), mmalloc);
	int i = 0;
	for (; exps; exps = exps->tail,i++) {
		mov = T_Seq(mov, T_Move(T_Mem(T_Binop(T_plus, T_Temp(r), T_Const(offsets[i] * get_wordsize()))), unEx(exps->head)));
	}
	return Tr_Ex(T_Eseq(mov, T_Temp(r)));
}

Tr_exp Tr_arrayExp(Tr_exp init, Tr_exp size) {
	Temp_temp r = Temp_newtemp();
	return Tr_Ex(F_externalCall(String("initArray"), T_ExpList(unEx(size), T_ExpList(unEx(init), NULL))));
}

Tr_exp Tr_breakExp(Tr_exp breakk) {
	return Tr_Nx(T_Jump(unEx(breakk), Temp_LabelList(unEx(breakk)->u.NAME, NULL)));
}

Tr_exp Tr_doneExp(void) {
	return Tr_Ex(T_Name(Temp_newlabel()));
}

Tr_exp Tr_whileExp(Tr_exp test, Tr_exp body,Tr_exp breakk) {
	struct Cx e1 = unCx(test);
	T_stm e2 = unNx(body);
	Temp_label loop = Temp_newlabel(), done = unEx(breakk)->u.NAME;
	Temp_label t = Temp_newlabel();
	doPatch(e1.falses, done);
	doPatch(e1.trues, t);
	T_stm jump = T_Jump(T_Name(loop), Temp_LabelList(loop, NULL));
	return Tr_Nx(T_Seq(T_Label(loop),
		T_Seq(e1.stm,
			T_Seq(T_Label(t),
				T_Seq(e2,
					T_Seq(jump, T_Label(done))
				)
			)
		)
	)
	);
}

Tr_exp Tr_forExp(Tr_exp ii, Tr_exp lo, Tr_exp hi, Tr_exp body,Tr_exp breakk) {
	//Temp_temp i = Temp_newtemp();
	T_exp i = unEx(ii);
	Temp_temp limit = Temp_newtemp();
	T_stm init_i = T_Move(i, unEx(lo));
	T_stm init_limit = T_Move(T_Temp(limit), unEx(hi));
	T_stm inc = T_Move(i, T_Binop(T_plus, i, T_Const(1)));
	Temp_label into = Temp_newlabel();
	Temp_label end = unEx(breakk)->u.NAME;
	T_stm lo_le_hi = T_Cjump(T_le, i, T_Temp(limit), into, end);
	Temp_label next = Temp_newlabel();
	T_stm test = T_Cjump(T_lt, i, T_Temp(limit), next, end);
	T_stm jump = T_Jump(T_Name(into), Temp_LabelList(into, NULL));
	return Tr_Nx(
		T_Seq(init_i,
			T_Seq(init_limit,
				T_Seq(lo_le_hi,
					T_Seq(T_Label(into),
						T_Seq(unNx(body),
							T_Seq(test,
								T_Seq(T_Label(next),
									T_Seq(inc,
										T_Seq(jump,
											T_Label(end))))))))))
	);
}

Tr_exp Tr_callExp(Temp_label name, Tr_expList oargs, Tr_level calllevel, Tr_level funlevel) {
	if (funlevel != NULL) {
		T_exp tmp = T_Temp(F_FP());
		for (; calllevel != funlevel->parent; calllevel = calllevel->parent) {
			tmp = F_Exp(F_formals(calllevel->frame)->head, tmp);
		}
		T_expList slargs = T_ExpList(tmp, NULL);
		T_expList p = slargs;
		Tr_expList args = oargs;
		for (; args; args = args->tail) {
			p->tail = T_ExpList(unEx(args->head), NULL);
			p = p->tail;
		}
		return Tr_Ex(T_Call(T_Name(name), slargs));
	}
	else {
		T_expList slargs = NULL;
		T_expList p = NULL;
		Tr_expList args = oargs;
		for (; args; args = args->tail) {
			if (slargs == NULL) {
				slargs = T_ExpList(unEx(args->head), NULL);
				p = slargs;
			}
			else {
				p->tail = T_ExpList(unEx(args->head), NULL);
				p = p->tail;
			}
		}
		return Tr_Ex(T_Call(T_Name(name), slargs));
	}
}

Tr_exp Tr_letExp(Tr_expList lets) {
	T_stm h = unNx(lets->head);
	for (lets = lets->tail; lets; lets = lets->tail) {
		if (lets->tail == NULL) break;
		h = T_Seq(h, unNx(lets->head));
	}
	return Tr_Ex(T_Eseq(h,unEx(lets->head)));
}

Tr_exp Tr_assignExp(Tr_exp lv, Tr_exp rv) {
	return Tr_Nx(T_Move(unEx(lv), unEx(rv)));
}

Tr_exp Tr_nopExp(void) {
	return Tr_Ex(T_Const(0));
}

Tr_exp Tr_nilExp(void) {
	return Tr_Ex(T_Const(0));
}

Tr_exp Tr_intExp(int v) {
	return Tr_Ex(T_Const(v));
}

static F_fragList string_frags = NULL;
Tr_exp Tr_stringExp(string s) {
	Temp_label label = Temp_newlabel();
	F_frag tmp = F_StringFrag(label, s);
	string_frags = F_FragList(tmp,string_frags);
	return Tr_Ex(T_Name(label));
}

Tr_exp Tr_seqExp(Tr_expList seq) {
	if (seq == NULL) {
		return Tr_Nx(T_Exp(T_Const(0)));
	}
	T_exp h = unEx(seq->head);
	for (seq = seq->tail; seq; seq = seq->tail) {
		h = T_Eseq(T_Exp(h), unEx(seq->head));
	}
	return Tr_Ex(h);
}

static F_fragList prog_frags = NULL;

void Tr_progEntryExit(Tr_level level, Tr_exp body, Tr_accessList formals) {
	///*ȱ�ܶ࣬F_progEntryExit1 3*/
	//T_stm progbody = NULL;
	//if (body->kind == Tr_ex) {
	//	//������ֵ
	//	Temp_temp rv = F_RV();
	//	progbody = T_Move(T_Temp(rv), unEx(body));
	//}
	//else {
	//	progbody = unNx(body);
	//}
	T_stm progbody = F_progEntryExit1(level->frame, unEx(body));
	prog_frags = F_FragList(F_ProcFrag(progbody, level->frame),prog_frags);
}

F_fragList Tr_getResult(void){
	if (!string_frags) return prog_frags;
	else {
		F_fragList p = string_frags;
		for (; p->tail; p = p->tail);
		p->tail = prog_frags;
		return string_frags;
	}
}

void Tr_setargnum(Tr_level level, int n) {
	F_set_maxarg(level->frame, n + 1);
}


