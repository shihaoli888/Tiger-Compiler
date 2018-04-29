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