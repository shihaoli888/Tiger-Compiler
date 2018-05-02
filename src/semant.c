#include "util.h"
#include "errormsg.h"
#include "semant.h"
#include "env.h"

static int loop_flag = 0;
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
		struct expty var = transVar(venv, tenv, v->u.field.var);
		if ((var.ty)->kind != Ty_record) {
			EM_error(v->pos, "%s not record member",S_name(v->u.field.sym));
		}
		else {
			Ty_fieldList tmp = (var.ty)->u.record;
			for (; tmp; tmp = tmp->tail) {
				if (tmp->head->name == (v->u.field.sym)) {
					return expTy(NULL, actual_ty(tmp->head->ty));
				}
			}
			EM_error(v->pos, "%s undefined", S_name(v->u.field.sym));
		}
	}
	case A_subscriptVar:
	{
		struct expty var = transVar(venv, tenv, v->u.subscript.var);
		if ((var.ty)->kind != Ty_array) {
			EM_error(v->pos, "variable is not array");
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
		int count = 0;
		for (; args; args = args->tail) {
			struct expty e = transExp(venv, tenv, args->head);
			ats = Ty_TyList(e.ty, ats);
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
			if (actual_ty(pargs->head)->kind == Ty_record && actual_ty(ats->head) == Ty_nil) continue;
			if (actual_ty(pargs->head) != actual_ty(ats->head)) {
				EM_error(a->pos, "parameter mismach");
			}
		}
		return expTy(NULL, actual_ty(func->u.fun.result));
	}
	case A_opExp:
	{
		A_oper op = a->u.op.oper;
		struct expty left = transExp(venv, tenv, a->u.op.left);
		struct expty right = transExp(venv, tenv, a->u.op.right);
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
		return expTy(NULL, Ty_Int());
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
		//遍历查域名和类型是否对应存在
		for (; tl; tl = tl->tail) {
			S_symbol name = tl->head->name;
			struct expty e = transExp(venv, tenv, tl->head->exp);
			Ty_fieldList tmp = typ->u.record;
			int flag = 0;
			for (; tmp; tmp = tmp->tail) {
				if (name == tmp->head->name && (actual_ty(e.ty) == actual_ty(tmp->head->ty)|| 
					actual_ty(e.ty)->kind==Ty_nil && actual_ty(tmp->head->ty)->kind==Ty_record
					)) {
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
		return expTy(NULL, actual_ty(ret));
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
		//for break exp
		int pre_loop_flag = loop_flag;
		loop_flag = 1;
		struct expty body = transExp(venv, tenv, a->u.whilee.body);
		loop_flag = pre_loop_flag;
		if ((body.ty)->kind != Ty_void) {
			EM_error(a->pos,"while 's body must be a void expression");
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
		//for break exp
		int pre_loop_flag = loop_flag;
		loop_flag = 1;
		struct expty e3 = transExp(venv, tenv, a->u.forr.body);
		loop_flag = pre_loop_flag;
		if ((e3.ty)->kind != Ty_void) {
			EM_error(a->pos, "body must be a void expression");
		}
		S_endScope(venv);
		return expTy(NULL, Ty_Void());
	}
	case A_breakExp:
	{
		if (!loop_flag) {
			EM_error(a->pos, "break out of for or while");
		}
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
		Ty_ty typ = actual_ty(S_look(tenv, a->u.array.typ));
		if (typ->kind != Ty_array) {
			EM_error(a->pos, "%s is no array type", S_name(a->u.array.typ));
		}
		struct expty e1 = transExp(venv, tenv, a->u.array.size);
		struct expty e2 = transExp(venv, tenv, a->u.array.init);
		if ((e1.ty)->kind != Ty_int ) {
			EM_error(a->pos, "array size must be int");
		}
		if (e2.ty != actual_ty(typ->u.array)) {
			EM_error(a->pos, "initializing exp and array type differ");
		}
		return expTy(NULL, typ);
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
			Ty_ty t = actual_ty(S_look(tenv, d->u.var.typ));
			if((e.ty)->kind==Ty_nil){
				if(t->kind != Ty_record)
					EM_error(d->pos, "nil can only init record");
			}
			else if(t != e.ty) {
				EM_error(d->pos, "type and init mismatch");
			}
		}
		S_enter(venv, d->u.var.var, E_VarEntry(e.ty));
		return;
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
		return;
	}
	case A_functionDec:
	{
		A_fundecList funcs = d->u.function;
		//收集函数头
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
			S_enter(venv, f->name, E_FunEntry(formalTys, resultTy));
		}
		funcs = d->u.function;
		for (; funcs; funcs = funcs->tail) {
			A_fundec f = funcs->head;
			Ty_ty resultTy = actual_ty(S_look(tenv, f->result));
			if (f->result == NULL) {
				resultTy = Ty_Void();
			}
			Ty_tyList formalTys = make_forml_tylist(tenv, f->params);
			S_beginScope(venv);
			{
				A_fieldList l; Ty_tyList t;
				A_fieldList ll = NULL;
				//参数倒过来，因为我其他都是倒着来的
				for (l = f->params; l; l = l->tail) {
					ll=A_FieldList(l->head, ll);
				}
				for (l =ll, t = formalTys; l; l = l->tail, t = t->tail) {
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
		return Ty_Array(t);
	}
	case A_recordTy:
	{
		Ty_fieldList tyl = NULL;
		A_fieldList afl;
		for (afl = a->u.record; afl; afl = afl->tail) {
			Ty_ty typ = S_look(tenv, afl->head->typ);
			if (!typ) {
				EM_error(afl->head->pos, "%s undefined", S_name(afl->head->typ));
			}
			tyl = Ty_FieldList(Ty_Field(afl->head->name, typ), tyl);
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
	Ty_tyList ret = NULL;
	for (; alist; alist = alist->tail) {
		Ty_ty ty = actual_ty(S_look(tenv, alist->head->typ));
		if (!ty) {
			EM_error(alist->head->pos, "%s undefined", S_name(alist->head->typ));
		}
		ret = Ty_TyList(ty,ret);
	}
	return ret;
}

void SEM_transProg(A_exp exp) {
	S_table venv = E_base_venv();
	S_table tenv = E_base_tenv();
	loop_flag = 0;
	struct expty e = transExp(venv, tenv, exp);
}