%{
#include <stdio.h>

int hexToNumber(char s[])
{
    int n = 0;
    int i = 0;
    int value;

    while(s[i] != '\0')
    {
        if(s[i] >= '0' && s[i] <= '9')
            value = s[i] - '0';
        else if(s[i] >= 'A' && s[i] <= 'F')
            value = s[i] - 'A' + 10;
        else if(s[i] >= 'a' && s[i] <= 'f')
            value = s[i] - 'a' + 10;

        n = n * 16 + value;
        i++;
    }

    return n;
}
%}

%%

[0-9A-Fa-f]+ {
    int n;

    n = hexToNumber(yytext);

    printf("Hexadecimal = %s\n", yytext);
    printf("Decimal = %d\n", n);
}

%%

int main()
{
    printf("Enter hexadecimal number: ");
    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}