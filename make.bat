bison --yacc -dv uck.y
flex uck.l
gcc -o uck y.tab.c lex.yy.c
pause