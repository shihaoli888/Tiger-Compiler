#include "env.h"
#include "util.h"

E_enventry E_VarEntry(Ty_ty ty) {
	E_enventry tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = E_varEntry;
	tmp->u.var.ty = ty;
	return tmp;
}

E_enventry E_FunEntry(Ty_tyList formals, Ty_ty result) {
	E_enventry tmp = checked_malloc(sizeof(*tmp));
	tmp->kind = E_funEntry;
	tmp->u.fun.formals = formals;
	tmp->u.fun.result = result;
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