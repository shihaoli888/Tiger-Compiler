#ifndef TRANSLATE_H
#define TRANSLATE_H
#include "temp.h"
#include "absyn.h"
#include "frame.h"
typedef struct Tr_access_ *Tr_access;
typedef struct Tr_accessList_ *Tr_accessList;
typedef struct Tr_level_ *Tr_level;
typedef struct Tr_levelList_ *Tr_levelList;
typedef struct Tr_exp_ *Tr_exp;
typedef struct Tr_expList_ *Tr_expList;

struct Tr_expList_ {
	Tr_exp head;
	Tr_expList tail;
};

struct Tr_accessList_
{
	Tr_access head;
	Tr_accessList tail;
};

struct Tr_levelList_
{
	Tr_level head;
	Tr_levelList tail;
};

Tr_expList Tr_ExpList(Tr_exp head, Tr_expList tail);
Tr_levelList Tr_LevelList(Tr_level head, Tr_levelList tail);
Tr_accessList Tr_AccessList(Tr_access head, Tr_accessList tail);
Tr_level Tr_outmost(void);
Tr_level Tr_newLevel(Tr_level parent, Temp_label name, U_boolList formals);
Tr_accessList Tr_formals(Tr_level level);
Tr_access Tr_allocLocal(Tr_level level, bool escape);
Temp_label Tr_levelName(Tr_level level);

Tr_exp Tr_simpleVar(Tr_access acc, Tr_level lev);
Tr_exp Tr_fieldVar(Tr_exp base, Tr_exp offset);
Tr_exp Tr_subsriptVar(Tr_exp base, Tr_exp offset);
Tr_exp Tr_opExp(Tr_exp left, Tr_exp right, A_oper op);
Tr_exp Tr_iffExp(Tr_exp test, Tr_exp then, Tr_exp elsess);
Tr_exp Tr_recordExp(Tr_expList exps, int offsets[], int n);
Tr_exp Tr_arrayExp(Tr_exp init, Tr_exp size);
Tr_exp Tr_breakExp(Tr_exp breakk);
Tr_exp Tr_doneExp(void);
Tr_exp Tr_whileExp(Tr_exp test, Tr_exp body, Tr_exp breakk);
Tr_exp Tr_forExp(Tr_exp i, Tr_exp lo, Tr_exp hi, Tr_exp body, Tr_exp breakk);
Tr_exp Tr_callExp(Temp_label name, Tr_expList args, Tr_level calllevel, Tr_level funlevel);
Tr_exp Tr_letExp(Tr_expList lets);
Tr_exp Tr_assignExp(Tr_exp lv, Tr_exp rv);
Tr_exp Tr_nopExp(void);
Tr_exp Tr_nilExp(void);
Tr_exp Tr_intExp(int v);
Tr_exp Tr_stringExp(string s);
Tr_exp Tr_seqExp(Tr_expList seq);



void Tr_progEntryExit(Tr_level level, Tr_exp body, Tr_accessList formals);

F_fragList Tr_getResult(void);

#endif // !TRANSLATE_H
