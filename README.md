# Proyecto: Autómata Finito Determinista (AFD)

Este proyecto implementa un **Autómata Finito Determinista (AFD)** que permite verificar si un conjunto de cadenas son aceptadas o rechazadas.  
EL AFD debe aceptar cadenas de contengan como minimo 3 (a) y terminen en b 
La implementación está hecha en **Flex y Bison (C)** y también existe una versión alternativa en **Python**.  

---

## 📂 Archivos principales

- `AFD.txt` → Contiene la definición del autómata (alfabeto, estados, transiciones, estado inicial y estados finales).  
- `cadenas.txt` → Contiene las cadenas de prueba (una por línea).  

---

# Ejecución en C (Flex & Bison)

### 1. Compilación
Ejecuta en la terminal:

```bash
bison -d AFD.y
flex AFD.l
gcc AFD.tab.c lex.yy.c -o AFD
Esto generará un ejecutable llamado AFD.
```


2. Ejecución del programa
El programa recibe como parámetros los dos archivos de texto (AFD.txt y cadenas.txt):

``` bash
Copiar
Editar
./AFD AFD.txt cadenas.txt
```

# Ejecución en Python
También existe una versión del AFD implementada en Python.

##1. Ejecución
Ejecuta el siguiente comando:

```bash
Copiar
Editar
python3 AFD.py AFD.txt cadenas.txt
```

# Formato de los archivos de entrada
🔹 AFD.txt (ejemplo)

## Estados
Q0,Q1,Q2,Q3,Q4

## Alfabeto
a,b

## Estado inicial
Q0

## Estado de aceptación
Q4

## Transiciones (formato: estado, símbolo, estado_destino)
Q0,a,Q1
Q0,b,Q0

Q1,a,Q2
Q1,b,Q1

Q2,a,Q3
Q2,b,Q2

Q3,a,Q3
Q3,b,Q4

Q4,a,Q3
Q4,b,Q4

🔹 cadenas.txt

aaab

aab

aaaab

abab

aaaa

ab

baba

aaabb

#  Ejemplo de salida esperada
Al ejecutar el programa:

```bash
Copiar
Editar
./AFD AFD.txt cadenas.txt
```
Se obtiene:

Cadena: aaab → ACEPTA
Cadena: aab → NO ACEPTA
Cadena: aaaab → ACEPTA
Cadena: abab → NO ACEPTA
Cadena: aaaa → NO ACEPTA
Cadena: ab → NO ACEPTA
Cadena: baba → NO ACEPTA
Cadena: aaabb → ACEPTA

📌 Notas
El autómata se puede modificar en AFD.txt.

Las cadenas de prueba deben estar escritas una por línea en cadenas.txt.

