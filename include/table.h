#ifndef TABLE_H
#define TABLE_H

#define TABSIZE 109

typedef struct binder_* binder;

struct binder_
{
	void* key;
	void* value;
	binder next;
	void *pretop;
};

typedef struct TAB_table_ *TAB_table;

struct TAB_table_
{
	binder table[TABSIZE];
	void* top;
};

TAB_table TAB_empty(void);

void TAB_enter(TAB_table t, void *key, void *value);

void *TAB_look(TAB_table t, void *key);

void *TAB_pop(TAB_table t);

#endif // !TABLE_H