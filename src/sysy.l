
%option nounput
%option noinput

%{

#include <cstdlib>
#include <string>


#include "sysy.tab.hpp"

using namespace std;

%}


WhiteSpace    [ \t\n\r]*
LineComment   "//".* 
MulLineComment  "/*".*"*/"



Identifier    [a-zA-Z_][a-zA-Z0-9_]*


Decimal       [1-9][0-9]*
Octal         0[0-7]*
Hexadecimal   0[xX][0-9a-fA-F]+

Operater   "+"|"-"|"*"|"/"|"="|">"|"<"|"!"
%%

{WhiteSpace}    { }
{LineComment}   { }
{MulLineComment} { }

"int"           { return INT; }
"return"        { return RETURN; }
"void"          { return VOID; }
"float"         { return FLOAT; }
"const"         { return CONST;}

"if"            { return IF; }
"else"          { return ELSE; }
"while"         { return WHILE; }
"for"           { return FOR; }
"break"         { return BREAK; }
"continue"      { return CONTINUE; }

{Identifier}    { yylval.str_val = new string(yytext); return IDENT; }

{Decimal}       { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }
{Octal}         { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }
{Hexadecimal}   { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }
{Operater}      { return yytext[0]; } 

.               { return yytext[0]; }

%%

int yywrap()
{
	return 1;
}
