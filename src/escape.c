#include "escape.h"
#include "symbol.h"
#include "absyn.h"

typedef struct EscapeEntry_
{
	int d;
	bool* escape;
}* escape_entry;

escape_entry Escape_Entry(int d, bool* escape) {
	escape_entry tmp = checked_malloc(sizeof(*tmp));
	tmp->d = d;
	tmp->escape = escape;
	return tmp;
}

static void traverseExp(S_table env, int depth, A_exp e);
static void traverseDec(S_table env, int depth, A_dec d);
static void traverseVar(S_table env, int depth, A_var v);


static void traverseExp(S_table env, int depth, A_exp a) {
	switch (a->kind)
	{
	case A_varExp:
	{
		traverseVar(env, depth, a->u.var);
		return;
	}
	case A_nilExp:
	case A_intExp:
	case A_stringExp:
		return;
	case A_callExp:
	{
		A_expList args = a->u.call.args;
		for (; args; args = args->tail) {
			traverseExp(env, depth, args->head);
		}
		return;
	}
	case A_opExp:
	{
		traverseExp(env, depth, a->u.op.left);
		traverseExp(env, depth, a->u.op.right);
		return;
	}
	case A_recordExp:
	{
		A_efieldList tl = a->u.record.fields;
		for (; tl; tl = tl->tail) {
			traverseExp(env, depth, tl->head->exp);
		}
		return;
	}
	case A_seqExp:
	{
		A_expList tmp = a->u.seq;
		for (; tmp; tmp = tmp->tail) {
			traverseExp(env, depth, tmp->head);
		}
		return;
	}
	case A_assignExp:
	{
		traverseVar(env, depth, a->u.assign.var);
		traverseExp(env, depth, a->u.assign.exp);
		return;
	}
	case A_ifExp:
	{
		traverseExp(env, depth, a->u.iff.test);
		traverseExp(env, depth, a->u.iff.then);
		if (a->u.iff.elsee) {
			traverseExp(env, depth, a->u.iff.elsee);
		}
		return;
	}
	case A_whileExp:
	{
		traverseExp(env, depth, a->u.whilee.test);
		traverseExp(env, depth, a->u.whilee.body);
		return;
	}
	case A_forExp:
	{
		S_beginScope(env);
		a->u.forr.escape = FALSE;
		S_enter(env, a->u.forr.var, Escape_Entry(depth, &(a->u.forr.escape)));
		traverseExp(env, depth,a->u.forr.lo);
		traverseExp(env, depth,a->u.forr.hi);
		traverseExp(env, depth,a->u.forr.body);
		S_endScope(env);
		return;
	}
	case A_breakExp:
		return;
	case A_letExp:
	{
		S_beginScope(env);
		A_decList d;
		for (d = a->u.let.decs; d; d = d->tail) {
			traverseDec(env, depth, d->head);
		}
		traverseExp(env, depth, a->u.let.body);
		S_endScope(env);
		return;
	}
	case A_arrayExp:
	{
		traverseExp(env, depth, a->u.array.size);
		traverseExp(env, depth, a->u.array.init);
		return;
	}
	}
}

static void traverseDec(S_table env, int depth, A_dec d) {
	switch (d->kind)
	{
	case A_varDec:
	{
		traverseExp(env, depth, d->u.var.init);
		d->u.var.escape = FALSE;
		S_enter(env, d->u.var.var, Escape_Entry(depth, &(d->u.var.escape)));
		return;
	}
	case A_typeDec:
	{
		return;
	}
	case A_functionDec:
	{
		A_fundecList funcs = d->u.function;
		for (; funcs; funcs = funcs->tail) {
			A_fundec f = funcs->head;
			S_beginScope(env);
			{
				A_fieldList l;
				for (l = f->params; l; l = l->tail) {
					l->head->escape = FALSE;
					S_enter(env, l->head->name, Escape_Entry(depth + 1, &(l->head->escape)));
				}
			}
			traverseExp(env, depth + 1, f->body);
			S_endScope(env);
		}
		return;
	}

	}
}


static void traverseVar(S_table env, int depth, A_var v) {
	switch (v->kind)
	{
	case A_simpleVar:
	{
		escape_entry x = S_look(env, v->u.simple);
		if (x) {
			if (depth > x->d) x->escape = TRUE;
		}
		return;
	}
	case A_fieldVar:
	{
		traverseVar(env, depth, v->u.field.var);
		return;
	}
	case A_subscriptVar:
	{
		traverseVar(env, depth, v->u.subscript.var);
		traverseExp(env, depth, v->u.subscript.exp);
		return;
	}
	}
}



void Esc_findescape(A_exp exp) {
	S_table escape_table = S_empty();
	S_beginScope(escape_table);
	traverseExp(escape_table, 0, exp);
}