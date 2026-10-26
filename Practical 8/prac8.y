%{
#include<stdio.h>
int yylex(void);
void yyerror(char *s);
%}

%token NUMBER

%%
stmt: expr '\n'       { printf("Result: %d\n", $1); }
    ;

expr: NUMBER          { $$ = $1; }
    | expr expr '+'   { $$ = $1 + $2; }
    | expr expr '*'   { $$ = $1 * $2; }
    ;
%%

void yyerror(char *s)
{
    printf("Error\n");
}

int main()
{
    yyparse();
    return 0;
}