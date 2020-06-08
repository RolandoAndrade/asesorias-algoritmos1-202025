# Buscaminas


¿Alguna vez has jugado al Buscaminas? Este pequeño y lindo juego viene con un cierto sistema operativo cuyo nombre no podemos
recordar. El objetivo del juego es encontrar dónde están ubicadas todas las minas dentro de un campo de M × N.
El juego muestra un número en un cuadrado que te dice cuántas minas hay adyacentes a ese cuadrado. 
Cada cuadrado tiene como máximo ocho cuadrados adyacentes. El campo de 4 × 4 a la izquierda contiene dos minas, 
cada una representada por un carácter "*". Si representamos el mismo campo por los números de pista descritos anteriormente,
terminamos con el campo a la derecha: 

![](https://steakrecords.com/images/algorithm/understanding-the-minesweeper-programming-problem.png)

El objetivo es que programes usando pascal una simulación donde se cree un tablero 10x10 con minas aleatorias y el programa llene
con los números respectivos las celdas adyeacentes.

Como este programa lo vamos a usar más adelante, te recomiendo hacerlo de la siguiente forma.

- Crea una función para generar un tablero aleatorio.

- Crea un procedimiento para mostrar el tablero.

- Crea una función que cuente el número de bombas alrededor de una casilla i,j en un tablero.

- Crea un procedimiento para recorrer todas las celdas del tablero, asignando en la celda, la función de contar bombas adyeacentes
solo en el caso de la celda que se esté evaluando no sea una bomba.
