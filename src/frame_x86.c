#include "frame.h"

#define F_WORDSIZE 4
struct F_access_ {
	enum {inFrame,inReg} kind;
	union {
		int offset;
		Temp_temp reg;
	} u;
};

struct F_frame_ {
	Temp_label name;
	unsigned int frame_size;
	F_accessList formals;
	/*暂时忽略视角位移*/
};

static F_access InFrame(int offset) {
	F_access tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = inFrame;
	tmp->u.offset = offset;
	return tmp;
}
static F_access InReg(Temp_temp reg) {
	F_access tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = inReg;
	tmp->u.reg = reg;
	return tmp;
}

F_accessList make_formals_list(F_frame f, U_boolList formals) {
	F_accessList ret = NULL,p=NULL;
	U_boolList tf = formals;
	int count = 0;
	for (; tf; tf = tf->tail) {
		F_access a;
		if (tf->head) {
			//x86的函数调用压了上个函数的ebp，再压返回地址，然后是参数
			a = InFrame((2 + count)*F_WORDSIZE);
			count++;
		}
		else {
			a = InReg(Temp_newtemp());
		}
		if (ret == NULL) {
			ret = F_AccessList(a, NULL);
			p = ret;
		}
		else {
			p->tail = F_AccessList(a, NULL);
			p = p->tail;
		}
	}
	return ret;
}

F_frame F_newFrame(Temp_label name, U_boolList formals) {
	F_frame f = checked_malloc(sizeof(*f));
	f->name = name;
	f->formals = make_formals_list(f, formals);
	f->frame_size = 0;
	return f;
}

Temp_label F_name(F_frame f) {
	return f->name;
}

F_accessList F_formals(F_frame f) {
	return f->formals;
}

F_access F_allocLocal(F_frame f, bool escape) {
	if (escape) {
		f->frame_size++;
		return InFrame(-F_WORDSIZE * (f->frame_size));
	}
	else {
		return InReg(Temp_newtemp());
	}
}

F_accessList F_AccessList(F_access head, F_accessList tail) {
	F_accessList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}

static Temp_temp fp = NULL;
Temp_temp F_FP(void) {
	if (fp == NULL) {
		fp = Temp_newtemp();
	}
	return fp;
}

T_exp F_Exp(F_access acc, T_exp frameptr) {
	if (acc->kind == inFrame) {
		return T_Mem(T_Binop(T_plus, frameptr, T_Const(acc->u.offset)));
	}
	else {
		return T_Temp(acc->u.reg);
	}
}

int get_wordsize(void) {
	return F_WORDSIZE;
}

T_exp F_externalCall(string s, T_expList args) {
	return T_Call(T_Name(Temp_namedlabel(s)),args);
}


F_frag F_StringFrag(Temp_label label, string str) {
	F_frag tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = F_stringFrag;
	tmp->u.stringg.label = label;
	tmp->u.stringg.str = str;
	return tmp;
}

F_frag F_ProcFrag(T_stm body, F_frame frame) {
	F_frag tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = F_progFrag;
	tmp->u.prog.body = body;
	tmp->u.prog.frame = frame;
	return tmp;
}

F_fragList F_FragList(F_frag head, F_fragList tail) {
	F_fragList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}

static Temp_temp rv = NULL;
Temp_temp F_RV(void) {
	if (!rv) rv = Temp_newtemp();
	return rv;
}