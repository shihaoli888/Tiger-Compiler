#include <stdio.h>
#include <stdlib.h>
#include "util.h"
#include "errormsg.h"
#include "absyn.h"
#include "semant.h"
extern int yyparse(void);

extern A_exp absyn_root;

void parse(string fname)
{
  EM_reset(fname);
  if (yyparse() == 0) /* parsing worked */{
    fprintf(stderr, "Parsing successful!\n");
	SEM_transProg(absyn_root);
  }
  else {
    fprintf(stderr, "Parsing failed\n");
  }
}

int main(int argc, char **argv)
{
  /*if (argc != 2)
  {
    fprintf(stderr, "usage: a.out filename\n");
    exit(1);
  }*/
  parse("testcases/test5.tig");
  printf("Helloworld");
  return 0;
}
