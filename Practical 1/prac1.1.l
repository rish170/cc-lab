
%{
#include<stdio.h>
%}

%%
"Print" {printf("Found Print");}
.|\n {}
%%

int main(){
	printf("Enter a String: ");
	yylex();
	return 0;

}

int yywrap(){
	return 1;
}
