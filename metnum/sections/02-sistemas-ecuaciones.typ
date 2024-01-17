#import "../theme.typ": *

= Sistema de ecuaciones lineales
Un sistema de ecuaciones lineales es un *conjunto de ecuaciones lineales que se deben cumplir simultáneamente*.

$ 
  a_(11) x_1 + a_(12) x_2 + ... + a_(1n) x_n = b_1 \
  a_(21) x_1 + a_(22) x_2 + ... + a_(2n) x_n = b_2 \
  dots.v \
  a_(m 1) x_1  + a_(m 2) x_2 + ... + a_(m n) x_n = b_m
$

Podemos armar una matriz *$A in RR^(m times n)$* con los coeficientes de las incógnitas, un vector *$x in RR^n$* con las incógnitas y un vector *$b in RR^m$* con los resultados de las ecuaciones:

$
A = mat(
  a_(11), a_(12), ..., a_(1n);
  a_(21), a_(22), ..., a_(2n);   
  dots.v, dots.v, dots.down, dots.v;
  a_(m 1), a_(m 2), ..., a_(m n);
) #h(1em) x = mat(
  x_1;
  x_2;
  dots.v;
  x_n;
) #h(1em) b = mat(
  b_1;
  b_2;
  dots.v;
  b_m;
)
$

Entonces, el sistema de ecuaciones lineales *se puede representar como una operación matricial*, en la que se busca encontrar el vector $x$ que cumple $ A x = b $.

Si $b in.not I m(A)$ entonces el sistema *no tiene solución*. 

Si $b in I m(A)$ entonces:
  - Si $rang(A) = n$ entonces el sistema *tiene una única solución*.
  - Si $rang(A) < n$ entonces el sistema *tiene infinitas soluciones*.

==== Sistemas equivalentes
Sean $A, B in RR^(n times n)$, y $b, d in RR^n$, entonces $A x = b$ y $B x = d$ son *sistemas equivalentes* si tienen el mismo conjunto de soluciones.

== Sistemas de ecuaciones diagonales
Sea $A in RR^(n times n)$ una matriz diagonal y $b in RR^n$, entonces $A x = b$ es un *sistema de ecuaciones diagonales* y se puede resolver despejando cada incógnita por separado:

$ 
  a_(11) x_1 = b_1 \
  a_(22) x_2 = b_2 \
  dots.v \
  a_(n n) x_n = b_n
$

- *Si $a_(i i) != 0$* para todo $i in {1, 2, ..., n}$, el sistema *tiene única solución* y $ x_i = b_i / a_(i i) $

- *Si $a_(i i) = 0$* para algún $i in {1, 2, ..., n}$:

  - Si $b_i = 0$ entonces el sistema *tiene infinitas soluciones*.
  - Si $b_i != 0$ entonces el sistema *no tiene solución*.

== Sistemas de ecuaciones triangulares

=== Backward Substituion
Sea $A in RR^(n times n)$ una *matriz triangular superior* y $b in RR^n$, entonces $A x = b$ es un sistema de ecuaciones triangulares de la forma:

$ 
  a_(11) x_1 + a_(12) x_2 + ... + a_(1n) x_n &= b_1 \
  a_(22) x_2 + ... + a_(2n) x_n &= b_2 \
  a_(33) x_3 + ... + a_(3n) x_n &= b_3 \
  dots.v \
  a_(n n) x_n &= b_n
$

- *Si $a_(i i) != 0$* para todo $i in {1, 2, ..., n}$, el sistema *tiene una única solución* y se puede resolver usando *backward substitution*:

$
  x_n &= b_n / a_(n n) \
  x_(n-1) &= (b_(n-1) - a_(n-1 n) x_n) / a_(n-1 n-1) \
  dots.v \
  x_i &= (b_i - sum_(j = i+1)^n a_(i j) x_j) / a_(i i) \
  dots.v 

$  
$
  x_1 &= (b_1 - sum_(j = 2)^n a_(1 j) x_j) / a_(1 1)
$

Esté método tiene *complejidad $cal(O)(n^2)$*.

- *Si $a_(i i) = 0$* para algún $i in {1, 2, ..., n}$:
  - Ejecutamos el algoritmo de backward substitution hasta llegar a la fila $i$. Osea que obtenemos los valores para $x_n, x_(n-1), ..., x_(i+1)$.
  - Comos todos estos valores son conocidos, simplemente hacemos la cuenta *$fila_i (A) x$*.
    - Si $b_i$ es el valor que obtenemos, entonces el sistema *tiene infinitas soluciones*.
    - Si no lo es, entonces el sistema *no tiene solución*.

=== Forward Substituion
Sea $A in RR^(n times n)$ una *matriz triangular inferior* y $b in RR^n$, entonces $A x = b$ es un sistema de ecuaciones triangulares que se resuelve de forma similar al los sistemas triangulares superiores, la única diferencia es que se resuelve de arriba hacía abajo:

$ 
  a_(11) x_1 &= b_1 \
  a_(21) x_1 + a_(22) x_2 &= b_2 \
  a_(31) x_1 + a_(32) x_2 + a_(33) x_3 &= b_3 \
  dots.v \
  a_(n 1) x_1 + a_(n 2) x_2 + ... + a_(n n) x_n &= b_n
$

== Sistemas de ecuaciones generales
=== Eliminación gaussiana
Sea $A in RR^(n times n)$ y $b in RR^n$, entonces usaremos el *método de eliminación gaussiana* para transformar el sistema original en un *sistema equivalente* que sea más fácil de resolver. En particular, vamos a transformar el sistema $A x = b$ en uno de la forma $U x = c$, donde $U$ es una *matriz triangular superior*.

Para esto, se aplican las siguientes *operaciones elementales*:

- *Multiplicar una fila por un escalar no nulo* usando una matriz elemental (tipo 1).
- *Intercambiar dos filas* usando una matriz de permutación. 
- *Sumar una fila multiplicada por un escalar no nulo a otra* fila usando una matriz elemental (tipo 2).

Debemos aplicar estas operaciones de forma tal que al final del proceso obtengamos un sistema de ecuaciones triangular superior. Para esto, vamos a aplicar el siguiente esquema:

#pseudo(title:"EliminaciónGaussiana", parameters:([$A$: Matriz], ))[
  Para $i <- 1$ a $n$ hacer #i\
    Para $j <- i + 1 " a " n$ hacer #i\
      $m_(i j) = a_(j i) / a_(i i)$\
      $fila_j (A) = fila_j (A) - m_(i j) fila_i (A)$#d\
    Fin#d\
  Fin
]

La version mostrada *asume que $a_(i i) != 0$* para todo $i in {1, 2, ..., n}$, en todo momento. 

#propiedad[
  El algoritmo propuesto tiene complejidad *$cal(O)(n^3)$*.
]
=== Eliminación Gaussiana con pivoteo
Si en alguna iteración, nos encontramos con que *$a_(i i) = 0$* entonces pueden darse dos posibles situaciones:
- *$a_(j i) = 0$* para todo $j in {i+1, i+2, ..., n}$: En este caso, la fila $i$ es nula, y podemos *pasar a la siguiente iteración*.
- Existe algún $j in {i+1, i+2, ..., n}$ tal que *$a_(j i) != 0$*: En este caso, *intercambiamos la fila $i$ con la fila $j$*, y continuamos con el algoritmo.

*En la práctica* debemos tener en cuenta que *los números de coma flotante tienen precisión finita* por lo que debemos elegir de manera cuidadosa el pivote. Usaremos dos estrategias para esto:

- *Pivoteo parcial*: En cada iteración, elegimos entre las filas $i, i+1, ..., n$ aquella que tiene el mayor valor absoluto en la columna $i$. Luego, intercambiamos la fila $i$ con la fila elegida.

- *Pivoteo completo*: En cada iteración, buscamos la celda que tiene el mayor valor absoluto entre todas las filas $i, i+1, ..., n$ y todas las columnas $i, i+1, ..., n$. Luego, intercambiamos la fila $i$ con la fila de la celda elegida, y la columna $i$ con la columna de la celda elegida.
