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
       

print("Calculadora Python 2")
print("-------------------")

num1 = float(input("Ingrese operando 1: "))
num2 = float(input("Ingrese operando 2: "))
operador = input("Ingrese el operación (+, -, *, /, log, pow, sqr, !): ") 

resultado = calculadora(num1, num2, operador)
print("El resultado es:", resultado)