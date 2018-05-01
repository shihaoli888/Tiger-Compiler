#include "symbol.h"
#include "table.h"
#include <string.h>

static S_symbol mksymbol(string name, S_symbol next) {
	S_symbol s = checked_malloc(sizeof(*s));
	s->name = name;
	s->next = next;
}

#define SYMTABLESIZE 109

static S_symbol hashtable[SYMTABLESIZE];

static unsigned int hash(char* s0) {
	unsigned int h = 0;
	char *s;
	for (s = s0; *s; s++) {
		h = h * 65599 + *s;
	}
	return h;
}

S_symbol S_Symbol(string name) {
	int idx = hash(name) % SYMTABLESIZE;
	S_symbol syms = hashtable[idx], sym;
	for (sym = syms; sym; sym = sym->next) {
		if (0 == strcmp(sym->name, name)) return sym;
	}
	sym = mksymbol(name,syms);
	hashtable[idx] = sym;
	return sym;
}

string S_name(S_symbol sym) {
	return sym->name;
}


S_table S_empty(void) {
	return TAB_empty();
}

void S_enter(S_table t, S_symbol sym, void *value) {
	TAB_enter(t, sym, value);
}

void *S_look(S_table t, S_symbol sym) {
	return TAB_look(t, sym);
}

static struct  S_symbol_ marksym = { "<mark>",0 };
void S_beginScope(S_table t) {
	S_enter(t, &marksym, NULL);
}

void S_endScope(S_table t) {
	S_symbol s;
	do {
		s = TAB_pop(t);
	} while (s != &marksym);
}