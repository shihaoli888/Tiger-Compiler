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
	S_enter(tmp,S_Symbol(String("printStr")),E_FunEntry(NULL, Temp_namedlabel("printStr"),Ty_TyList(Ty_String(),NULL), Ty_Void()));
	S_enter(tmp,S_Symbol(String("printInt")),E_FunEntry(NULL, Temp_namedlabel("printInt"),Ty_TyList(Ty_Int(),NULL), Ty_Void()));
	S_enter(tmp,S_Symbol(String("flush")),E_FunEntry(NULL, Temp_namedlabel("flush"),NULL, Ty_Void()));
	S_enter(tmp,S_Symbol(String("tigerGetchar")),E_FunEntry(NULL, Temp_namedlabel("tigerGetchar"),NULL, Ty_String()));
	S_enter(tmp,S_Symbol(String("ord")),E_FunEntry(NULL, Temp_namedlabel("ord"),Ty_TyList(Ty_String(),NULL), Ty_Int()));
	S_enter(tmp,S_Symbol(String("chr")),E_FunEntry(NULL, Temp_namedlabel("chr"),Ty_TyList(Ty_Int(),NULL), Ty_String()));
	S_enter(tmp,S_Symbol(String("size")),E_FunEntry(NULL, Temp_namedlabel("size"),Ty_TyList(Ty_String(),NULL), Ty_Int()));
	S_enter(tmp,S_Symbol(String("substring")),E_FunEntry(NULL, Temp_namedlabel("substring"),Ty_TyList(Ty_String(),Ty_TyList(Ty_Int(),Ty_TyList(Ty_Int(),NULL))), Ty_String()));
	S_enter(tmp,S_Symbol(String("concat")),E_FunEntry(NULL, Temp_namedlabel("concat"),Ty_TyList(Ty_String(),Ty_TyList(Ty_String(),NULL)), Ty_String()));
	S_enter(tmp,S_Symbol(String("not")),E_FunEntry(NULL, Temp_namedlabel("not"),Ty_TyList(Ty_Int(),NULL), Ty_Int()));
	S_enter(tmp,S_Symbol(String("tigerExit")),E_FunEntry(NULL, Temp_namedlabel("tigerExit"),Ty_TyList(Ty_Int(),NULL), Ty_Void()));
	S_enter(tmp,S_Symbol(String("stringcmp")),E_FunEntry(NULL, Temp_namedlabel("stringcmp"),Ty_TyList(Ty_String(),Ty_TyList(Ty_String(),NULL)), Ty_Int()));
	return tmp;
}