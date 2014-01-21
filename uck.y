%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1
%}
%token EQUAL COLON SEMICOL MINUS COMMA LP RP DCAP DOT OLETTER USC CARET TILDE
%token LAQ RAQ ASTER YLETTER SPACE CR
%%
smiley_total
    : smiley_total SPACE smiley
    | smiley CR
    | smiley_total CR
    ;
smiley
    : emotion
    | icon
    ;
emotion
    : emotion_without_hair
    | e_hair emotion
    ;
e_hair
    : EQUAL
    ;
emotion_without_hair
    : e_eye e_mouth
    | e_eye e_nose e_mouth
    ;
e_eye
    : COLON
    | SEMICOL
    ;
e_nose
    : MINUS
    | COMMA
    ;
e_mouth
    : LP
    | RP
    | DCAP
    | OLETTER
    | ASTER
    ;
icon
    : i_eyel i_mouth i_eyer
    | i_cheekl i_eyel i_mouth i_eyer i_cheekr
    | i_shapel i_eyel i_mouth i_eyer i_shaper
    | i_shapel i_cheekl i_eyel i_mouth i_eyer i_cheekr i_shaper
    | i_arml i_shapel i_eyel i_mouth i_eyer i_shaper i_armr
    ;
i_mouth
    : USC
    | OLETTER
    | DOT
    ;
i_eyel
    : i_eye
    | RAQ
    ;
i_eyer
    : i_eye
    | LAQ
    ;
i_eye
    : CARET
    | TILDE
    | MINUS
    | OLETTER
    ;
i_cheekl
    : i_cheek
    ;
i_cheekr
    : i_cheek
    ;
i_cheek
    : ASTER
    | EQUAL
    ;
i_shapel
    : LP
    ;
i_shaper
    : RP
    ;
i_arml
    : i_arm
    ;
i_armr
    : i_arm
    ;
i_arm
    : YLETTER
    | OLETTER
    ;
%%
int
yyerror(char const *str)
{
    extern char *yytext;
    fprintf(stderr, "parser error near %s\n", yytext);
    return 0;
}

int main(int argc, char *argv[])
{
    extern int yyparse(void);
    extern FILE *yyin;

    if (argc == 2) {
        yyin = fopen(argv[1], "r");
    }
    if (yyparse()) {
        fprintf(stderr, "Error ! Error ! Error !\n");
        fclose(yyin);
        exit(1);
    }
    fclose(yyin);
}
