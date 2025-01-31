%{
#include "y.tab.h"              //file contains all the declarations in the yacc program and is automatically generated by yacc when YACC is executed with -d flag
void yyerror (char *s);       // error message 
int yylex();         // returns tokens by order.
%}
%%
"print"				   {return print;}
"exit"				   {return exit_command;}
[a-zA-Z]			   {yylval.id = yytext[0]; return identifier;}
[0-9]+                 {yylval.num = atoi(yytext); return number;}
[ \t\n]                ;
[-+=;]           	   {return yytext[0];}
.                      {ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}    // returns 1 when the end of the input occurs

note that : all the tokens declared in the second part of the lex file should be declared in the second part of the yacc file.

yylex -> returns the next token.
yytext => returns the string value of the current pointer at yylex.
yylval => returns the actual value of the current pointer at yylex.

