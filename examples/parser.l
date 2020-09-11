/*   	parser.l
 
	Specifications of tokens to be
	used with bison file parser.y
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

/* Defintions of regular expressions go here */

WSPACE	[ \t\r]+
NEWLINE	\n

DIGIT		[0-9]
LETTER	[a-zA-Z]

IDENT		{LETTER}({LETTER}|{DIGIT})* 
INTCONST	{DIGIT}+

%%
"quit"	{
		printTokenInfo("QUIT", yytext);
		return T_QUIT;
		}
"+"		{
		printTokenInfo("ADD", yytext);
		return T_ADD;
		}
"-"		{
		printTokenInfo("SUB", yytext);
		return T_SUB;
		}
"*"		{
		printTokenInfo("MULT", yytext);
		return T_MULT;
		}
"/"		{
		printTokenInfo("DIV", yytext);
		return T_DIV;
		}
{INTCONST}	{
		printTokenInfo("INTCONST", yytext);
		return T_INTCONST;
		}
{IDENT}	{
		printTokenInfo("IDENT", yytext);
		return T_IDENT;
		}
{NEWLINE}	{
		numLines++;
		}
{WSPACE}	{ }
.		{
		printTokenInfo("UNKNOWN", yytext);
		return T_UNKNOWN;
		}

%%


