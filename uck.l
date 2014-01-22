%{
#include <stdio.h>
#include "y.tab.h"

int
yywrap(void)
{
    return 1;
}
%}
%%
[ \t]   return SPACE;
":"     return COLON;
";"     return SEMICOL;
","     return COMMA;
"-"     return MINUS;
"("     return LP;
")"     return RP;
"D"     return DCAP;
"."     return DOT;
[Oo]    return OLETTER;
"*"     return ASTER;
"="     return EQUAL;
"_"     return USC;
"^"     return CARET;
"<"     return LAQ;
">"     return RAQ;
"~"     return TILDE;
[Yy]    return YLETTER;
"\n"    return CR;
. {
    fprintf(stderr, "lexical error.\n");
    exit(1);
}
%%
