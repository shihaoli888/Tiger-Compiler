%{
  /*
   * modified by Zhao Xiaodong 2018/4/26
   * add token parse about string and comment
   * string parsed with esacape in raw format
   */
#include <string.h>
#include "util.h"
#include "tokens.h"
#include "errormsg.h"

int charPos=1;
static int commentLevel = 0;

int yywrap(void)
{
 charPos=1;
 return 1;
}


void adjust(void)
{
 EM_tokPos=charPos;
 charPos+=yyleng;
}

%}

%x S_COMMENT

%%
"/*" {adjust(); commentLevel = 1; BEGIN(S_COMMENT);}
<S_COMMENT>\n {adjust(); EM_newline(); continue;}
<S_COMMENT>[^\*\/\n]* {adjust(); continue;}
<S_COMMENT>"*"+[^\*\/\n]+ {adjust(); continue;}
<S_COMMENT>"/"+[^\*\/\n]+ {adjust(); continue;}
<S_COMMENT>"/"+"*" {adjust(); commentLevel++; continue;}
<S_COMMENT>"*"+"/" {
                adjust();
                commentLevel--;
                if (commentLevel == 0) {
                  BEGIN(INITIAL);
                  continue;
                }
                continue;
              }
<S_COMMENT><<EOF>> {
  adjust();
  EM_error(EM_tokPos, "comment without ending!");
  yyterminate();
}

" " {adjust(); continue;}
\t {adjust(); continue;}
(\r|\n|\r\n) {adjust(); EM_newline(); continue;}

"," {adjust(); return COMMA;}
":" {adjust(); return COLON;}
";" {adjust(); return SEMICOLON;}
"(" {adjust(); return LPAREN;}
")" {adjust(); return RPAREN;}
"[" {adjust(); return LBRACK;}
"]" {adjust(); return RBRACK;}
"{" {adjust(); return LBRACE;}
"}" {adjust(); return RBRACE;}
"." {adjust(); return DOT;}
"+" {adjust(); return PLUS;}
"-" {adjust(); return MINUS;}
"*" {adjust(); return TIMES;}
"/" {adjust(); return DIVIDE;}
"=" {adjust(); return EQ;}
"<>" {adjust(); return NEQ;}
"<" {adjust(); return LT;}
"<=" {adjust(); return LE;}
">" {adjust(); return GT;}
">=" {adjust(); return GE;}
"&" {adjust(); return AND;}
"|" {adjust(); return OR;}
":=" {adjust(); return ASSIGN;}

for  	 {adjust(); return FOR;}
while  {adjust(); return WHILE;}
to  {adjust(); return TO;}
break {adjust(); return BREAK;}
let {adjust(); return LET;}
in {adjust(); return IN;}
end {adjust(); return END;}
function {adjust(); return FUNCTION;}
var {adjust(); return VAR;}
type {adjust(); return TYPE;}
array {adjust(); return ARRAY;}
if {adjust(); return IF;}
then {adjust(); return THEN;}
else {adjust(); return ELSE;}
do {adjust(); return DO;}
of {adjust(); return OF;}
nil {adjust(); return NIL;}

[0-9]+	 {adjust(); yylval.ival=atoi(yytext); return INT;}
[A-Za-z][A-Za-z0-9_]* {adjust(); yylval.sval = yytext; return ID;}

\"(\\.|[^\\"])*\" {
  adjust();
  yylval.sval = (char*)calloc(strlen(yytext)-1, sizeof(char));
  strncpy(yylval.sval, &yytext[1], strlen(yytext)-2);
  return STRING;
}

.	 {adjust(); EM_error(EM_tokPos,"illegal token");}
