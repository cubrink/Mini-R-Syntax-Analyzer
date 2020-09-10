/*
	parser.y

 	Example of a bison specification file.

	Grammar is:
	  <start> -> epsilon | <start> <expr>
	  <expr> -> quit | <calc> 
	  <calc> -> <operand> <op> <operand>
	  <op> -> add | sub | mult | div
	  <operand> -> intconst | ident 

      To create the syntax analyzer:
        flex parser.l
        bison parser.y
        g++ parser.tab.c -o parser
        parser < inputFileName
 */

%{
#include <stdio.h>

int numLines = 1; 

void printRule(const char *, const char *);
int yyerror(const char *s);
void printTokenInfo(const char* tokenType, const char* lexeme);

extern "C" 
{
    int yyparse(void);
    int yylex(void);
    int yywrap() { return 1; }
}

%}

/* Token declarations */
%token  T_IDENT T_INTCONST T_UNKNOWN 
%token  T_ADD T_SUB T_MULT T_DIV T_QUIT

/* Starting point */
%start		N_START

/* Translation rules */
%%
N_START		: // epsilon
			{
			printRule("START", "epsilon");
			}
			| N_START N_EXPR
			{
			printRule("START", "START EXPR");
			printf("\n---- Completed parsing ----\n\n");
			}
			;
N_EXPR		: T_QUIT
			{
			printRule("EXPR", "QUIT");
			exit(1);
			}
			| N_CALC
			{
			printRule("EXPR", "CALC");
			}
			;
N_CALC		: N_OPERAND N_OP N_OPERAND
			{
			printRule("CALC", "OPERAND OP OPERAND");
			}
			;
N_OP			: T_ADD
			{
			printRule("OP", "ADD");
			}
                | T_SUB
			{
			printRule("OP", "SUB");
			}
                | T_MULT
			{
			printRule("OP", "MULT");
			}
                | T_DIV
			{
			printRule("OP", "DIV");
			}
			;
N_OPERAND		: T_INTCONST
			{
			printRule("OPERAND", "INTCONST");
			}
                | T_IDENT
                {
			printRule("OPERAND", "IDENT");
			}
			;
%%

#include "lex.yy.c"
extern FILE *yyin;

void printRule(const char *lhs, const char *rhs) 
{
  printf("%s -> %s\n", lhs, rhs);
  return;
}

int yyerror(const char *s) 
{
  printf("%s\n", s);
  return(1);
}

void printTokenInfo(const char* tokenType, const char* lexeme) 
{
  printf("TOKEN: %-20s LEXEME: %s\n", tokenType, lexeme);
}

int main() 
{
  do 
  {
	yyparse();
  } while (!feof(yyin));

  printf("%d lines processed\n", numLines);
  return(0);
}
