#ifndef SEMANT_H
#define SEMANT_H
#include "types.h"
#include "absyn.h"

typedef void* Tr_exp;
struct expty
{
	Tr_exp exp;
	Ty_ty ty;
};

struct expty expTy(Tr_exp exp, Ty_ty ty);

struct expty transVar(S_table venv, S_table tenv, A_var v);

struct expty transExp(S_table venv, S_table tenv, A_exp a);

void transDec(S_table venv, S_table tenv, A_dec d);

Ty_ty transTy(S_table tenv, A_ty a);

Ty_ty actual_ty(Ty_ty typ);

Ty_tyList make_forml_tylist(S_table tenv, A_fieldList alist);

#endif // !SEMANT_H
