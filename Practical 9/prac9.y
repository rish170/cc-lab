
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int yylex(void);
void yyerror(const char *s);

int calc_error = 0;
%}

%token NUMBER INC DEC

%left '+' '-'
%left '*' '/'
%right '^'
%left INC DEC

%start input

%%
input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | expr '\n'
      {
          if (!calc_error)
              printf("Result: %d\n", $1);

          calc_error = 0;
      }
    | error '\n'
      {
          printf("Please enter a valid expression.\n");
          calc_error = 0;
          yyerrok;
      }
    ;

expr:
      NUMBER            { $$ = $1; }
    | expr '+' expr     { $$ = $1 + $3; }
    | expr '-' expr     { $$ = $1 - $3; }
    | expr '*' expr     { $$ = $1 * $3; }
    | expr '/' expr
      {
          if ($3 == 0)
          {
              printf("Error: Division by zero\n");
              calc_error = 1;
              $$ = 0;
          }
          else
          {
              $$ = $1 / $3;
          }
      }
    | expr '^' expr     { $$ = (int)pow($1, $3); }
    | expr INC          { $$ = $1 + 1; }
    | expr DEC          { $$ = $1 - 1; }
    | '(' expr ')'      { $$ = $2; }
    ;
%%

void yyerror(const char *s)
{
    (void)s;
    fprintf(stderr, "Invalid expression.\n");
}

int main(void)
{
    return yyparse();
}
