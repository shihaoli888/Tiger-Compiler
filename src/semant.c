#include "util.h"
#include "errormsg.h"
#include "semant.h"
#include "env.h"
#include "translate.h"

static int loop_flag = 0;
struct expty expTy(Tr_exp exp, Ty_ty ty) {
	struct expty t;
	t.exp = exp;
	t.ty = ty;
	return t;
}

struct expty transVar(Tr_level level, S_table venv, S_table tenv, A_var v, Tr_exp breakk) {
	switch (v->kind)
	{
	case A_simpleVar:
	{
		E_enventry x = S_look(venv, v->u.simple);
		if (x&&x->kind == E_varEntry) {
			return expTy(Tr_simpleVar(x->u.var.access,level), actual_ty(x->u.var.ty));
		}
		else {
			EM_error(v->pos, "undefined variable %s", S_name(v->u.simple));
		}
	}
	case A_fieldVar:
	{
		struct expty var = transVar(level, venv, tenv, v->u.field.var,breakk);
		if ((var.ty)->kind != Ty_record) {
			EM_error(v->pos, "%s not record member",S_name(v->u.field.sym));
		}
		else {
			Ty_fieldList tmp = (var.ty)->u.record;
			int i = 0;
			for (; tmp; tmp = tmp->tail) {
				if (tmp->head->name == (v->u.field.sym)) {
					return expTy(Tr_fieldVar(var.exp,Tr_intExp(i)) , actual_ty(tmp->head->ty));
				}
				i++;
			}
			EM_error(v->pos, "%s undefined", S_name(v->u.field.sym));
		}
	}
	case A_subscriptVar:
	{
		struct expty var = transVar(level, venv, tenv, v->u.subscript.var,breakk);
		if ((var.ty)->kind != Ty_array) {
			EM_error(v->pos, "variable is not array");
		}
		struct expty exp = transExp(level, venv, tenv, v->u.subscript.exp,breakk);
		if ((exp.ty)->kind != Ty_int) {
			EM_error(v->pos, "index should be interge");
		}
		return expTy(Tr_subsriptVar(var.exp, exp.exp), actual_ty((var.ty)->u.array));
	}
	}
	assert(0);
}

struct expty transExp(Tr_level level, S_table venv, S_table tenv, A_exp a, Tr_exp breakk){
	switch (a->kind)
	{
	case A_varExp:
	{
		return transVar(level, venv, tenv, a->u.var,breakk);
	}
	case A_nilExp:
	{
		return expTy(Tr_nilExp(), Ty_Nil());
	}
	case A_intExp:
	{
		return expTy(Tr_intExp(a->u.intt), Ty_Int());
	}
	case A_stringExp:
	{
		return expTy(Tr_stringExp(a->u.stringg), Ty_String());
	}
	case A_callExp:
	{
		A_expList args = a->u.call.args;
		Ty_tyList ats = NULL,atsp;
		Tr_expList aes = NULL, aesp;
		int count = 0;
		for (; args; args = args->tail) {
			struct expty e = transExp(level, venv, tenv, args->head,breakk);
			if (ats == NULL) {
				ats = Ty_TyList(e.ty, NULL);
				atsp = ats;
				aes = Tr_ExpList(e.exp, NULL);
				aesp = aes;
			}
			else {
				atsp->tail  = Ty_TyList(e.ty, NULL);
				atsp = atsp->tail;
				aesp->tail = Tr_ExpList(e.exp, NULL);
				aesp = aesp->tail;
			}
			count++;
		}
		E_enventry func = S_look(venv, a->u.call.func);
		if (func == NULL) {
			EM_error(a->pos, "function %s undefined", S_name(a->u.call.func));
		}
		Ty_tyList pargs = func->u.fun.formals;
		Ty_tyList tpargs = pargs;
		for (; tpargs; tpargs = tpargs->tail) count--;
		if (count > 0) {
			EM_error(a->pos, "formals are fewer then actuals");
		}
		else if (count < 0) {
			EM_error(a->pos, "formals are more then actuals");
		}
		//cmp real parameter and formal paramter
		for (; pargs&&ats; pargs = pargs->tail, ats = ats->tail) {
			if (actual_ty(pargs->head)->kind == Ty_record && actual_ty(ats->head)->kind == Ty_nil) continue;
			if (actual_ty(pargs->head) != actual_ty(ats->head)) {
				EM_error(a->pos, "parameter mismach");
			}
		}
		return expTy(Tr_callExp(func->u.fun.label,aes,level,func->u.fun.level), actual_ty(func->u.fun.result));
	}
	case A_opExp:
	{
		A_oper op = a->u.op.oper;
		struct expty left = transExp(level, venv, tenv, a->u.op.left,breakk);
		struct expty right = transExp(level, venv, tenv, a->u.op.right,breakk);
		if (op == A_plusOp || op == A_minusOp || op == A_timesOp || op == A_divideOp) {
			if (actual_ty(left.ty)->kind != Ty_int) {
				EM_error(a->u.op.left->pos, "integer required");
			}
			if (actual_ty(right.ty)->kind != Ty_int) {
				EM_error(a->u.op.right->pos, "integer required");
			}
		}
		// cmp op need equal type
		if (actual_ty(left.ty)!= actual_ty(right.ty)) {
			EM_error(a->u.op.left->pos, "same type required");
		}
		return expTy(Tr_opExp(left.exp,right.exp,op), Ty_Int());
	}
	case A_recordExp:
	{
		Ty_ty typ = actual_ty(S_look(tenv, a->u.record.typ));
		if (typ == NULL) {
			EM_error(a->pos, "type %s undefined", S_name(a->u.record.typ));
		}
		if (typ->kind != Ty_record) {
			EM_error(a->pos, "record type required");
		}
		A_efieldList tl = a->u.record.fields;
		int record_count = 0;
		Ty_fieldList tmp = typ->u.record;
		for (; tmp; tmp = tmp->tail) record_count++;
		int *offset = checked_malloc(sizeof(int)*record_count);//记录对应申明位置的偏移
		//遍历查域名和类型是否对应存在
		Tr_expList eargs = NULL, eargsp;
		int k = 0;
		for (; tl; tl = tl->tail,k++) {
			S_symbol name = tl->head->name;
			struct expty e = transExp(level, venv, tenv, tl->head->exp,breakk);
			if (eargs == NULL) {
				eargs = Tr_ExpList(e.exp, NULL);
				eargsp = eargs;
			}
			else {
				eargsp->tail = Tr_ExpList(e.exp, NULL);
				eargsp = eargsp->tail;
			}
			Ty_fieldList tmp = typ->u.record;
			int flag = 0;
			int i = 0;
			for (; tmp; tmp = tmp->tail,i++) {
				if (name == tmp->head->name && (actual_ty(e.ty) == actual_ty(tmp->head->ty)|| 
					actual_ty(e.ty)->kind==Ty_nil && actual_ty(tmp->head->ty)->kind==Ty_record
					)) {
					flag = 1;
					offset[k] = i;
					break;
				}
			}
			if (!flag) {
				EM_error(a->pos, "mismatch type %s ", S_name(name));
			}
		}
		return expTy(Tr_recordExp(eargs,offset,record_count), typ);
	}
	case A_seqExp:
	{
		A_expList tmp = a->u.seq;
		Ty_ty ret=Ty_Void();
		Tr_expList seqs = NULL, seqp;
		for (; tmp; tmp = tmp->tail) {
			struct expty e = transExp(level, venv, tenv, tmp->head,breakk);
			if (seqs == NULL) {
				seqs = Tr_ExpList(e.exp, NULL);
				seqp = seqs;
			}
			else {
				seqp->tail = Tr_ExpList(e.exp, NULL);
				seqp = seqp->tail;
			}
			ret = e.ty;
		}
		return expTy(Tr_seqExp(seqs), actual_ty(ret));
	}
	case A_assignExp:
	{
		struct expty lvalue = transVar(level, venv, tenv, a->u.assign.var,breakk);
		struct expty e = transExp(level, venv, tenv, a->u.assign.exp,breakk);
		if ((e.ty)->kind == Ty_void) {
			EM_error(a->pos, "right value can't be Void");
		}
		if (lvalue.ty != e.ty) {
			EM_error(a->pos, "assignment need same type");
		}
		return expTy(Tr_assignExp(lvalue.exp,e.exp), Ty_Void());
	}
	case A_ifExp:
	{
		struct expty e1 = transExp(level, venv, tenv, a->u.iff.test,breakk);
		struct expty e2 = transExp(level, venv, tenv, a->u.iff.then,breakk);
		if (a->u.iff.elsee == NULL) {
			if ((e2.ty)->kind != Ty_void) {
				EM_error(a->pos, "then must be a void expression");
			}
			return expTy(Tr_iffExp(e1.exp,e2.exp,NULL), Ty_Void());
		}
		else {
			struct expty e3 = transExp(level, venv, tenv, a->u.iff.elsee,breakk);
			if (e2.ty != e3.ty) {
				EM_error(a->pos, "then and else must hava same value");
			}
			return expTy(Tr_iffExp(e1.exp,e2.exp,e3.exp), e2.ty);
		}
	}
	case A_whileExp:
	{
		Tr_exp oldbreak = breakk;
		breakk = Tr_doneExp();
		struct expty test = transExp(level,venv, tenv, a->u.whilee.test,breakk);
		//for break exp
		int pre_loop_flag = loop_flag;
		loop_flag = 1;
		struct expty body = transExp(level, venv, tenv, a->u.whilee.body,breakk);
		loop_flag = pre_loop_flag;
		if ((body.ty)->kind != Ty_void) {
			EM_error(a->pos,"while 's body must be a void expression");
		}
		Tr_exp w = Tr_whileExp(test.exp, body.exp, breakk);
		breakk = oldbreak;
		return expTy(w, Ty_Void());
	}
	case A_forExp:
	{
		//隐式申明变量
		Tr_exp oldbreak = breakk;
		breakk = Tr_doneExp();
		S_beginScope(venv);
		Tr_access i = Tr_allocLocal(level, TRUE);
		S_enter(venv, a->u.forr.var, E_VarEntry(i,Ty_Int()));
		struct expty e1 = transExp(level, venv, tenv, a->u.forr.lo,breakk);
		struct expty e2 = transExp(level, venv, tenv, a->u.forr.hi,breakk);
		if ((e1.ty)->kind != Ty_int || (e2.ty)->kind != Ty_int) {
			EM_error(a->pos, "lo and hi must be int expression");
		}
		//for break exp
		int pre_loop_flag = loop_flag;
		loop_flag = 1;
		struct expty e3 = transExp(level, venv, tenv, a->u.forr.body,breakk);
		loop_flag = pre_loop_flag;
		if ((e3.ty)->kind != Ty_void) {
			EM_error(a->pos, "body must be a void expression");
		}
		S_endScope(venv);
		Tr_exp fff = Tr_forExp(Tr_simpleVar(i, level), e1.exp, e2.exp, e3.exp, breakk);
		breakk = oldbreak;
		return expTy(fff, Ty_Void());
	}
	case A_breakExp:
	{
		if (!loop_flag) {
			EM_error(a->pos, "break out of for or while");
		}
		return expTy(Tr_breakExp(breakk), Ty_Void());
	}
	case A_letExp:
	{
		struct expty exp;
		A_decList d;
		Tr_expList decList = NULL,decp;
		S_beginScope(venv);
		S_beginScope(tenv);
		for (d = a->u.let.decs; d; d = d->tail) {
			Tr_exp tmp = transDec(level, venv, tenv, d->head,breakk);
			if (decList == NULL) {
				decList = Tr_ExpList(tmp, NULL);
				decp = decList;
			}
			else {
				decp->tail = Tr_ExpList(tmp, NULL);
				decp = decp->tail;
			}
		}
		exp = transExp(level, venv, tenv, a->u.let.body,breakk);
		decp->tail = Tr_ExpList(exp.exp, NULL);
		S_endScope(tenv);
		S_endScope(venv);
		return expTy(Tr_letExp(decList), exp.ty);
	}
	case A_arrayExp:
	{
		Ty_ty typ = actual_ty(S_look(tenv, a->u.array.typ));
		if (typ->kind != Ty_array) {
			EM_error(a->pos, "%s is no array type", S_name(a->u.array.typ));
		}
		struct expty e1 = transExp(level, venv, tenv, a->u.array.size,breakk);
		struct expty e2 = transExp(level, venv, tenv, a->u.array.init,breakk);
		if ((e1.ty)->kind != Ty_int ) {
			EM_error(a->pos, "array size must be int");
		}
		if (e2.ty != actual_ty(typ->u.array)) {
			EM_error(a->pos, "initializing exp and array type differ");
		}
		return expTy(Tr_arrayExp(e2.exp,e1.exp), typ);
	}
	}
	assert(0);
}

Tr_exp transDec(Tr_level level, S_table venv, S_table tenv, A_dec d, Tr_exp breakk) {
	switch (d->kind)
	{
	case A_varDec:
	{
		struct expty e = transExp(level, venv, tenv, d->u.var.init,breakk);
		if (d->u.var.typ != NULL) {
			Ty_ty t = actual_ty(S_look(tenv, d->u.var.typ));
			if((e.ty)->kind==Ty_nil){
				if(t->kind != Ty_record)
					EM_error(d->pos, "nil can only init record");
			}
			else if(t != e.ty) {
				EM_error(d->pos, "type and init mismatch");
			}
		}
		Tr_access acc = Tr_allocLocal(level, TRUE);
		S_enter(venv, d->u.var.var, E_VarEntry(acc,e.ty));
		Tr_exp lve = Tr_simpleVar(acc, level);
		return Tr_assignExp(lve,e.exp);
	}
	case A_typeDec:
	{
		A_nametyList tmp = d->u.type;
		Ty_tyList name_tylist = NULL, p = NULL;
		for (; tmp; tmp = tmp->tail) {
			Ty_tyList node = Ty_TyList(NULL, NULL);
			Ty_ty name = Ty_Name(tmp->head->name, NULL);
			node->head = name;
			if (name_tylist == NULL) {
				name_tylist = node;
				name_tylist->tail = NULL;
				p = name_tylist;
			}
			else {
				p->tail = node;
				p = node;
				p->tail = NULL;
			}
			S_enter(tenv, tmp->head->name, name);
		}
		tmp = d->u.type;
		p = name_tylist;
		for (; tmp; tmp = tmp->tail,p=p->tail) {
			p->head->u.name.ty = transTy(tenv, tmp->head->ty);
		}
		p = name_tylist;
		tmp = d->u.type;
		//判断是否有环
		for (; p; p = p->tail,tmp=tmp->tail) {
			Ty_ty tt = p->head;
			for (tt = tt->u.name.ty; tt;) {
				if (tt->kind == Ty_name) {
					if (tt->u.name.ty == p->head) {
						EM_error(tmp->head->ty->pos, "loop recursion");
					}
					tt = tt->u.name.ty;
				}
				else break;
			}
		}
		return Tr_nopExp();
	}
	case A_functionDec:
	{
		A_fundecList funcs = d->u.function;
		/*收集函数头*/
		//保存level链表
		Tr_levelList levell = NULL;
		Tr_levelList pp = NULL;
		for (; funcs; funcs = funcs->tail) {
			A_fundec f = funcs->head;
			Ty_ty resultTy = actual_ty(S_look(tenv, f->result));
			if (f->result == NULL) {
				resultTy = Ty_Void();
			}
			else if (!resultTy) {
				EM_error(f->pos, "undefined %s", S_name(f->result));
			}
			else;
			Ty_tyList formalTys = make_forml_tylist(tenv, f->params);
			U_boolList formalBools = make_forml_boolist(f->params);
			Tr_level newlevel = Tr_newLevel(level, Temp_newlabel(), formalBools);
			if (levell==NULL) {
				levell = Tr_LevelList(newlevel, NULL);
				pp = levell;
			}
			else {
				pp->tail = Tr_LevelList(newlevel, NULL);
				pp = pp->tail;
			}
			S_enter(venv, f->name, E_FunEntry(newlevel,Tr_levelName(newlevel),formalTys,resultTy));
		}
		funcs = d->u.function;
		pp = levell;
		for (; funcs; funcs = funcs->tail,pp=pp->tail) {
			A_fundec f = funcs->head;
			Ty_ty resultTy = actual_ty(S_look(tenv, f->result));
			if (f->result == NULL) {
				resultTy = Ty_Void();
			}
			Ty_tyList formalTys = make_forml_tylist(tenv, f->params);
			U_boolList formalBools = make_forml_boolist(f->params);
			S_beginScope(venv);
			{
				A_fieldList l; Ty_tyList t; U_boolList b;
				for (l =f->params, t = formalTys,b=formalBools; l; l = l->tail, t = t->tail, b=b->tail) {
					S_enter(venv, l->head->name, E_VarEntry(Tr_allocLocal(pp->head,b->head),t->head));
				}
			}
			struct expty body = transExp(pp->head, venv, tenv, f->body,breakk);
			if (body.ty != resultTy) {
				EM_error(f->pos, "return value mismatch");
			}
			/*未完成 视角位移xxx*/
			Tr_progEntryExit(pp->head, body.exp, Tr_formals(pp->head));
			S_endScope(venv);
		}
		return Tr_nopExp();
	}
	}
	assert(0);
}

Ty_ty transTy(S_table tenv, A_ty a) {
	switch (a->kind)
	{
	case A_arrayTy:
	{
		Ty_ty t = S_look(tenv, a->u.array);
		if (!t) {
			EM_error(a->pos, "%s undefined", S_name(a->u.name));
		}
		return Ty_Array(t);
	}
	case A_recordTy:
	{
		Ty_fieldList tyl = NULL,tylp;
		A_fieldList afl;
		for (afl = a->u.record; afl; afl = afl->tail) {
			Ty_ty typ = S_look(tenv, afl->head->typ);
			if (!typ) {
				EM_error(afl->head->pos, "%s undefined", S_name(afl->head->typ));
			}
			if (tyl == NULL) {
				tyl = Ty_FieldList(Ty_Field(afl->head->name, typ),NULL); 
				tylp = tyl;
			}
			else {
				tylp->tail = Ty_FieldList(Ty_Field(afl->head->name, typ), NULL);
				tylp = tylp->tail;
			}
		}
		return Ty_Record(tyl);
	}
	case A_nameTy:
	{
		Ty_ty ty = S_look(tenv, a->u.name);
		if (!ty) {
			EM_error(a->pos, "%s undefined", S_name(a->u.name));
		}
		return ty;
	}
	}
	assert(0);
}

Ty_ty actual_ty(Ty_ty typ) {
	Ty_ty t = typ;
	for (; t&&t->kind == Ty_name; t = t->u.name.ty);
	return t;
}

Ty_tyList make_forml_tylist(S_table tenv, A_fieldList alist) {
	Ty_tyList ret = NULL,retp;
	for (; alist; alist = alist->tail) {
		Ty_ty ty = actual_ty(S_look(tenv, alist->head->typ));
		if (!ty) {
			EM_error(alist->head->pos, "%s undefined", S_name(alist->head->typ));
		}
		if (ret == NULL) {
			ret = Ty_TyList(ty, NULL);
			retp = ret;
		}
		else {
			retp->tail = Ty_TyList(ty, NULL);
			retp = retp->tail;
		}
	}
	return ret;
}

U_boolList make_forml_boolist(A_fieldList alist) {
	U_boolList ret = NULL,retp;
	for (; alist; alist = alist->tail) {
		if (ret == NULL) {
			ret = U_BoolList(TRUE, NULL);
			retp = ret;
		}
		else {
			retp->tail = U_BoolList(TRUE, NULL);
			retp = retp->tail;
		}
	}
	return ret;
}


F_fragList SEM_transProg(A_exp exp) {
	S_table venv = E_base_venv();
	S_table tenv = E_base_tenv();
	loop_flag = 0;
	Tr_level level = Tr_outmost();
	Tr_exp breakk = Tr_doneExp();
	struct expty e = transExp(level, venv, tenv, exp,breakk);
	Tr_progEntryExit(level, e.exp, NULL);
	return Tr_getResult();
}