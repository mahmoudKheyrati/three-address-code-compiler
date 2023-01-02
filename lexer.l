%{
    #define YYSTYPE char*
    #define YYSTYPE_IS_DECLARED 1
    #include <stdlib.h>
    #include "parser.h"
    #include "string.h"
    void yyerror(char *s);
%}

number -?(([0-9]+)|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?)
id     [a-zA-Z_][a-zA-Z0-9_]*
ws [ \t\r\n]+
%%

{ws} {}
{number} { char *val = malloc(yyleng+1); strcpy(val, yytext); yylval= val; return NUMBER; }

:A: {return '+';}
:S: {return '-';}
:M: {return '*';}
:D: {return '/';}

{id} { char *val = malloc(yyleng+1); strcpy(val, yytext); yylval= val; return ID; }


[-+\(\)=] {return *yytext;}

. { yyerror("invalid character"); }
%%

int yywrap(){
    return 1;
}


