# Granjavilla

## Intro
Héctor es un granjero que se gana la vida cultivando plantas de distintas especies.
Para ello tiene que sembrar, regar y cosechar sus cultivos. Después de la cosecha, Héctor vende lo que cultivó, obteniendo ganancias en la forma de monedas de oro.
Héctor es muy ahorrativo y todo el oro que obtiene por sus cosechas lo acumula.

Nuestro objetivo es construir un juego en el que podamos controlar a héctor, 
utilizando el teclado para moverlo alrededor del tablero. 

En este juego consideramos tres especies: _maíz_, _trigo_ y _tomaco_. 

Contamos con imágenes en la carpeta assets para ilustrar el juego.

TIP: En los nombres de las imágenes, recordar que "corn" es maíz y "wheat" es trigo en inglés.

## Sembrar
Además de moverse, Héctor debe poder realizar las siguientes acciones:
- Al apretar la M siembra una semilla de maíz en su posición actual.
- Al apretar la T siembra una semilla de trigo en su posición actual.
- Al apretar la O siembra una semilla de tomaco en su posición actual.

El acto de sembrar crea una nueva planta, con estas características:  

| Planta | Situación al ser sembrada |
|---|---|
| **Maíz**   | Es una planta bebé, corresponde la imagen `corn_baby.png` |
| **Trigo**  | Está en etapa de evolución 0, corresponde la imagen `wheat_0.png` |
| **Tomaco** | Es una planta hecha y derecha, corresponde la imagen `tomaco.png` | 


**Atención**  
queda librado a cada quien si se permite, o no, que haya más de una planta en una misma posición. 
Vale cuidarse de no hacerlo al principio, y agregar la validación más adelante.  
_OJO_ si se pone en la misma posición p.ej. dos plantas de maíz, entonces al regarse se van a regar las dos, al cosecharse se van a cosechar las dos, etc, pero se va a mostrar una sola imagen.


## Regar
Una vez sembrado un cultivo, para que crezca debe ser regado. 
Cuando presionamos la R, Héctor debe regar la planta que se encuentre en su misma posición.
Si no hay una planta, tirar una excepción indicando "no tengo nada para regar".

Qué pasa cuando se riega una planta: 

| Planta | Efecto al ser regada |
|---|---|
| **Maíz**   | Si es bebé, pasa a adulta, y la imagen cambia a `corn_adult.png`. <br> Si ya es adulta, no hacer nada |
| **Trigo**  | Pasa a la etapa de evolución siguiente: de 0 a 1, de 1 a 2, de 2 a 3, de 3 vuelve a 0. <br> La imagen cambia a `wheat_x.png`, donde la x corresponde a la etapa de evolución. |
| **Tomaco** | Se mueve a la celda de arriba. <br> Si ya está en el borde de arriba, no hace nada (o pasa abajo de todo :D) | 
  

## Aspersor
![aspersor](https://i.pinimg.com/originals/20/f5/ab/20f5ab811789f5ed4ca147f199bbad51.jpg)

Héctor tiene un aspersor que lo ayuda con la tarea de regado.
Hacer que el juego comience con el aspersor en el centro del juego. El aspersor de Héctor riega todas las plantas que están alrededor cada 5 segundos.

**TIP**  
Investigar los métodos 
- `game.onTick(milliseconds, name, action)` para ejecutar un bloque de código cada cierto tiempo.
- `game.getObjectsIn(position)` para saber todos los objetos que están en una posición.

## Cosecha
Las plantas adultas se pueden cosechar.
Cuando presionamos la C, se espera que Héctor coseche la planta que se encuentra en su misma posición.
Otra vez, si no hay ninguna planta, tirar una excepción indicando "no tengo nada para cosechar".

Si hay una planta, puede o no estar lista para la cosecha.
El _maíz_ está listo para la cosecha si es adulto, el _trigo_ si está en nivel de evolución 2 o más, el _tomaco_ siempre.

Si la planta está lista para la cosecha, se la cosecha, para luego poder venderla. Héctor debe recordar qué plantas tiene para vender. El acto de cosechar una planta implica que desaparece del juego.  
Caso contrario, no se hace nada.

**Nota**  
Si hay varias plantas en el mismo lugar, puede ser que algunas estén para cosechar y otras no. OJO con eso.

**TIP**  
Buscar la docentación de Wollok game en http://www.wollok.org/documentacion/wollokdoc/ 
para saber cómo obtener los objetos que están en la misma posición que Héctor.
Ojo que al hacer eso, entre los objetos que encuentren va a estar el propio Héctor.

## Venta
Usando la letra V, Héctor vende lo que tiene para vender.
   
Al hacerlo, obtiene el oro por cada planta que tiene, de acuerdo a esta especificación:
- **Maíz**: 150 monedas por planta.
- **Trigo**: 100 monedas si está en etapa 2, 200 si está en etapa 3. La cuenta cheta es `(etapa - 1) * 100`.
- **Tomaco**: 80 monedas por planta.

Héctor debe acumular el oro y recordar cuánto oro obtuvo en total. Al presionar la barra espaciadora, queremos que Héctor nos diga: cuántas plantas tiene para vender, y cuánto oro juntó en total.  
P.ej. "tengo 800 monedas, y 3 plantas para vender".

**Atenti**  
Una vez que vende lo que tiene para vender, obviamente, deja de tenerlo.


## Bonus: varios mercados
Incluir dos o tres mercados (imagen `market.png`), eligiendo dónde poner cada uno en el tablero. 
Cada mercado tiene una cantidad de monedas, y mercadería para vender.  
Hacer que Héctor solamente pueda vender si está en un mercado, y además el mercado tiene suficiente cantidad de monedas para pagar lo que Héctor tiene para vender. En tal caso, la mercadería se agrega al mercado, y se le descuentan las monedas que le da a Héctor en pago.  

## Bonus2: varios aspersores
Hacer que Héctor pueda comprar aspersores en los mercados. Existen 3 tipos de aspersores:
- el que riega cada 5 segundos (como el de Héctor)
- el que riega cada 2 segundos
- el que riega cada 1 segunda

Cada uno tiene su precio (el de 1 segundo cuesta más caro que el de 5), ustedes deciden los valores.
