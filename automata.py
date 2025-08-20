import re

# Archivos
afd_file = "AFD.txt"
cadenas_file = "cadenas.txt"

# Cargar AFD
with open(afd_file, "r") as f:
    lineas = [l.strip() for l in f if l.strip() and not l.startswith("#")]

estados = lineas[0].split(",")
alfabeto = lineas[1].split(",")
estado_inicial = lineas[2]
estado_aceptacion = lineas[3].split(",")[0]  # asumimos un solo estado de aceptación

# Transiciones
transiciones = {}
for t in lineas[4:]:
    origen, simbolo, destino = t.split(",")
    transiciones[(origen, simbolo)] = destino

# Función para validar cadena
def validar(cadena):
    if not re.fullmatch(f"[{''.join(alfabeto)}]*", cadena):
        return False
    estado = estado_inicial
    for s in cadena:
        estado = transiciones.get((estado, s))
        if not estado:
            return False
    return estado == estado_aceptacion

# Leer y evaluar cadenas
with open(cadenas_file, "r") as f:
    for cadena in f:
        c = cadena.strip()
        print(f"{c} -> {'ACEPTA' if validar(c) else 'NO ACEPTA'}")
