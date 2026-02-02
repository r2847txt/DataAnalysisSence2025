# ftgonzalezl93@gmail.com 



def calculariva(num):
    return num * 0.19
'''
print(calculariva(3000))    # respuesta esperada 570
print(calculariva(12000))   # respuesta esperada 2280
print(calculariva(46000))   # respuesta esperada 8740
print(calculariva(78000))   # respuesta esperada 14820
'''

def area_figura(altura, ancho):
    return altura * ancho
'''
print(area_figura(40, 60))   # respuesta esperada 2400
print(area_figura(15, 42))   # respuesta esperada 630
print(area_figura(10, 700))  # respuesta esperada 7000
print(area_figura(7, 42))    # respuesta esperada 294
'''

def hora_a_minutos(horas):
    return horas * 60
'''
print(hora_a_minutos(40))  # respuesta esperada 2400
print(hora_a_minutos(20))  # respuesta esperada 1200
print(hora_a_minutos(6))   # respuesta esperada 360
print(hora_a_minutos(13))  # respuesta esperada 780
'''

def descuento(precio, descuento):
    return (precio * descuento / 100)
'''
print(descuento(4000, 5))    # respuesta esperada 200
print(descuento(7200, 10))   # respuesta esperada 720
print(descuento(10000, 12))  # respuesta esperada 1200
print(descuento(14000, 8))   # respuesta esperada 1120
'''

def cuota(precio):
    return precio * 2 / 100
'''
print(cuota(4000))     # respuesta esperada 80
print(cuota(12000))    # respuesta esperada 240
print(cuota(60000))    # respuesta esperada 1200
print(cuota(800000))   # respuesta esperada 16000
'''

def propina(precio):
    return precio * 0.1
'''
print(propina(70000))   # respuesta esperada 7000
print(propina(12340))   # respuesta esperada 1234
print(propina(400))     # respuesta esperada 40
print(propina(132000))  # respuesta esperada 13200
'''


def dolar_a_peso(dolar):
    return dolar * 950
'''
print(dolar_a_peso(70))    # respuesta esperada 66500
print(dolar_a_peso(100))   # respuesta esperada 95000
print(dolar_a_peso(900))   # respuesta esperada 855000
print(dolar_a_peso(3000))  # respuesta esperada 2850000
'''


def peso_a_dolar(peso):
    return peso / 950
'''
print(peso_a_dolar(13000))    # respuesta esperada 13.684...
print(peso_a_dolar(38000))    # respuesta esperada 40
print(peso_a_dolar(40000))    # respuesta esperada 42.105...
print(peso_a_dolar(1000000))  # respuesta esperada 1052.632...
'''

# Ejercicios: Funciones con condicionales (if)

def verificarNumero(num):
    if num > 0:
        return "Positivo"
    elif num < 0:
        return "Negativo"
    else:
        return "Cero"
'''   
print(verificarNumero(10))    # respuesta esperada "Positivo"
print(verificarNumero(-5))    # respuesta esperada "Negativo"  
print(verificarNumero(0))     # respuesta esperada "Cero"
'''

def parOImpar(num):
    if num % 2 == 0:
        return "Par"
    else:
        return "Impar"
'''  
print(parOImpar(4))         # respuesta esperada "Par"
print(parOImpar(7))         # respuesta esperada "Impar"
'''

def puedeVotar(edad):
    if edad >= 18:
        return "Puedes votar"
    else:
        return "No puedes votar"
'''
print(puedeVotar(20))       # respuesta esperada "Puedes votar"
print(puedeVotar(16))       # respuesta esperada "No puedes votar"
'''

def mayorDeDos(num1, num2):
    if num1 > num2:
        return num1
    elif num1 < num2:
        return num2
    else:
        return "Son iguales"
'''
print(mayorDeDos(10, 5))    # respuesta esperada 10
print(mayorDeDos(3, 8))     # respuesta esperada 8
print(mayorDeDos(5, 5))     # respuesta esperada "Son iguales"
'''

def verificarContrasena(contrasena):
    if contrasena == "quesucede?":
        return "Acceso permitido"
    else:
        return "Contraseña incorrecta"
''' 
print(verificarContrasena("quesucede?"))    # respuesta esperada "Acceso permitido"
print(verificarContrasena("incorrecta"))     # respuesta esperada "Contraseña incorrecta"
'''

def verificarAprobacion(nota):
    if nota > 7 or nota < 1 :
        return "nota invalida"
    elif nota >= 4:
        return "Aprobado"
    else:
        return "Reprobado"
'''    
print(verificarAprobacion(8))    # respuesta esperada "nota invalida"
print(verificarAprobacion(6))    # respuesta esperada "Aprobado"
print(verificarAprobacion(3))    # respuesta esperada "Reprobado"
print(verificarAprobacion(0))    # respuesta esperada "nota invalida"
'''

def puedeEntrar(edad, tieneEntrada):
    if edad >= 18 and tieneEntrada:
        return "Puedes entrar"
    else:
        return "No puedes entrar"
'''   
print(puedeEntrar(20, True))     # respuesta esperada "Puede entrar"
print(puedeEntrar(16, True))     # respuesta esperada "No puedes entrar"
print(puedeEntrar(22, False))    # respuesta esperada "No puedes entrar"
'''

def mayorDeTres(num1, num2, num3):
    if num1 >= num2 and num1 >= num3:
        return num1
    elif num2 >= num1 and num2 >= num3:
        return num2
    else:
        return num3
'''   
print(mayorDeTres(10, 5, 8))    # respuesta esperada 10
print(mayorDeTres(3, 8, 6))     # respuesta esperada 8
print(mayorDeTres(7, 4, 9))     # respuesta esperada 9
print(mayorDeTres(5, 5, 2))     # respuesta esperada 5
print(mayorDeTres(4, 4, 4))     # respuesta esperada 4
'''


def calcularDescuento(monto):
    if monto > 1000:
        return monto * 0.2
    elif monto >= 500:
        return monto * 0.1
    else:
        return "Sin descuento"
'''   
print(calcularDescuento(1500))   # respuesta esperada 300.0
print(calcularDescuento(700))    # respuesta esperada 70.0
print(calcularDescuento(300))    # respuesta esperada "Sin descuento"
'''


def clasificarNota(nota):
    if nota >= 9:
        return "Excelente"
    elif nota >= 7:
        return "Bueno"
    elif nota >= 5:
        return "Suficiente"
    else:
        return "Insuficiente"

print(clasificarNota(9.5))    # respuesta esperada "Excelente"
print(clasificarNota(8))      # respuesta esperada "Bueno"
print(clasificarNota(6))      # respuesta esperada "Suficiente"
print(clasificarNota(4))      # respuesta esperada "Insuficiente"

print("=== TEST DE FUNCIONES ===")
# escribir acá las funciones

try:
    verificarNumero(5)
    verificarNumero(-3)
    verificarNumero(0)

    parOImpar(4)
    parOImpar(7)

    puedeVotar(20)
    puedeVotar(15)

    mayorDeDos(8, 5)
    mayorDeDos(5, 8)
    mayorDeDos(5, 5)

    verificarContrasena("1234")
    verificarContrasena("abcd")

    verificarAprobacion(5.5)
    verificarAprobacion(3)

    puedeEntrar(20, True)
    puedeEntrar(17, True)
    puedeEntrar(19, False)

    mayorDeTres(5, 9, 3)
    mayorDeTres(10, 4, 10)

    calcularDescuento(1200)
    calcularDescuento(600)
    calcularDescuento(300)

    clasificarNota(6.8)
    clasificarNota(5.3)
    clasificarNota(4.5)
    clasificarNota(3.9)

    print("✅ Test ejecutado correctamente. Revisa los resultados arriba.")
except Exception as error:
    print(f"❌ Error al ejecutar el test: {error}")