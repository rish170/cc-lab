%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(char *s);
%}

%token ID

%%
E : E '+' T
  | E '-' T
  | T
  ;

T : T '*' F
  | T '/' F
  | F
  ;

F : '(' E ')'
  | ID
  ;
%%

int yyerror(char *s)
{
    printf("INVALID EXPRESSION\n");
    exit(0);
}

int main()
{
    printf("Enter an Expression : ");
    yyparse();
    printf("VALID EXPRESSION\n");

    return 0;
}