%{
#include <stdio.h>
#include <stdlib.h>
#include "util.h"
#include "symbol.h" 
#include "errormsg.h"
#include "absyn.h"

int yylex(void); /* function prototype */
A_exp absyn_root;


void yyerror(char *s)
{
 EM_error(EM_tokPos, "%s", s);
}
%}
%union {
	int pos;
	int ival;
	string sval;
	A_var var;
	A_exp exp;
      A_expList expseq;
      A_dec dec;
      A_decList decs;
      A_ty ty;
      A_fieldList tyfields;
      A_nametyList tydec;
      A_fundecList fundec;
      A_efieldList recordfields;
	/* et cetera */
	}

%token <sval> ID STRING
%token <ival> INT

%token 
  COMMA COLON SEMICOLON LPAREN RPAREN LBRACK RBRACK 
  LBRACE RBRACE DOT 
  PLUS MINUS TIMES DIVIDE EQ NEQ LT LE GT GE
  AND OR ASSIGN
  ARRAY IF THEN ELSE WHILE FOR TO DO LET IN END OF 
  BREAK NIL
  FUNCTION VAR TYPE 
%right THEN ELSE
%nonassoc OF DO
%nonassoc ASSIGN
%left OR
%left AND
%nonassoc EQ NEQ LT LE GE GT 
%left PLUS MINUS
%left TIMES DIVIDE
%nonassoc UMINUS

%type <exp> exp program
%type <expseq> expseq lexpseq
%type <var> lvalue
%type <ty> ty
%type <tyfields> tyfields
%type <dec> dec vardec
%type <decs> decs
%type <tydec> tydec
%type <fundec> fundec
%type <recordfields> recordfields
/* et cetera */

%start program

%%

program:   exp    {absyn_root=$1;}
        ;

exp:   lvalue         {$$=A_VarExp(EM_tokPos, $1);}
    | NIL {$$=A_NilExp(EM_tokPos);}
    | LPAREN expseq RPAREN {$$=A_SeqExp(EM_tokPos, $2);}
    | INT {$$=A_IntExp(EM_tokPos, $1);}
    | STRING {$$=A_StringExp(EM_tokPos, $1);}
    | MINUS exp %prec UMINUS {$$=A_OpExp(EM_tokPos, A_minusOp, A_IntExp(EM_tokPos, 0), $2);}
    | ID LPAREN expseq RPAREN {$$=A_CallExp(EM_tokPos, S_Symbol($1), $3);}
    | exp MINUS exp {$$=A_OpExp(EM_tokPos, A_minusOp, $1, $3);}
    | exp TIMES exp {$$=A_OpExp(EM_tokPos, A_timesOp, $1, $3);}
    | exp DIVIDE exp {$$=A_OpExp(EM_tokPos, A_divideOp, $1, $3);}
    | exp EQ exp {$$=A_OpExp(EM_tokPos, A_eqOp, $1, $3);}
    | exp NEQ exp {$$=A_OpExp(EM_tokPos, A_neqOp, $1, $3);}
    | exp LT exp {$$=A_OpExp(EM_tokPos, A_ltOp, $1, $3);}
    | exp LE exp {$$=A_OpExp(EM_tokPos, A_leOp, $1, $3);}
    | exp GT exp {$$=A_OpExp(EM_tokPos, A_gtOp, $1, $3);}
    | exp GE exp {$$=A_OpExp(EM_tokPos, A_geOp, $1, $3);}
    | exp AND exp {$$=A_OpExp(EM_tokPos, A_andOp, $1, $3);}
    | exp OR exp {$$=A_OpExp(EM_tokPos, A_orOp, $1, $3);}
    | ID LBRACE recordfields RBRACE {$$=A_RecordExp(EM_tokPos, S_Symbol($1), $3);}
    | ID LBRACK exp RBRACK OF exp {$$=A_ArrayExp(EM_tokPos, S_Symbol($1), $3, $6);}
    | lvalue ASSIGN exp {$$=A_AssignExp(EM_tokPos, $1, $3);}
    | IF exp THEN exp {$$=A_IfExp(EM_tokPos, $2, $4, NULL);}
    | IF exp THEN exp ELSE exp {$$=A_IfExp(EM_tokPos, $2, $4, $6);}
    | WHILE exp DO exp {$$=A_WhileExp(EM_tokPos, $2, $4);}
    | FOR ID ASSIGN exp TO exp DO exp {$$=A_ForExp(EM_tokPos, S_Symbol($2), $4, $6, $8);}
    | BREAK {$$=A_BreakExp(EM_tokPos);}
    | LET decs IN expseq END {$$=A_LetExp(EM_tokPos, $2, A_SeqExp(EM_tokPos, $4));}
    ;

expseq: /*empty*/ {$$=NULL;}
      | exp lexpseq {$$=A_ExpList($1, $2);}
      ;

lexpseq: /*empty*/ {$$=NULL;}
      | SEMICOLON exp lexpseq {$$=A_ExpList($2, $3);}
      ;

lvalue: ID {$$=A_SimpleVar(EM_tokPos, S_Symbol($1));}
      | lvalue DOT ID {$$=A_FieldVar(EM_tokPos, $1, S_Symbol($3));}
      | lvalue LBRACK exp RBRACK {$$=A_SubscriptVar(EM_tokPos, $1, $3);}
      ;

recordfields: ID EQ exp {$$=A_EfieldList(A_Efield(S_Symbol($1), $3), NULL);}
            | ID EQ exp COMMA recordfields {$$=A_EfieldList(A_Efield(S_Symbol($1), $3), $5);}
            ;


 /* declaration */
decs: /*empty*/ {$$=NULL;}
    | dec decs {$$=A_DecList($1, $2);}
    ;

dec: tydec {$$=A_TypeDec(EM_tokPos, $1);}
    | vardec {$$=$1;}
    | fundec {$$=A_FunctionDec(EM_tokPos, $1);}
    ;
    
/* type declaration */
tydec: TYPE ID EQ ty {/*TODO:*/$$=A_NametyList(A_Namety(S_Symbol($2), $4), NULL);}
      ;

ty: ID {$$=A_NameTy(EM_tokPos, S_Symbol($1));}
  | LBRACE tyfields RBRACE {$$=A_RecordTy(EM_tokPos, $2);}
  | ARRAY OF ID {$$=A_ArrayTy(EM_tokPos, S_Symbol($3));}
  ;

tyfields: ID COLON ID {$$=A_FieldList((A_Field(EM_tokPos, S_Symbol($1), S_Symbol($3))), NULL);}
        | ID COLON ID COMMA tyfields {$$=A_FieldList((A_Field(EM_tokPos, S_Symbol($1), S_Symbol($3))), $5);}
        ;

/* variable declaration */
vardec: VAR ID ASSIGN exp {$$=A_VarDec(EM_tokPos, S_Symbol($2), S_Symbol(NULL), $4);}
      | VAR ID COLON ID ASSIGN exp {$$=A_VarDec(EM_tokPos, S_Symbol($2), S_Symbol($4), $6);}
      ;

fundec: FUNCTION ID LPAREN tyfields RPAREN EQ exp {$$=A_FundecList(A_Fundec(EM_tokPos, S_Symbol($2), $4, S_Symbol(NULL), $7), NULL);}
      | FUNCTION ID LPAREN tyfields RPAREN COLON ID EQ exp {$$=A_FundecList(A_Fundec(EM_tokPos, S_Symbol($2), $4, S_Symbol($7), $9), NULL);}
      ;
