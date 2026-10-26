%{
#include <stdio.h>

int stringToNumber(char s[])
{
    int n = 0;
    int i = 0;

    while(s[i] >= '0' && s[i] <= '9')
    {
        n = n * 10 + (s[i] - '0');
        i++;
    }

    return n;
}

void numberToHex(int n)
{
    char hex[] = "0123456789ABCDEF";
    char result[20];
    int i = 0;

    if(n == 0)
    {
        putchar('0');
        return;
    }

    while(n > 0)
    {
        result[i] = hex[n % 16];
        n = n / 16;
        i++;
    }

    while(i > 0)
    {
        i--;
        putchar(result[i]);
    }
}
%}

%%

[0-9]+ {
    int n;

    n = stringToNumber(yytext);

    printf("Decimal = %d\n", n);
    printf("Hexadecimal = ");

    numberToHex(n);

    printf("\n");
}

%%

int main()
{
    printf("Enter decimal number: ");
    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}