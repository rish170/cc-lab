
%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token FOR VALUE INC DEC RELOP AND OR INVALID

%left OR
%left AND
%nonassoc RELOP
%left '+' '-'
%left '*' '/'
%right UMINUS

%start program

%%
program:
      /* empty */
    | program statement
    ;

statement:
      for_stmt
    | ternary_stmt
    ;

for_stmt:
      FOR '(' assignment ';' condition ';' update ')' block
      {
          printf("Valid for loop.\n");
      }
    ;

ternary_stmt:
      condition '?' arithmetic ':' arithmetic ';'
      {
          printf("Valid ternary statement.\n");
      }
    ;

assignment:
      VALUE '=' arithmetic
    ;

condition:
      arithmetic RELOP arithmetic
    | condition AND condition
    | condition OR condition
    | '(' condition ')'
    ;

update:
      VALUE INC
    | VALUE DEC
    | INC VALUE
    | DEC VALUE
    | assignment
    ;

block:
      '{' '}'
    ;

arithmetic:
      arithmetic '+' term
    | arithmetic '-' term
    | term
    ;

term:
      term '*' factor
    | term '/' factor
    | factor
    ;

factor:
      VALUE
    | '(' arithmetic ')'
    | '-' factor %prec UMINUS
    ;
%%

void yyerror(const char *s)
{
    fprintf(stderr, "Invalid syntax.\n");
}

int main(void)
{
    return yyparse();
}
