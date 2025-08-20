%{
#include "AFD.tab.h"
#include <stdio.h>
%}

%%

a           { return A; }
b           { return B; }
[ \t\r]+    { /* ignorar espacios y retornos de carro */ }
\n+         { return FIN_CADENA; }
<<EOF>>     { return FIN_CADENA; }   // última línea sin \n
.           { /* ignorar otros caracteres */ }

%%
