%{
    #include <stdlib.h>
    void yyerror(char *s);
%}

%%
[0-9]+ { printf("NUMBER\n"); }

%%


