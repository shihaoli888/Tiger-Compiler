#include "util.h"
#include "errormsg.h"
#include "semant.h"
#include "env.h"


struct expty expTy(Tr_exp exp, Ty_ty ty) {
	struct expty t;
	t.exp = exp;
	t.ty = ty;
	return t;
}

struct expty transVar(S_table venv, S_table tenv, A_var v) {
	switch (v->kind)
	{
	case A_simpleVar:
	{
		E_enventry x = S_look(venv, v->u.simple);
		if (x&&x->kind == E_varEntry) {
			return expTy(NULL, actual_ty(x->u.var.ty));
		}
		else {
			EM_error(v->pos, "undefined variable %s", S_name(v->u.simple));
		}
	}
	case A_fieldVar:
	{
		E_enventry x = S_look(venv, v->u.field.sym);
		if (x&&x->kind != E_varEntry) {
			EM_error(v->pos, "undefined variable %s", S_name(v->u.field.sym));
		}
		else {
			if ((x->u.var.ty)->kind != Ty_record) {
				EM_error(v->pos, "%s not a record", S_name(v->u.field.sym));
			}
			S_beginScope(venv);
			Ty_fieldList fl = (x->u.var.ty)->u.record;
			for (; fl; fl = fl->tail) {
				S_enter(venv, fl->head->name, E_VarEntry(fl->head->ty));
			}
			struct expty var = transVar(venv, tenv, v->u.field.var);
			S_endScope(venv);
			return var;
		}
	}
	case A_subscriptVar:
	{
		struct expty var = transVar(venv, tenv, v->u.subscript.var);
		if ((var.ty)->kind != Ty_array) {
			EM_error(v->pos, "%s is not array", S_name((var.ty)->u.name));
		}
		struct expty exp = transExp(venv, tenv, v->u.subscript.exp);
		if ((exp.ty)->kind != Ty_int) {
			EM_error(v->pos, "index should be interge");
		}
		return expTy(NULL, actual_ty((var.ty)->u.array));
	}
	}
	assert(0);
}

struct expty transExp(S_table venv, S_table tenv, A_exp a){
	switch (a->kind)
	{
	case A_varExp:
	{
		return transVar(venv, tenv, a->u.var);
	}
	case A_nilExp:
	{
		return expTy(NULL, Ty_Nil());
	}
	case A_intExp:
	{
		return expTy(NULL, Ty_Int());
	}
	case A_stringExp:
	{
		return expTy(NULL, Ty_String());
	}
	case A_callExp:
	{
		A_expList args = a->u.call.args;
		Ty_tyList ats = NULL;
		for (; args; args = args->tail) {
			struct expty e = transExp(venv, tenv, args->head);
			ats = Ty_TyList(e.ty, ats);
		}
		E_enventry func = S_look(venv, a->u.call.func);
		if (func == NULL) {
			EM_error(a->pos, "function %s undefined", S_name(a->u.call.func));
		}
		Ty_tyList pargs = func->u.fun.formals;
		//cmp real parameter and formal paramter
		for (; pargs&&ats; pargs = pargs->tail, ats = ats->tail) {
			if (pargs->head->kind != ats->head->kind) {
				EM_error(a->pos, "parameter mismach");
			}
		}
		return expTy(NULL, func->u.fun.result);
	}
	case A_opExp:
	{
		A_oper oper = a->u.op.oper;
		struct expty left = transExp(venv, tenv, a->u.op.left);
		struct expty right = transExp(venv, tenv, a->u.op.right);
		if (op == A_plusOp || op == A_minusOp || op == A_timesOp || op == A_divideOp) {
			if (left.ty->kind != Ty_int) {
				EM_error(a->u.op.left->pos, "integer required");
			}
			if (right.ty->kind != Ty_int) {
				EM_error(a->u.op.right->pos, "integer required");
			}
		}
		// cmp op need equal type
		if (left.ty->kind != right.ty->kind) {
			EM_error(a->u.op.left->pos, "same type required");
		}
		return expTy(NULL, Ty_Int());
	}
	case A_recordExp:
	{
		Ty_ty typ = S_look(tenv, a->u.record.typ);
		if (typ == NULL) {
			EM_error(a->pos, "type %s undefined", S_name(a->u.record.typ));
		}
		if (typ->kind != Ty_record) {
			EM_error(a->pos, "record type required");
		}
		A_efieldList tl = a->u.record.fields;
		//遍历查域名和类型是否对应存在
		for (; tl; tl = tl->tail) {
			S_symbol name = tl->head->name;
			struct expty e = transExp(venv, tenv, tl->head->exp);
			Ty_fieldList tmp = (typ->u.record)->head;
			int flag = 0;
			for (; tmp; tmp = tmp->tail) {
				if (name == tmp->head->name && e.ty == tmp->head->ty) {
					flag = 1;
					break;
				}
			}
			if (!flag) {
				EM_error(a->pos, "mismatch type %s ", S_name(name));
			}
		}
		return expTy(NULL, typ);
	}
	case A_seqExp:
	{
		A_expList tmp = a->u.seq;
		Ty_ty ret=Ty_Void();
		for (; tmp; tmp = tmp->tail) {
			struct expty e = transExp(venv, tenv, tmp->head);
			ret = e.ty;
		}
		return expTy(NULL, ret);
	}
	case A_assignExp:
	{
		struct expty lvalue = transVar(venv, tenv, a->u.assign.var);
		struct expty e = transExp(venv, tenv, a->u.assign.exp);
		if ((e.ty)->kind == Ty_void) {
			EM_error(a->pos, "right value can't be Void");
		}
		if (lvalue.ty != e.ty) {
			EM_error(a->pos, "assignment need same type");
		}
		return expTy(NULL, Ty_Void());
	}
	case A_ifExp:
	{
		struct expty e1 = transExp(venv, tenv, a->u.iff.test);
		struct expty e2 = transExp(venv, tenv, a->u.iff.then);
		if (a->u.iff.elsee == NULL) {
			if ((e2.ty)->kind != Ty_void) {
				EM_error(a->pos, "then must be a void expression");
			}
			return expTy(NULL, Ty_Void());
		}
		else {
			struct expty e3 = transExp(venv, tenv, a->u.iff.elsee);
			if (e2.ty != e3.ty) {
				EM_error(a->pos, "then and else must hava same value");
			}
			return expTy(NULL, e2.ty);
		}
	}
	case A_whileExp:
	{
		struct expty test = transExp(venv, tenv, a->u.whilee.test);
		struct expty body = transExp(venv, tenv, a->u.whilee.body);
		if ((body.ty)->kind != Ty_void) {
			EM_error("while 's body must be a void expression");
		}
		return expTy(NULL, Ty_Void());
	}
	case A_forExp:
	{
		//隐式申明变量
		S_beginScope(venv);
		S_enter(venv, a->u.forr.var, E_VarEntry(Ty_Int()));
		struct expty e1 = transExp(venv, tenv, a->u.forr.lo);
		struct expty e2 = transExp(venv, tenv, a->u.forr.hi);
		if ((e1.ty)->kind != Ty_int || (e2.ty)->kind != Ty_int) {
			EM_error(a->pos, "lo and hi must be int expression");
		}
		struct expty e3 = transExp(venv, tenv, a->u.forr.body);
		if ((e3.ty)->kind != Ty_void) {
			EM_error(a->pos, "body must be a void expression");
		}
		S_endScope(venv);
		return expty(NULL, Ty_Void());
	}
	case A_breakExp:
	{
		return expTy(NULL, Ty_Void());
	}
	case A_letExp:
	{
		struct expty exp;
		A_decList d;
		S_beginScope(venv);
		S_beginScope(tenv);
		for (d = a->u.let.decs; d; d = d->tail) {
			transDec(venv, tenv, d->head);
		}
		exp = transExp(venv, tenv, a->u.let.body);
		S_endScope(tenv);
		S_endScope(venv);
		return exp;
	}
	case A_arrayExp:
	{
		Ty_ty typ = S_look(tenv, a->u.array.typ);
		if (typ->kind != Ty_array) {
			EM_error(a->pos, "%s is no array type", S_name(a->u.array.typ));
		}
		struct expty e1 = transExp(tenv, venv, a->u.array.size);
		struct expty e2 = transExp(tenv, venv, a->u.array.init);
		if ((e1.ty)->kind != Ty_int ) {
			EM_error(a->pos, "array size must be int");
		}
		if ((e2.ty)->kind != Ty_int) {
			EM_error(a->pos, "array init must be int");
		}
	}
	}
	assert(0);
}

void transDec(S_table venv, S_table tenv, A_dec d) {
	switch (d->kind)
	{
	case A_varDec:
	{
		struct expty e = transExp(venv, tenv, d->u.var.init);
		if (d->u.var.typ != NULL) {
			Ty_ty t = S_look(tenv, d->u.var.typ);
			if((e.ty)->kind==Ty_nil&&(e.ty)->kind!=Ty_record){
				EM_error(d->pos, "nil can only init record");
			}
			if (t != e.ty) {
				EM_error(d->pos, "type and init mismatch");
			}
		}
		S_enter(venv, d->u.var.var, E_VarEntry(e.ty));
		return;
	}
	case A_typeDec:
	{
		A_nametyList tmp = d->u.type;
		for (; tmp; tmp = tmp->tail) {
			S_enter(tenv, tmp->head->name, transTy(tenv,tmp->head->ty));
		}
		return;
	}
	case A_functionDec:
	{
		A_fundecList funcs = d->u.function;
		for (; funcs; funcs = funcs->tail) {
			A_fundec f = funcs->head;
			Ty_ty resultTy = S_look(tenv, f->result);
			if (f->result == NULL) {
				resultTy = Ty_Void();
			}
			else if (!resultTy) {
				EM_error(f->pos, "undefined %s", S_name(f->result));
			}
			else;
			Ty_tyList formalTys = make_forml_tylist(tenv, f->params);
			S_enter(venv, f->name, E_FunEntry(formalTys, resultTy));
			S_beginScope(venv);
			{
				A_fieldList l; Ty_tyList t;
				for (l = f->params, t = formalTys; l; l = l->tail, t = t->tail) {
					S_enter(venv, l->head->name, E_VarEntry(t->head));
				}
			}
			struct expty body = transExp(venv, tenv, f->body);
			if (body.ty != resultTy) {
				EM_error(f->pos, "return value mismatch");
			}
			S_endScope(venv);
		}
		return;
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
		return Ty_Array(a->u.array);
	}
	case A_recordTy:
	{
		Ty_tyList tlist = make_forml_tylist(tenv, a->u.record);
		return Ty_Record(tlist);
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
	Ty_tyList ret = NULL;
	for (; alist; alist = alist->tail) {
		Ty_ty ty = S_look(tenv, alist->head->typ);
		if (!ty) {
			EM_error(alist->head->pos, "%s undefined", S_name(alist->head->typ));
		}
		ret = Ty_TyList(ty,ret);
	}
	return ret;
}