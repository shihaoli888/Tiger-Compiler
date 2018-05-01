#ifndef SYMBOL_H
#define SYMBOL_H
#include "util.h"
#include "table.h"

struct S_symbol_
{
	string name;
	S_symbol next;
};

typedef struct S_symbol_ *S_symbol;

S_symbol S_Symbol(string name);

string S_name(S_symbol sym);

typedef struct TAB_table_ *S_table;

S_table S_empty(void);

void S_enter(S_table t, S_symbol sym, void *value);

void *S_look(S_table t, S_symbol sym);

void S_beginScope(S_table t);

void S_endScope(S_table t);

#endif // !SYMBOL_H