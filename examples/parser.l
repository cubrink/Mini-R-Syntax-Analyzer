/*   	parser.l
 
	Specifications of tokens to be
	used with bison file parser.y
*/

%{

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


