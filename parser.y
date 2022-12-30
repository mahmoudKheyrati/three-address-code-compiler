%{
	#include <stdlib.h>
	#include <ctype.h>
	#include <stdio.h>
	void yyerror(char *s);
	#include "parser.h"

	extern int yylex();
%}

%%
a : {}

%%



void yyerror(char *s) {
	fprintf(stderr, "error: %s", s);
}

int main(){
	yyparse();
	return 0;
}