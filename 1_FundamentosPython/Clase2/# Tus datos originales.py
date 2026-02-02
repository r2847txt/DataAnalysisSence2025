# Claudia Orellana
# Claudio Carrillo

Individuos = [
    [1, 62, 1.65],
    [2, 72, 1.73],
    [3, 65, 1.57],
    [4, 70, 1.68],
    [5, 95, 1.89]
]

for persona in Individuos:
    individuo = persona[0]
    peso = persona[1]
    altura = persona[2]

    imc = peso / (altura ** 2)

    if imc < 18.5:
        estado = "Bajo peso"
    elif imc <= 24.9:
        estado = "Normal"
    elif imc <= 29.9:
        estado = "Sobrepeso"
    elif imc <= 34.9:
        estado = "Obesidad I"
    elif imc <= 39.9:
        estado = "Obesidad II"
    elif imc >= 49.9:
        estado = "Obesidad III"
    else:
        estado = "Obesidad IV"
    
    print(f"Individuo {individuo}: IMC = {imc:.2f}, Estado = {estado}")