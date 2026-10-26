%{
#include<stdio.h>
int count = 0;
%}

%%
"Print" {count++;}
.|\n {}
%%

int main(){
	printf("Enter a String: \n");
	yylex();
	printf("The frequency of Print is %d" , count);
	return 0;

}

int yywrap(){
	return 1;
}

