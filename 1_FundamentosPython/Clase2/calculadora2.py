# Crear un script en Python que emule el comportamiento de una calculadora. La calculadora debe soportar las 4 operaciones básicas (suma, resta, multiplicación y división). La calculadora debe soportar operaciones científicas (log, potencia, raíz cuadrada, factorial). Debe preguntar los operandos y la operación en la entrada de la consola. • Debe encapsular las operaciones en funciones.

import math

def calculadora1(num1, num2, operador):
        if operador == '+':
            return num1 + num2
        elif operador == '-':
            return num1 - num2
        elif operador == '*':
            return num1 * num2
        elif operador == '/':
            if num2 != 0:
                return num1 / num2
            else:
                return "Error: División por cero"
        else:
            return "Error: Operador no válido"
        
def calculadora2(num, operador):
        if operador == 'log':
            if num > 0:
                return math.log(num)
            else:
                return "Error: Logaritmo de número no positivo"
        elif operador == 'sqr':
            if num >= 0:
                return math.sqrt(num)
            else:
                return "Error: Raíz cuadrada de número negativo"
        elif operador == '!':
            if num >= 0 and num.is_integer():
                return math.factorial(int(num))
            else:
                return "Error: Factorial de número negativo o no entero"
        else:
            return "Error: Operador científico no válido"
        
print("Calculadora Python 2")
print("-------------------")

num1 = float(input("Ingrese operando 1: "))
operador = input("Ingrese el operación (+, -, *, /, log, pow, sqr, !): ")
if operador in ['+', '-', '*', '/']:
    num2 = float(input("Ingrese operando 2: "))
    resultado = calculadora1(num1, num2, operador)
elif operador in ['log', 'pow', 'sqr', '!']:
    resultado = calculadora2(num1, operador)
else:
    resultado = "Operador invalido"

print("El resultado es:", resultado)