%{
    #include <stdlib.h>
    #include "parser.h"
    void yyerror(char *s);
%}

digit [0-9]
letter [a-zA-Z]
ws [ \t\r\n]
underscore _
number [0-9]+(.[0-9]+)?

%%

{number} {  yylval = atof(yytext);
            printf("NUMBER %s, %d\n", yytext, yylval);
            return NUMBER;
         }

:(A|S|M|D): {printf("operator - %s \n", yytext); }
{letter}({letter}|{digit}|{underscore})* { printf("VARIABLE  %s\n", yytext);
                 return VARIABLE;
               }


[-+()=] {printf("fuck%s\n", yytext);return *yytext;}

[ \t\r\n] {};

. { yyerror("invalid character"); }


%%

int yywrap(){
    return 1;
}


