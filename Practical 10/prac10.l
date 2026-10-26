
%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
"for"                       { return FOR; }
"++"                        { return INC; }
"--"                        { return DEC; }
"<="|">="|"=="|"!="|"<"|">" { return RELOP; }
"&&"                        { return AND; }
"||"                        { return OR; }

[a-zA-Z_][a-zA-Z0-9_]*      { return VALUE; }
[0-9]+                      { return VALUE; }

"="                         { return '='; }
";"                         { return ';'; }
"("                         { return '('; }
")"                         { return ')'; }
"{"                         { return '{'; }
"}"                         { return '}'; }
"?"                         { return '?'; }
":"                         { return ':'; }
"+"                         { return '+'; }
"-"                         { return '-'; }
"*"                         { return '*'; }
"/"                         { return '/'; }

[ \t\r\n]+                  { /* Ignore whitespace */ }
.                           { return INVALID; }
%%

int yywrap(void)
{
    return 1;
}
