YACC_C = bison
YACC_FLAGS = --yacc -dv -osrc/y.tab.c
LEX_C = flex
LEX_FLAGS = -osrc/lex.yy.c
CC = gcc
CPP_FLAGS = -I include
VPATH = src include
OBJS = parsetest.o errormsg.o util.o symbol.o absyn.o table.o y.tab.o lex.yy.o
.PHONY: all
all: y.tab.c lex.yy.c parsetest.out test

test: parsetest.out
	./$< test.txt 	

parsetest.out: $(OBJS)
	$(CC) -o $@ $^

%.o: %.c
	$(CC) $(CPP_FLAGS) -c -o $@ $<

include $(OBJS:%.o=%.d)

%.d: %.c
	@echo Generating dependencies for $<
	@set -e;\
	$(CC) $(CPP_FLAGS) -MM $< > $@.tmp;\
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.tmp > $@; \
	rm -f $@.tmp

y.tab.h y.tab.c: tiger.y
	$(YACC_C) $(YACC_FLAGS) $+ 
	rm -f src/y.output
	mv src/y.tab.h include 

lex.yy.c:  tiger.lex
	$(LEX_C) $(LEX_FLAGS) $<

.PHONY: clean
clean:
	rm -f *.out *.o *.d
