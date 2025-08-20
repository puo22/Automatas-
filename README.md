# Proyecto: Autómata Finito Determinista (AFD)

Este proyecto implementa un **Autómata Finito Determinista (AFD)** que permite verificar si un conjunto de cadenas son aceptadas o rechazadas.  
La implementación está hecha en **Flex y Bison (C)** y también existe una versión alternativa en **Python**.  

---

## 📂 Archivos principales

- `AFD.txt` → Contiene la definición del autómata (alfabeto, estados, transiciones, estado inicial y estados finales).  
- `cadenas.txt` → Contiene las cadenas de prueba (una por línea).  

---

# ⚙️ Ejecución en C (Flex & Bison)

### 1. Compilación
Ejecuta en la terminal:

```bash
bison -d AFD.y
flex AFD.l
gcc AFD.tab.c lex.yy.c -o AFD
Esto generará un ejecutable llamado AFD.

2. Ejecución del programa
El programa recibe como parámetros los dos archivos de texto (AFD.txt y cadenas.txt):

bash
Copiar
Editar
./AFD AFD.txt cadenas.txt

# 🐍 Ejecución en Python
También existe una versión del AFD implementada en Python.

##1. Ejecución
Ejecuta el siguiente comando:

bash
Copiar
Editar
python3 AFD.py AFD.txt cadenas.txt

# 📑 Formato de los archivos de entrada
🔹 AFD.txt (ejemplo)
makefile
Copiar
Editar
alfabeto: a b
estados: q0 q1 q2
inicial: q0
finales: q2
transiciones:
q0 a q1
q1 b q2
q2 a q2
🔹 cadenas.txt (ejemplo)
nginx
Copiar
Editar
aaab
aab
aaaab
abab
aaaa
ab
baba
aaabb
# ✅ Ejemplo de salida esperada
Al ejecutar el programa:

bash
Copiar
Editar
./AFD AFD.txt cadenas.txt
Se obtiene:

makefile
Copiar
Editar
Cadena: aaab → ACEPTADA
Cadena: aab → ACEPTADA
Cadena: aaaab → ACEPTADA
Cadena: abab → RECHAZADA
Cadena: aaaa → RECHAZADA
Cadena: ab → ACEPTADA
Cadena: baba → RECHAZADA
Cadena: aaabb → RECHAZADA
📌 Notas
El autómata se puede modificar en AFD.txt.

Las cadenas de prueba deben estar escritas una por línea en cadenas.txt.

