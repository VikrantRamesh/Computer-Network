%{
#include <stdio.h>
#include <stdlib.h>
int result;
int yylex(void);
void yyerror(char *s);
%}
%token INTEGER
/* Declare a global variable to store the result */
%%
expr:   INTEGER            { $$ = $1; }
    | expr expr '+'      { $$ = $1 + $2; }
    | expr expr '-'      { $$ = $1 - $2; }
    | expr expr '*'      { $$ = $1 * $2; }
    | expr expr '/'      { $$ = $1 / $2; }
    | expr '\n'      { printf("%d\n", $1);}
    ;
%%
int main() {
    yyparse();
    return 0;
}
void yyerror(char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    exit(1);
}
//Postfix
