#include "util.h"
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>

string String(string s) {
	string t = checked_malloc(strlen(s) + 1);
	strcpy(t, s);
	return t;
}

string FormatString(string s, ...){
	va_list ap;
	char tmp[50];
	va_start(ap, s);
	int len = vsnprintf(tmp, 50, s, ap);
	va_end(ap);
	string res = checked_malloc(len+1);
	strcpy(res, tmp);
	return res;
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