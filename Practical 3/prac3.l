%{
#include <stdio.h>

int a_words = 0;
int numbers = 0;
%}

%%
[Aa][A-Za-z]*                 { a_words++; }
[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?   { numbers++; }
\n                            ;
%%

int main()
{
    printf("Enter the input : ");
    yylex();

    printf("Number of words starting with a/A: %d\n", a_words);
    printf("Count of numbers: %d\n", numbers);

    return 0;
}

int yywrap()
{
    return 1;
}