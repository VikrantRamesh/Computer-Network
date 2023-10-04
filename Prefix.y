%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int yylex(void);
void yyerror(const char* s);
%}
%token INTEGER
%%
program:
    |
    program expr '\n' { printf("%d\n", $2); }
    ;
expr:
    INTEGER { $$ = $1; }
    | '+' expr expr { $$ = $2 + $3; }
    | '-' expr expr { $$ = $2 - $3; }
    | '*' expr expr { $$ = $2 * $3; }
    | '/' expr expr { $$ = $2 / $3; }
    ;
%%
void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}
int main() {
    yyparse();
    return 0;
}
//Prefix
