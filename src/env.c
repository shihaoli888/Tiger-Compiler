#include "env.h"
#include "util.h"

E_enventry E_VarEntry(Tr_access access ,Ty_ty ty) {
	E_enventry tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = E_varEntry;
	tmp->u.var.ty = ty;
	tmp->u.var.access = access;
	return tmp;
}

E_enventry E_FunEntry(Tr_level level, Temp_label label, Ty_tyList formals, Ty_ty result) {
	E_enventry tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = E_funEntry;
	tmp->u.fun.formals = formals;
	tmp->u.fun.result = result;
	tmp->u.fun.label = label;
	tmp->u.fun.level = level;
	return tmp;
}


S_table E_base_tenv(void) {
	S_table tmp = S_empty();
	S_beginScope(tmp);
	S_enter(tmp, S_Symbol(String("int")), Ty_Int());
	S_enter(tmp, S_Symbol(String("string")), Ty_String());
	return tmp;
}
S_table E_base_venv(void) {
	S_table tmp = S_empty();
	S_beginScope(tmp);
	return tmp;
}