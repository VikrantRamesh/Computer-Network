%{
#include<stdlib.h>
#include<stdio.h>
int yylex(void);
void yyerror(char* s);
%}
%token INTEGER
%%
program:
       program expr '\n'   { printf("%d\n",$2);}
|
;
expr:
    expr '+' mulex { $$ = $1+$3; }
|expr '-' mulex { $$ = $1-$3; }
|mulex         { $$ = $1;}
;
mulex:
     mulex '*' term { $$ = $1*$3; }
|mulex '/' term { if($3 !=0){$$ = $1/$3;} else{ printf("INVALID SYNTEX");exit(1); } }
|term        { $$ = $1;}
;
term:
    '('expr')'   { $$ = $2; };
|INTEGER  { $$ = $1; }
;
%%
void yyerror(char* s){
fprintf(stderr,"Error:%s\n",s);
return ;
}
int main(){
yyparse();
return 0;
}
//Infix
