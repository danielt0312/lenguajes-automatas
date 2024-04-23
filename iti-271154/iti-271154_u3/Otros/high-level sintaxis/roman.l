/* roman.l */

%{
/* The .tab.h file is generated by yacc, and we'll explain
   it later */

#include "roman.tab.h"

/* lex communicates semantic token values to yacc through
   a shared global variable */

extern int yylval;
%}

/* when using flex (rather than vanilla lex) fix
   unused function warnings by adding:

%option noinput nounput
*/

%%

 /* The constant for NUM comes from roman.tab.h,
    and was generated because we declared
    "%token NUM" in roman.y */

I  { yylval =    1; return NUM; }
V  { yylval =    5; return NUM; }
X  { yylval =   10; return NUM; }
L  { yylval =   50; return NUM; }
C  { yylval =  100; return NUM; }
D  { yylval =  500; return NUM; }
M  { yylval = 1000; return NUM; }

IV { yylval =    4; return NUM; }
IX { yylval =    9; return NUM; }
XL { yylval =   40; return NUM; }
XC { yylval =   90; return NUM; }
CD { yylval =  400; return NUM; }
CM { yylval =  900; return NUM; }

 /* ignore final newline */
\n ;

 /* As a default action, return the ascii value of
    the character as if it were a token identifier.
    The values from roman.tab.h are offset above 256 to
    be above any ascii value, so there's no ambiguity

    Our parser won't be expecting these values, so
    they will lead to a syntax error */
.  { return *yytext; }