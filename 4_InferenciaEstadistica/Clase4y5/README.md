# Intervalos de confianza
Realiza estimaciones de la media de una población utilizando intervalos de confianza a partir de una muestra aleatoria.

## Intervalos de confianza
### Intuición
Supongamos que se quiere estimar la media de altura de una población de jóvenes adultos. Para este efecto, se toma una muestra aleatoria de 50 jóvenes adultos y se mide su alturra. Se encuentra que la media de altura de la muestra es de 175cm y la desviación estándar es de 5cm.
Lo primero que pensaríamos es en utilziar el promedio de las alturas de las muestras, pero no sabemos qué tan alejado está del valor real de la población. La mala noticia es que posiblemente nunca sabremos el valor certero a partir de esta muestra. La buena noticia es que, a pesar de lo anterior, al menos podemos saber entre qué rango de valores podría encontrarse.
En este caso, con un 95% de probabilidad podemos inferir que la media de la altura de la población de jóvenes adultos se encuentra en el rango 175cm ± 1,42cm.

### Definición intervalo de confianza
Un intervalo de confianza es un rango de valores que se utiliza para estimar un parámetro desconocido de una población, como la media o la proporción. Este rango se basa en una muestrra de la población y se utiliza para proporcionar una medida de incertidumbre alrededor de la estimación.
En otras palabras, si se tiene una muestra de una población y se desea estimar un parámetro poblacional, se puede construir un intervalo de confianza que contenga el valor más probable del parámetro.
El nivel de confianza se refiere a la probabilidad de que el verdadero valor del parámetro poblacional se encuentre dentro de dico intervalo. Los intervalos de confianza se construyen utiliozanddo técnicas estadísticas y se basan en el tamaño de la muestra y la variabilidad de la muestra.

### Algunas definiciones
- **Estimador puntual**: Consiste en un solo valor (punto) deducido de una muestra para estimar el valor de una población. (Lind, Marchal y Whaten, 2008, p.294).
- **Estimador por intervalo**: Es aquel en el que se espera encontrar el parámetro poblacional.
- **Intervalo de confianza**: Intervalo de las estimaciones probables sobre el parámetro.
- **Límites de los intervalos de confianza**: Son los valores extremos del intervalo de confianza.

### Nivel de confianza
Tomamos una muestra de una clase de idiomas y podemos estimar que el promedio general de la clase de idiomas es de 8,35. Al construir un intervalo para esta afirmación, podemos encontrar los 2 puntos que van de 7,9 a 8,99.
Ahora, debemos establecer una afirmación que nos garantice que el promedio general del grupo se encuentra justo entre los 2 puntos que encontramos. Para ello utilizamos un nivel de confianzxa que nos permitirá emitir el siguiente enunciado:
*Contamos con el 90% de confianza, o de seguridad, de que el promedio general de la clase de idiomas se encuentra entre los valores de 7,8 y 8,9.*
Si quisiéramos tener un nivel de confianza más alto, por ejemplo, de 95%, deberíamos ampliar el rang o o intervalo. ¿Cómo hacerlo?
Ahora debemos asignar los valores al límite inferior y al superior. Sabemos que el área que hay dentro de nuestro intervalo es de 0.95, por lo tanto, el valor de cada cola es de 0.025, al sumar ambas, obtenemos el valor de 0.05.
Nuestro último paso consiste en ubicar dentro de nuestra tabla Z los valores de 0.0255 en el caso del límite inferior y 0.975 en el caso del límite inferior. Una vez que encontramos esos valores podemos afirmar que para el nivel de confianza de 95% el valor Z es igual a +1.96 y -1.96 respectivamente.

### Intervalo de confianza para la media poblacional
Para calcular nuestro intervalo es necesario conocer el valor Z de nuestro nivel de confianza. Una vez que lo descubrimos podemos aplicar la fórmula y de esta manera establecer el valor inferior y superior:

\[ \overline{X} \pm z \frac{\sigma}{\sqrt{n}} \]

Un intervalo de confianza nos permite conocer un rango de valores obtenidos a través de una muestra, con el objetivo de conocer un parámetro desconocido, en este caso la media de la población.

### IC para la media con varianza conocida (n>=30)
**Interv alo de confianza**:

\[
\bar{X} - Z_{\alpha/2} \frac{\sigma}{\sqrt{n}} < \mu < \bar{X} + Z_{\alpha/2} \frac{\sigma}{\sqrt{n}}
\]

- \(\sigma\): desviación estándar de la población  
- \(n\): tamaño de la muestra  
- \(Z_{\alpha/2}\): valor crítico de la distribución normal para el nivel de confianza \((1 - \alpha)\)

### Fórmulas estadísticas

1. **Tamaño de la muestra:**

\[
n = \left( \frac{Z_{\alpha/2} \cdot \sigma}{e} \right)^2
\]

2. **Longitud del intervalo:**

\[
L = 2 \left( \frac{Z_{\alpha/2} \cdot \sigma}{\sqrt{n}} \right)
\]

3. **Error estándar:**

\[
\sigma_x = \frac{\sigma}{\sqrt{n}}
\]

### IC para la media con varianza desconocida (n<30)
Cuando la varianza poblacional no es conocida utilizamos la distribución de "t" de "student", para tamaños de muestra n<30.
Como \(\sigma^2\) no se conoce, se estima mediante \(s^2\). La distribución se desvía en forma apreciable cuando los grados de libertad (v = n - 1) son pequeños.
El estadístico t definido resulta de una muestra aleatoria seleccionada de una población normal con varianza \(\sigma^2\) no conocida.

**Intervalo de confianza**:

\[
\bar{X} - t_{\alpha/2} \frac{s}{\sqrt{n}} < \mu < \bar{X} + t_{\alpha/2} \frac{s}{\sqrt{n}}
\]

- \(s\): desviación estándar de la muestra  
- \(n\): tamaño de la muestra  
- \(t_{\alpha/2}\): valor crítico de la distribución t-student para el nivel de confianza \((1 - \alpha)\)

## Bootstrapping
### ¿Qué es el bootstrapping?
En cienda de datos, hay situaciones en que es necesario cuantificar la incertidumbre que hay alrededor de un valor, sea una medición, una predicción, una estimación, etc. Por ejemplo, un caso típico es resumir un conjunto de valores que siguen una determinada distribución aleatoria usando un estadístico, como por ejemplo la media.
El enfoque tradicional ha sido utilizar métodos analíticos para cuantificar esta incertidumbre, pero no siempre existe una fórmula analítica para todas las posibles situaciones, además, muchas veces estos métodos deben cumplir con requisitos o supuestos para su aplicación que no siempre se cumplen.
Hoy en día existe la alternativa de utilizar métodos computacionales (algorítmicos) que obtienen resultados equivalentes a los métodos analíticos. Estos métodos tienen muchas menos restricciones y son más fáciles de entender y aplicar. Sin embargo, son más lentos puesto que necesitan realizar un número elevado de operaciones en su procesamiento, aunque esto no es un problema, dada la creciente potencia de cálculo de las máquinas.
Justametne uno de estos métodos computacionales es el **Bootstrapping**, y se le llama así a un conjunto de técnicas que utilizan muestreos aleatorios con reemplazo a partir de una distribución de la partida para estimar intervalos de confianza, distribuciones muestrales de un parámetro, etc.
La idea es simple, partiendo de la muestra original, extraemos nuevas muestras aleatorias con reemplazo del mismo tamaño y calculamos el estadísticos de interés (media, varianza, etc), repitiendo este proceso un número elevado de veces. Esto nos dará una distribución muestral del estadístico que nos interese, sobre la que podremos calcular, por ejemplo, **intervalos de confianza**. Cuantas más veces lo repitamos, mayor será la distribución muestral generada, y más precisa será la estimación que hagamos (de aquí el coste computacional de este método).
Desde el punto de vista teórico, el escenario ideal para realizar inferencia sobre una población es disponer de infinitas (o una gran cantiddad) de muestras de dicha población. Si para cada muestra se calcula el estadístico de interés, por , la media, se obtiene lo que se conoce como distribución muestral. Esta distribución tiene 2 características: su promedio tiende a converger con el valor real del parámetro poblacional, y su dispersión permite conocer el error esperado al estimar el estadístico con una muestra de un tamaño determinado.
En la practica, no suele ser posible acceder a múltiples muestras. Si solo se dispone de una muestra, y ésta es representativa de la población, cabe esperar que los valores en la muestra aparezcan aproximadamente con la misma frecuencia que en la población.
Así pues, bootstrapping es un proceso de simulación gracias al cual se puede aproximar la distribución muestral de un estadístico empleando únicamenteuna muestra inicial. Ahora bien, es importante destacar qué información puede y no puede extraerse.
- Bootstrapping no proporciona una mejor estimación del estadístico que la obtenida con la muestra original.
- Bootstrapping simula el proceso de muestro y con ello la variabilidad generada por este proceso, Gracias a esto, permite estimar la incertidumbre quye se puede esperar de un estadístico calculado a partir de una muestra.