%{
#include<stdio.h>
#include<string.h>
char changeCase(char c){
	if (c >= 'A' && c <= 'Z')
        return c + 32;       // Uppercase → lowercase

    if (c >= 'a' && c <= 'z')
        return c - 32;
}
%}

%%
[A-Za-z] {putchar(changeCase(yytext[0]));}
. {putchar(yytext[0]);}
 
%%

int main(){
	printf("Enter a character:");
	yylex();
	return 0;
}
int yywrap(){
	return 1;
}