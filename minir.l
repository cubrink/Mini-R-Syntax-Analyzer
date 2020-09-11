/* 	Mini-R lexical analyzer
	Author: Curtis Brinker
	Date: 	2020-09-11

	Specifications of tokens to be
	used with bison file parser.y
*/

%{


// int numLines = 0;

// void printTokenInfo(const char* tokenType, 
//                     const char* lexeme);

%}

/* Named defintions of regular expressions go here */

WSPACE					[ \t\v\r]+
NEWLINE					\n

DIGIT					[0-9]
LETTER					[a-zA-Z]

IDENT					{LETTER}({LETTER}|{DIGIT}|_)* 

INTCONST  				[+-]?{DIGIT}+
FLOATCONST				[+-]?{DIGIT}*\.{DIGIT}+
STRCONST				\"([^"\n]|\\\")*\"

IF						if
ELSE					else
WHILE					while
FUNCTION				function
FOR						for
IN						in
TRUE					TRUE
FALSE					FALSE
PRINT					print
CAT						cat
READ					read
LIST					list

COMMENT					#.+$


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
"/"	{
		printTokenInfo("DIV", yytext);
		return T_DIV;
		}
"%%"	{
		printTokenInfo("MOD", yytext);
		return T_MOD;
		}
"^"		{
		printTokenInfo("POWER", yytext);
		return T_POWER;
		}
"<"		{
		printTokenInfo("LT", yytext);
		return T_LT;
		}
">"		{
		printTokenInfo("GT", yytext);
		return T_GT;
		}
"<="	{
		printTokenInfo("LE", yytext);
		return T_LE;
		}
">="	{
		printTokenInfo("GE", yytext);
		return T_GE;
		}
"!="	{
		printTokenInfo("NE", yytext);
		return T_NE;
		}
"!"		{
		printTokenInfo("NOT", yytext);
		return T_NOT;
		}
"&"		{
		printTokenInfo("AND", yytext);
		return T_AND;
		}
"|"		{
		printTokenInfo("OR", yytext);
		return T_OR;
		}
"=="	{
		printTokenInfo("EQ", yytext);
		return T_EQ;
		}
"="		{
		printTokenInfo("ASSIGN", yytext);
		return T_ASSIGN;
		}
";"		{
		printTokenInfo("SEMICOLON", yytext);
		return T_SEMICOLON;
		}
","		{
		printTokenInfo("COMMA", yytext);
		return T_COMMA;
		}
"("		{
		printTokenInfo("LPAREN", yytext);
		return T_LPAREN;
		}
")"		{
		printTokenInfo("RPAREN", yytext);
		return T_RPAREN;
		}
"["		{
		printTokenInfo("LBRACKET", yytext);
		return T_LBRACKET;
		}
"]"		{
		printTokenInfo("RBRACKET", yytext);
		return T_RBRACKET;
		}
"{"		{
		printTokenInfo("LBRACE", yytext);
		return T_LBRACE;
		}
"}"		{
		printTokenInfo("RBRACE", yytext);
		return T_RBRACE;
		}
{INTCONST}	{
		printTokenInfo("INTCONST", yytext);
		return T_INTCONST;
		}
{FLOATCONST} {
		printTokenInfo("FLOATCONST", yytext);
		return T_FLOATCONST;
		}
{STRCONST} {
		printTokenInfo("STRCONST", yytext);
		return T_STRCONST;
		}
{IF}	{
		printTokenInfo("IF", yytext);
		return T_IF;
		}
{ELSE}	{
		printTokenInfo("ELSE", yytext);
		return T_ELSE;
		}
{WHILE}	{
		printTokenInfo("WHILE", yytext);
		return T_WHILE;
		}
{FUNCTION}	{
		printTokenInfo("FUNCTION", yytext);
		return T_FUNCTION;
		}
{FOR}	{
		printTokenInfo("FOR", yytext);
		return T_FOR;
		}
{IN}	{
		printTokenInfo("IN", yytext);
		return T_IN;
		}
{TRUE}	{
		printTokenInfo("TRUE", yytext);
		return T_TRUE;
		}
{FALSE}	{
		printTokenInfo("FALSE", yytext);
		return T_FALSE;
		}
{PRINT}	{
		printTokenInfo("PRINT", yytext);
		return T_PRINT;
		}
{CAT}	{
		printTokenInfo("CAT", yytext);
		return T_CAT;
		}
{READ}	{
		printTokenInfo("READ", yytext);
		return T_READ;
		}
{LIST}	{
		printTokenInfo("LIST", yytext);
		return T_LIST;
		}
{IDENT}	{
		printTokenInfo("IDENT", yytext);
		return T_IDENT;
		}
{NEWLINE}	{
		numLines++;
		}
{WSPACE}  {}
{COMMENT} {}
.		{
		printTokenInfo("UNKNOWN", yytext);
		return T_UNKNOWN;
		}

%%

// // User-written code goes here

// void printTokenInfo(const char* tokenType, const char* lexeme) 
// {
//   printf("TOKEN: %-19s LEXEME: %s\n", tokenType, lexeme);
// }

// // You should supply a yywrap function.
// // Having it return 1 means only 1 input file will be scanned.
// int yywrap(void) { return 1; }

// int main(void) 
// {
//   while ( yylex() ) ;  // Process tokens until 0 returned

//   // Don't print this for the assignment.
//   // printf("Processed %d lines\n", numLines);
//   return 0;
// }


