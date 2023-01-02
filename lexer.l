%{
    #include <stdlib.h>
    #include "parser.h"
    void yyerror(char *s);
%}

number -?(([0-9]+)|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?)
id     [a-zA-Z_][a-zA-Z0-9_]*
ws [ \t\r\n]+
%%

{number} { yylval= yytext; return NUMBER; }

:A: {return '+';}
:S: {return '-';}
:M: {return '*';}
:D: {return '/';}

{id} { yylval= yytext; return ID; }


[-+\(\)=] {return *yytext;}

. { yyerror("invalid character"); }
%%

int yywrap(){
    return 1;
}


