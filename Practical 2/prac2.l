%{
#include <stdio.h>
int comments = 0;
int keywords = 0;
int identifiers = 0;
int words = 0;
int lines = 0;
int spaces = 0;
%}

%%
"//".*                          {comments++;}
"int"|"float"|"char"|"if"|"else"|"for"|"while"|"return"|"void"    {keywords++;}
[A-Za-z_][A-Za-z0-9_]*          {identifiers++; words++;}
" "                             {spaces++;}
\n                              {lines++;}
.                               ;
%%

int main(){
    yylex();
    printf("Comments    = %d\n", comments);
    printf("Keywords    = %d\n", keywords);
    printf("Identifiers = %d\n", identifiers);
    printf("Words       = %d\n", words);
    printf("Lines       = %d\n", lines);
    printf("Spaces      = %d\n", spaces);
    return 0;
}

int yywrap(){
    return 1;
}