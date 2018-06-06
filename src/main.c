#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regalloc.h>
#include <tree.h>
#include "frame.h"
#include "canon.h"
#include "util.h"
#include "errormsg.h"
#include "absyn.h"
#include "semant.h"
#include "frame.h"
#include "assem.h"
#include "codegen.h"
#include "flowgraph.h"
#include "liveness.h"
#include "color.h"


extern int yyparse(void);

extern A_exp absyn_root;

#ifdef _DEBUG

#include "temp.h"

static void pr_tree_exp(FILE *out, T_exp exp, int d);

static void indent(FILE *out, int d) {
	int i;
	for (i = 0; i <= d; i++)
		fprintf(out, " ");
}

static char bin_oper[][12] = {
		"PLUS", "MINUS", "TIMES", "DIVIDE",
		"AND", "OR", "LSHIFT", "RSHIFT", "ARSHIFT", "XOR"
};

static char rel_oper[][12] = {
		"EQ", "NE", "LT", "GT", "LE", "GE", "ULT", "ULE", "UGT", "UGE"
};

static void pr_stm(FILE *out, T_stm stm, int d) {
	switch (stm->kind) {
	case T_SEQ:
		indent(out, d);
		fprintf(out, "SEQ(\n");
		pr_stm(out, stm->u.SEQ.left, d + 1);
		fprintf(out, ",\n");
		pr_stm(out, stm->u.SEQ.right, d + 1);
		fprintf(out, ")");
		break;
	case T_LABEL:
		indent(out, d);
		fprintf(out, "LABEL %s", S_name(stm->u.LABEL));
		break;
	case T_JUMP:
		indent(out, d);
		fprintf(out, "JUMP(\n");
		pr_tree_exp(out, stm->u.JUMP.exp, d + 1);
		fprintf(out, ")");
		break;
	case T_CJUMP:
		indent(out, d);
		fprintf(out, "CJUMP(%s,\n", rel_oper[stm->u.CJUMP.op]);
		pr_tree_exp(out, stm->u.CJUMP.left, d + 1);
		fprintf(out, ",\n");
		pr_tree_exp(out, stm->u.CJUMP.right, d + 1);
		fprintf(out, ",\n");
		indent(out, d + 1);
		fprintf(out, "%s,", S_name(stm->u.CJUMP.true));
		fprintf(out, "%s", S_name(stm->u.CJUMP.false));
		fprintf(out, ")");
		break;
	case T_MOVE:
		indent(out, d);
		fprintf(out, "MOVE(\n");
		pr_tree_exp(out, stm->u.MOVE.dst, d + 1);
		fprintf(out, ",\n");
		pr_tree_exp(out, stm->u.MOVE.src, d + 1);
		fprintf(out, ")");
		break;
	case T_EXP:
		indent(out, d);
		fprintf(out, "EXP(\n");
		pr_tree_exp(out, stm->u.EXP, d + 1);
		fprintf(out, ")");
		break;
	}
}

static void pr_tree_exp(FILE *out, T_exp exp, int d) {
	switch (exp->kind) {
	case T_BINOP:
		indent(out, d);
		fprintf(out, "BINOP(%s,\n", bin_oper[exp->u.BINOP.op]);
		pr_tree_exp(out, exp->u.BINOP.left, d + 1);
		fprintf(out, ",\n");
		pr_tree_exp(out, exp->u.BINOP.right, d + 1);
		fprintf(out, ")");
		break;
	case T_MEM:
		indent(out, d);
		fprintf(out, "MEM");
		fprintf(out, "(\n");
		pr_tree_exp(out, exp->u.MEM, d + 1);
		fprintf(out, ")");
		break;
	case T_TEMP:
		indent(out, d);
		fprintf(out, "TEMP t%d", getTmpnum(exp->u.TEMP));
		break;
	case T_ESEQ:
		indent(out, d);
		fprintf(out, "ESEQ(\n");
		pr_stm(out, exp->u.ESEQ.stm, d + 1);
		fprintf(out, ",\n");
		pr_tree_exp(out, exp->u.ESEQ.exp, d + 1);
		fprintf(out, ")");
		break;
	case T_NAME:
		indent(out, d);
		fprintf(out, "NAME %s", S_name(exp->u.NAME));
		break;
	case T_CONST:
		indent(out, d);
		fprintf(out, "CONST %d", exp->u.CONST);
		break;
	case T_CALL: {
		T_expList args = exp->u.CALL.args;
		indent(out, d);
		fprintf(out, "CALL(\n");
		pr_tree_exp(out, exp->u.CALL.fun, d + 1);
		for (; args; args = args->tail) {
			fprintf(out, ",\n");
			pr_tree_exp(out, args->head, d + 2);
		}
		fprintf(out, ")");
		break;
	}
	} /* end of switch */
}

void printStmList(FILE *out, T_stmList stmList) {
	for (; stmList; stmList = stmList->tail) {
		pr_stm(out, stmList->head, 0);
		fprintf(out, "\n\n\n");
	}
}

// vis file prepare

static int nodeId;

static void printVisStm(FILE *out, T_stm stm, int parent);

static void printVisTreeExp(FILE *out, T_exp exp, int parent);

void printVisStmList(FILE *out, T_stmList stmList) {
	nodeId = 0;
	for (; stmList; stmList = stmList->tail) {
		printVisStm(out, stmList->head, 0);
	}
}

static void printVisStm(FILE *out, T_stm stm, int parent) {
	int newParent;
	switch (stm->kind) {
	case T_SEQ:
		fprintf(out, "%d SEQ\n", parent);
		++nodeId;
		newParent = nodeId;
		printVisStm(out, stm->u.SEQ.left, newParent);
		printVisStm(out, stm->u.SEQ.right, newParent);
		break;
	case T_LABEL:
		fprintf(out, "%d LABEL(%s)\n", parent, S_name(stm->u.LABEL));
		++nodeId;
		break;
	case T_JUMP:
		fprintf(out, "%d JUMP\n", parent);
		++nodeId;
		newParent = nodeId;
		printVisTreeExp(out, stm->u.JUMP.exp, newParent);
		break;
	case T_CJUMP:
		fprintf(out, "%d CJUMP\n", parent);
		++nodeId;
		newParent = nodeId;
		fprintf(out, "%d %s\n", newParent, rel_oper[stm->u.CJUMP.op]);
		++nodeId;
		printVisTreeExp(out, stm->u.CJUMP.left, newParent); // -1 to get parentid
		printVisTreeExp(out, stm->u.CJUMP.right, newParent);
		fprintf(out, "%d %s\n", newParent, S_name(stm->u.CJUMP.true));
		++nodeId;
		fprintf(out, "%d %s\n", newParent, S_name(stm->u.CJUMP.false));
		++nodeId;
		break;
	case T_MOVE:
		fprintf(out, "%d MOVE\n", parent);
		++nodeId;
		newParent = nodeId;
		printVisTreeExp(out, stm->u.MOVE.dst, newParent);
		printVisTreeExp(out, stm->u.MOVE.src, newParent);
		break;
	case T_EXP:
		fprintf(out, "%d EXP\n", parent);
		++nodeId;
		newParent = nodeId;
		printVisTreeExp(out, stm->u.EXP, newParent);
		break;
	}
}

static void printVisTreeExp(FILE *out, T_exp exp, int parent) {
	int newParent;
	switch (exp->kind) {
	case T_BINOP:
		fprintf(out, "%d BINOP\n", parent);
		++nodeId;
		newParent = nodeId;
		fprintf(out, "%d %s\n", newParent, bin_oper[exp->u.BINOP.op]);
		++nodeId;
		printVisTreeExp(out, exp->u.BINOP.left, newParent);
		printVisTreeExp(out, exp->u.BINOP.right, newParent);
		break;
	case T_MEM:
		fprintf(out, "%d MEM\n", parent);
		++nodeId;
		newParent = nodeId;
		printVisTreeExp(out, exp->u.MEM, newParent);
		break;
	case T_TEMP:
		fprintf(out, "%d TEMP t%d\n", parent, getTmpnum(exp->u.TEMP));
		++nodeId;
		break;
	case T_ESEQ:
		fprintf(out, "%d ESEQ\n", parent);
		++nodeId;
		newParent = nodeId;
		printVisStm(out, exp->u.ESEQ.stm, newParent);
		printVisTreeExp(out, exp->u.ESEQ.exp, newParent);
		break;
	case T_NAME:
		fprintf(out, "%d NAME %s\n", parent, S_name(exp->u.NAME));
		++nodeId;
		break;
	case T_CONST:
		fprintf(out, "%d CONST %d\n", parent, exp->u.CONST);
		++nodeId;
		break;
	case T_CALL: {
		T_expList args = exp->u.CALL.args;
		fprintf(out, "%d CALL\n", parent);
		++nodeId;
		newParent = nodeId;
		printVisTreeExp(out, exp->u.CALL.fun, newParent);
		fprintf(out, "%d ARGS\n", newParent);
		++nodeId;
		newParent = nodeId;
		for (; args; args = args->tail) {
			printVisTreeExp(out, args->head, newParent);
		}
		break;
	}
	} /* end of switch */
}


void show_nodeinfo(FILE *out, void *info) {
	Temp_map m = F_get_tempmap();
	string name = Temp_look(m, (Temp_temp)info);
	if (name == NULL)
		fprintf(out, "t%d\t", getTmpnum((Temp_temp)info));
	else fprintf(out, "%s\t", name);

}

void doProc(FILE *file, FILE *assemFile, F_frame frame, T_stm stm) {
	T_stmList stmList = C_linearize(stm);

	FILE *linearBlockFile = fopen("linear_tree.txt", "w");
	printStmList(linearBlockFile, stmList);
	fclose(linearBlockFile);

	struct C_block block = C_basicBlocks(stmList);
	Temp_label done = block.label;
	T_stmList tracedStmList = C_traceSchedule(block);
	printStmList(file, tracedStmList);

	/***������һ������***/
	AS_instrList instrList = F_codegen(frame, tracedStmList);
	instrList = F_progEntryExit2(instrList, done);
	/******/
	/***�ϲ���һ����ӡ����***/
//    fprintf(file, "%s", proc->prolog);
//    AS_printInstrList(file, instrList, F_get_tempmap());
//    fprintf(file, "%s", proc->epilog);
	/******/
	fprintf(file, "\n\n\nliveness\n\n");
	//fclose(file);
	G_graph flowgraph = FG_AssemFlowGraph(instrList);
	struct Live_graph lg = Live_liveness(flowgraph);
	G_show(file, G_nodes(lg.graph), show_nodeinfo);
	Live_moveList livelist = lg.moves;
	for (; livelist; livelist = livelist->tail) {
		show_nodeinfo(file, G_nodeInfo(livelist->dst));
		fprintf(file, "\t");
		show_nodeinfo(file, G_nodeInfo(livelist->src));
		fprintf(file, "\n");
	}

	// coloring
	struct RA_result ra_result = RA_regAlloc(frame, instrList);

	AS_proc proc = F_progEntryExit3(frame, instrList);
	fprintf(assemFile, ".text\n.align 2\n.globl %s\n", Temp_labelstring(F_name(frame)));
	fprintf(assemFile, "%s", proc->prolog);
	AS_printInstrList(assemFile, ra_result.il, ra_result.coloring);
	fprintf(assemFile, "%s", proc->epilog);
	fprintf(assemFile, "\n\n\n\n");
}

#endif // _DEBUG

void parse(string fname) {
	EM_reset(fname);
	if (yyparse() == 0) /* parsing worked */
	{
		fprintf(stderr, "Parsing successful!\n");
#ifdef _DEBUG
		F_fragList res = SEM_transProg(absyn_root);
		F_fragList tmp = res;
		T_stmList show = NULL;
		for (; tmp; tmp = tmp->tail) {
			if (tmp->head->kind == F_progFrag) {
				show = T_StmList(tmp->head->u.prog.body, show);
			}
		}
		FILE *fp = fopen("ir_tree.txt", "w");
		FILE *visFile = fopen("visualization/ir_vis.txt", "w");
		printStmList(fp, show);
		printVisStmList(visFile, show);
		fclose(fp);
		fclose(visFile);

		//FILE *fp2 = fopen("canon_tree.txt", "w");

		FILE *instrFp = fopen("instr_b4_allocation.txt", "w");
		FILE *assemFile = fopen("tigerMain.s", "w");
		tmp = res;
		fprintf(assemFile, ".data\n");
		for (; tmp; tmp = tmp->tail) {
			if (tmp->head->kind == F_stringFrag) {
				fprintf(assemFile, ".align 2\n");
				fprintf(assemFile, "%s", F_string(tmp->head));
			}
		}
		//fprintf(assemFile, ".text\n.globl tigerMain\n");
		tmp = res;
		for (; tmp; tmp = tmp->tail)
			if (tmp->head->kind == F_progFrag)
				doProc(instrFp, assemFile, tmp->head->u.prog.frame, tmp->head->u.prog.body);
		//            else if (tmp->head->kind == F_stringFrag)
		//                fprintf(fp2, "%s\n", tmp->head->u.stringg.str);
		//fclose(fp2);
		fclose(instrFp);
		fclose(assemFile);


#endif // _DEBUG
	}
	else {
		fprintf(stderr, "Parsing failed\n");
	}
}

void compilerExit(int code) {
	if (code == 0)
		exit(0);
	else {
		fprintf(stderr, "Compilation terminated.\n");
		exit(1);
	}
}

void process(FILE *assemFile, F_frame frame, T_stm stm) {
    // cannon
    T_stmList stmList = C_linearize(stm);
    struct C_block block = C_basicBlocks(stmList);
    Temp_label done = block.label;
    T_stmList tracedStmList = C_traceSchedule(block);

    // generate assamble code
    AS_instrList instrList = F_codegen(frame, tracedStmList);
    instrList = F_progEntryExit2(instrList, done);

    // conflict analysis
    G_graph flowgraph = FG_AssemFlowGraph(instrList);
    struct Live_graph lg = Live_liveness(flowgraph);

    // color
    struct RA_result ra_result = RA_regAlloc(frame, instrList);

    AS_proc proc = F_progEntryExit3(frame, instrList);
	fprintf(assemFile, ".text\n.align 2\n.globl %s\n", Temp_labelstring(F_name(frame)));
	fprintf(assemFile, "%s", proc->prolog);
	AS_printInstrList(assemFile, ra_result.il, ra_result.coloring);
	fprintf(assemFile, "%s", proc->epilog);
	fprintf(assemFile, "\n\n\n\n");
}

void compile(char *inFileName, char *outFileName) {
	printf("Input: %s\nOutput: %s\n", inFileName, outFileName);
	EM_reset(inFileName);
	if (yyparse() != 0) {
		fprintf(stderr, "Fatal error: parsing failed\n");
		compilerExit(1);
	}
    // semantic analysis
	F_fragList res = SEM_transProg(absyn_root);
	F_fragList tmp = res;
	FILE *assemFile = fopen(outFileName, "w");
	tmp = res;

	fprintf(assemFile, ".data\n");
	for (; tmp; tmp = tmp->tail) {
		if (tmp->head->kind == F_stringFrag) {
			fprintf(assemFile, ".align 2\n");
			fprintf(assemFile, "%s", F_string(tmp->head));
		}
	}
	tmp = res;
	for (; tmp; tmp = tmp->tail)
		if (tmp->head->kind == F_progFrag)
			process(assemFile, tmp->head->u.prog.frame, tmp->head->u.prog.body);
	fclose(assemFile);
}

int main(int argc, char **argv) {
	   #ifdef _DEBUG
	//    parse("testcases/test4.tig");
	//    parse("customtests/queens.tig");
	//    parse("customtests/merge.tig");
	//    parse("customtests/spill.tig");
	//    parse("customtests/isprime.tig");
	//    parse("customtests/intarray.tig");
	//    parse("customtests/intlist.tig");
	//    parse("customtests/redeclare.tig");
	//    parse("customtests/stdlib.tig");
	//    parse("customtests/tree.tig");
	   parse("customtests/plus.tig");
	   printf("Done//:~");
	   return 0;
	   #endif

    // simple command line parsing
	char* inFileName = NULL;
	char outFileName[20] = { 0 };
	if (argc == 1) {
		fprintf(stderr, "Fatal error: no input file\n");
		exit(1);
	}
	else if (argc == 2) {
		if (strcmp(argv[1], "--help") == 0) {
			printf("\n%s - A tiger compiler based on MIPS architecture.\n\n", argv[0]);
			printf("Usage: \n\t%s [OPTION...] file\n\n", argv[0]);
			printf("\t-i <file>\tInput file\n");
			printf("\t-o <file>\tOutput file(default: a.s)\n");
			printf("\t\t--help\tPrint help\n\n");
			compilerExit(0);
		}
		else {
			inFileName = argv[1];
		}
	}
	else {
		int i = 1;
		while (i < argc) {
			if (strcmp(argv[i], "-i") == 0) {
				if (i == argc - 1) {
					fprintf(stderr, "Fatal error: no input file\n");
					compilerExit(1);
				}
				else {
					inFileName = argv[++i];
				}
			}
			else if (strcmp(argv[i], "-o") == 0) {
				if (i == argc - 1) {
					fprintf(stderr, "Fatal error: no output file\n");
					compilerExit(1);
				}
				else {
					strcat(outFileName, argv[++i]);
				}
			}
			else {
				inFileName = argv[i];
			}
			i++;
		}
	}
	if(inFileName == NULL){
		fprintf(stderr, "Fatal error: no input file\n");
		compilerExit(1);
	}
	if (outFileName[0] == 0) {
		strcat(outFileName, "a.s");
	}
	compile(inFileName, outFileName);

	return 0;
}
