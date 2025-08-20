%{
#include <stdio.h>
#include <string.h>

typedef struct {
    char origen[10];
    char simbolo;
    char destino[10];
} Transicion;

Transicion trans[50];
int num_trans = 0;

char estado_inicial[10], estado_aceptacion[10];
char cadena[100];
int idx = 0;

int buscar(char* estado, char simbolo, char* destino) {
    for (int i = 0; i < num_trans; i++) {
        if (strcmp(trans[i].origen, estado) == 0 && trans[i].simbolo == simbolo) {
            strcpy(destino, trans[i].destino);
            return 1;
        }
    }
    return 0;
}

int yylex(void);
int yyerror(char *s) { return 0; }
extern FILE *yyin;
%}

%token A B FIN_CADENA

%%

cadenas:
    | cadenas cadena FIN_CADENA {
        char estado[10];
        strcpy(estado, estado_inicial);
        char destino[10];

        for (int i = 0; i < strlen(cadena); i++) {
            if (!buscar(estado, cadena[i], destino)) {
                strcpy(estado, "ERROR");
                break;
            }
            strcpy(estado, destino);
        }

        printf("%s -> %s\n", cadena, strcmp(estado, estado_aceptacion) == 0 ? "ACEPTADA" : "RECHAZADA");
        fflush(stdout); // asegura que se imprima de inmediato
        idx = 0;
        cadena[0] = '\0';
    }
    ;

cadena:
      A { cadena[idx++] = 'a'; cadena[idx] = '\0'; }
    | B { cadena[idx++] = 'b'; cadena[idx] = '\0'; }
    | cadena A { cadena[idx++] = 'a'; cadena[idx] = '\0'; }
    | cadena B { cadena[idx++] = 'b'; cadena[idx] = '\0'; }
    ;

%%

int main(int argc, char *argv[]) {
    if (argc < 3) {
        printf("Uso: %s <AFD.txt> <cadenas.txt>\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        printf("No se pudo abrir %s\n", argv[1]);
        return 1;
    }

    char line[100];
    int parte = 0;

    while (fgets(line, sizeof(line), f)) {
        if (line[0] == '#' || strlen(line) <= 1) continue;

        line[strcspn(line, "\n")] = 0;

        if (parte == 2) {
            strcpy(estado_inicial, line);
        } else if (parte == 3) {
            strcpy(estado_aceptacion, line);
        } else if (parte > 3) {
            char *o = strtok(line, ",");
            char *s = strtok(NULL, ",");
            char *d = strtok(NULL, ",");

            if (o && s && d) {
                strcpy(trans[num_trans].origen, o);
                trans[num_trans].simbolo = s[0];
                strcpy(trans[num_trans].destino, d);
                num_trans++;
            }
        }
        parte++;
    }

    fclose(f);

    yyin = fopen(argv[2], "r");
    if (!yyin) {
        printf("No se pudo abrir %s\n", argv[2]);
        return 1;
    }

    yyparse();
    fclose(yyin);
    return 0;
}
