%{
	#define YYSTYPE double
	#include <stdlib.h>
	#include <ctype.h>
	#include <stdio.h>
	void yyerror(char *s);
	#include "parser.h"

	extern int yylex();
%}
%token NUMBER VARIABLE
//%right  ":A:" ":S:"
//%right  ":M:" ":D:"

%%
program: VARIABLE '=' expr {$$= $3; printf("result = %lf\n", $3);}
	| VARIABLE '=' '(' expr ')' {$$= $3; printf("result = %lf\n", $3);}
	|
	;
expr: expr ":A:" term {$$ = $1 + $3;}
	| expr ":S:" term {$$ = $1 - $3;}
	| term {$$ = $1;}
	;
term: term ":M:" factor {$$ = $1 * $3;}
	| term ":D:" factor {$$ = $1 / $3;}
	| factor {$$ = $1;}
	;

factor: '(' expr ')' {$$ = $2;}
	| expr {$$ = $1;}
	| NUMBER {$$ = $1;}
	| VARIABLE {$$ = $1;}
	;
%%



void yyerror(char *s) {
	fprintf(stderr, "error: %s", s);
}

int main(){
	yyparse();
	return 0;
}