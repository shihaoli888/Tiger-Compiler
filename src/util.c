#include "util.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

string String(string s) {
	string t = checked_malloc(strlen(s) + 1);
	strcpy(t, s);
	return t;
}

void *checked_malloc(int n) {
	void* p = malloc(n * sizeof(char));
	if (!p) {
		fprintf(stderr, "\nrun out of memory\n");
		exit(1);
	}
	return p;
}

U_boolList U_BoolList(bool head, U_boolList tail) {
	U_boolList tmp = checked_malloc(sizeof(*tmp));
	tmp->head = head;
	tmp->tail = tail;
	return tmp;
}