#ifndef SEMANT_H
#define SEMANT_H
#include "types.h"
#include "absyn.h"
#include "translate.h"

struct expty
{
	Tr_exp exp;
	Ty_ty ty;
};

struct expty expTy(Tr_exp exp, Ty_ty ty);

struct expty transVar(Tr_level level, S_table venv, S_table tenv, A_var v,Tr_exp breakk);

struct expty transExp(Tr_level level, S_table venv, S_table tenv, A_exp a, Tr_exp breakk);

Tr_exp transDec(Tr_level level, S_table venv, S_table tenv, A_dec d, Tr_exp breakk);

Ty_ty transTy(S_table tenv, A_ty a);

Ty_ty actual_ty(Ty_ty typ);

Ty_tyList make_forml_tylist(S_table tenv, A_fieldList alist);

F_fragList SEM_transProg(A_exp exp);

U_boolList make_forml_boolist(A_fieldList alist);

#endif // !SEMANT_H
