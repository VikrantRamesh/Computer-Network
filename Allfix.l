%{
#include<stdlib.h>
#include<stdio.h>
#include "y.tab.h"
void yyerror(char* s);
%}
%%
[0-9]+  { yylval = atoi(yytext); return INTEGER;}
[-+*/\n()]  return *yytext;
[ \t]   ;
.        yyerror("INVALID SYNTEX");
%%
int yywrap(void){
return 1;
}
