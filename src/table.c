#include "table.h"
#include <memory.h>
#include "util.h"

TAB_table TAB_empty(void) {
	TAB_table tmp = checked_malloc(sizeof(*tmp));
	tmp->top = NULL;
	//int i;
	memset(tmp->table, 0, sizeof(tmp->table[0])*TABSIZE);
	return tmp;
}

void TAB_enter(TAB_table t, void *key, void *value) {
	int idx = (unsigned int)key %TABSIZE;
	binder tmp = checked_malloc(sizeof(*tmp));
	tmp->key = key;
	tmp->pretop = t->top;
	tmp->value = value;
	tmp->next = t->table[idx];
	t->table[idx] = tmp;
	t->top = key;
}

void *TAB_look(TAB_table t, void *key) {
	if (key == NULL) return NULL;
	int idx = (unsigned int)key % TABSIZE;
	binder p;
	for (p = t->table[idx]; p; p = p->next) {
		if (p->key == key) return p->value;
	}
	return NULL;
}

void *TAB_pop(TAB_table t) {
	if (t->top==NULL) return NULL;
	int idx = (unsigned int)(t->top) % TABSIZE;
	t->top = t->table[idx]->pretop;
	void *ret = t->table[idx]->key;
	t->table[idx] = t->table[idx]->next;
	return ret;
}