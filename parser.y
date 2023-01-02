%{
	#define YYSTYPE char*
	#include <stdlib.h>
	#include <ctype.h>
	#include <stdio.h>
	void yyerror(char *s);
	#include "parser.h"

	extern int yylex();
%}
%token NUMBER ID
%right  '+' '-'
%right  '*' '/'

%%


%%



void yyerror(char *s) {
	fprintf(stderr, "error: %s", s);
}

int main(){
	if (yyparse() != 0 ) {
		printf("Error parsing\n");
	}
	return 0;
}