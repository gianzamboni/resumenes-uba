#import "../theme.typ": *

= Elementos del álgebra lineal
== Vectores
Un *vector es un conjunto ordenado de números reales*, que se pueden representar como una lista de números. Por ejemplo, el vector $v in RR^n$ se puede representar como $v = (1, 2, 3)$.

=== Suma
Para *sumar dos vectores*, se suman las componentes correspondientes:

$ w = v + u " con " w_i = v_i + u_i " para " i = 1, 2, 3, ..., n $ 

La suma de vectores es *conmutativa* y *asociativa*.

=== Multiplicación por escalares
Los vectores se pueden *multiplicar por escalares*: Sea $alpha in RR$ y $v in RR^n$, entonces $ alpha dot v = (alpha dot v_1, alpha dot v_2, ..., alpha dot v_n)$ para 

=== Producto interno
El *producto interno* de dos vectores $v, u in RR^n$ se define como:

  $ v dot u = sum_(i=1)^n v_i u_i = ||v|| ||u|| cos theta \ " donde " theta " es el angulo entre " v " y " u $

Graficamente, el producto interno se puede interpretar como la *proyección de un vector sobre otro*.
 
=== Combinación Lineal
Una *combinación lineal* $w$ de vectores $v_1, v_2, ..., v_n$ es un vector de la forma 

$ w = sum_(i=1)^n alpha_i v_i " con " alpha_i in RR^n $

Decimos que $v_1$, $v_2$, ..., $v_n$ son *linealmente independientes* si la única combinación lineal que da el vector nulo es la trivial, es decir, si $alpha_1 = alpha_2 = ... = alpha_n = 0$.

En cambio, si existe una combinación lineal no trivial (algún $alpha_i eq.not 0$ ) que da el vector nulo, entonces los vectores son *linealmente dependientes*.

Nombramos *espacio generado* por un conjunto de vectores $v_1, v_2, ..., v_n$ al conjunto de todas las combinaciones lineales de esos vectores:

$ S = { x in RR^n " tal que " x = sum_(i=1)^n alpha_i v_i } $

y su *dimensión* es la cantidad máxima de vectores linealmente independientes que lo generan.

=== Base vectorial
Una *base vectorial* $B$ es un conjunto de vectores linealmente independientes que generan un espacio vectorial. En otras palabras, $B$ es una base de $S$ si todos los vectores *$v in S$ se pueden escribir como una combinación lineal de los vectores de $B$*.

== Matrices
Una matriz es un *arreglo rectangular de números reales*. Por ejemplo, la matriz $A in RR^(m times n)$ se puede representar como:

$ A = mat(
    a_(11), a_(12), ..., a_(1n);
    a_(21), a_(22), ..., a_(2n);   
    dots.v, dots.v, dots.down, dots.v;
    a_(i 1), a_(i 2), ..., a_(in);
    dots.v, dots.v, dots.v, dots.v;
    a_(m 1), a_(m 2), ..., a_(m n);
  ) $

=== Suma
Sean $A, B in RR^(m times n)$, entonces $A + B = C in RR^(m times n)$, donde $C_(i j) = A_(i j) + B_(i j)$.
$
  A + B = mat(
    a_(11) + b_(11), a_(12) + b_(12), ..., a_(1n) + b_(1n);
    a_(21) + b_(21), a_(22) + b_(22), ..., a_(2n) + b_(2n);   
    dots.v, dots.v, dots.down, dots.v;
    a_(i 1) + b_(i 1), a_(i 2) + b_(i 2), ..., a_(in) + b_(i n);
    dots.v, dots.v, dots.v, dots.v;
    a_(m 1) + b_(m 1), a_(m 2) + b_(m 2), ..., a_(m n) + b_(m n);
  )
$

La suma de matrices es *conmutativa* y *asociativa*.

Notar que para poder sumar dos matrices, *deben tener la misma dimensión*.

=== Producto por escalares
Sean $A in RR^(m times n)$ y $alpha in RR$, entonces $alpha A = B in RR^(m times n)$, donde $B_(i j) = alpha A_(i j)$.

$
  blue(alpha) A = mat(
    blue(alpha) a_(11), blue(alpha) a_(12), ..., blue(alpha) a_(1n);
    blue(alpha) a_(21), blue(alpha) a_(22), ..., blue(alpha) a_(2n);   
    dots.v, dots.v, dots.down, dots.v;
    blue(alpha) a_(i 1), blue(alpha) a_(i 2), ..., blue(alpha) a_(in);
    dots.v, dots.v, dots.v, dots.v;
    blue(alpha) a_(m 1), blue(alpha) a_(m 2), ..., blue(alpha) a_(m n);
  )
$

=== Producto de matrices
Sean $A in RR^#blue($m times n$)$ y $B in RR^#blue($n times p$)$, entonces $A B = C in RR^#blue($m times p$)$, donde $ C_(i j) = sum_(k=1)^n a_(i k) b_(k j) $

$
  A B = mat(
    sum_(k=1)^n a_(1 k) b_(k 1), sum_(k=1)^n a_(1 k) b_(k 2), ..., sum_(k=1)^n a_(1 k) b_(k p);
    sum_(k=1)^n a_(2 k) b_(k 1), sum_(k=1)^n a_(2 k) b_(k 2), ..., sum_(k=1)^n a_(2 k) b_(k p);   
    dots.v, dots.v, dots.down, dots.v;
    sum_(k=1)^n a_(i k) b_(k 1), sum_(k=1)^n a_(i k) b_(k 2), ..., sum_(k=1)^n a_(i k) b_(k p);
    dots.v, dots.v, dots.v, dots.v;
    sum_(k=1)^n a_(m k) b_(k 1), sum_(k=1)^n a_(m k) b_(k 2), ..., sum_(k=1)^n a_(m k) b_(k p);
  )
$

=== Rango de una matriz
El *rango de una matriz* $A in RR^(m times n)$ es la *cantidad máxima de columnas linealmente independientes* que tiene.

=== Determinante de una matriz
El *determinante $det(A)$* de una matriz $A in RR^(n times n)$ es un *número real* que se calcula como:

$ 
  det(A) = sum_(i = 1)^(n) (-1)^(i + j) a_(i j) det(A_(i j)) " para cualquier " j in {1, 2, ..., n}
$

donde $A_(i j)$ es la matriz que se obtiene de $A$ al eliminar la fila $i$ y la columna $j$.

Graficamente, *es el área del paralelogramo que forman las filas de $A$*. En un espacio, el determinante es el volumen del paralelepípedo correspondiente.

=== Espacio imagen
El *espacio imagen* de una matriz $A in RR^(m times n)$ es el conjunto de todos los vectores $b in RR^m$ que se pueden escribir como $b = A x$ para algún $x in RR^n$.

$
  I m(A) = { b in RR^m " tal que " b = A x " para algún " x in RR^n }
$

Los vectores $b in I m(A)$ son *combinaciones lineales de las columnas de $A$*.

#pagebreak()
=== Espacio nulo
El *espacio nulo* de una matriz $A in RR^(m times n)$ es el conjunto de todos los vectores $x in RR^n$  tales que $A x = 0$

$
  N u(A) = { x in RR^n " tal que " A x = 0 }
$

#propiedad[
  $ N(A) != {0} <=> "las columnas de A son linealmente dependientes" $
]

=== Matriz inversa
Sea $A in RR^(n times n)$, entonces $A$ es *inversible* si existe una matriz $A^(-1) in RR^(n times n)$ tal que $ A A^(-1) = A^(-1) A = I $.

#propiedad[
 $ 
 A " es inversible " <=> rang(A) = n <=> det(A) != 0
 $ 
]

Cuando $A$ es inversible, decimos que $A$ es una *matriz no singular*  

#propiedad[
  La *inversa de un matriz diagonal* (si existe), es una *matriz diagonal*. 
]

#propiedad[
  La inversa de un *matriz triangular superior* (si existe), es una *matriz triangular superior*. 
  
  Analogamente, la inversa de un* matriz triangular inferior* (si existe), es una* matriz triangular inferior*. 
]

=== Matriz traspuesta 
La *matriz traspuesta* de una matriz $A in RR^(m times n)$ es la matriz $A^T in RR^(n times m)$ tal que $ A^T_(i j) = A_(j i) $.

#propiedad[
  $ (A^T)^T = A $
  $ (A + B)^T = A^T + B^T $
  $ (A B)^T = B^T A^T $
  $ (A^(-1))^T = (A^T)^(-1) $
]

=== Submatriz principal
Una *submatriz principal* de una matriz $A in RR^(m times n)$ de orden $k$ es una matriz $A^(\(k\))$ que se obtiene de $A$ al eliminar las ultimas $m - k$ filas y las ultimas $n - k$ columnas. Por ejemplo, si

$ A = mat(
    a_(11), a_(12), a_(13), a_(14);
    a_(21), a_(22), a_(23), a_(24);   
    a_(31), a_(32), a_(33), a_(34);
    a_(41), a_(42), a_(43), a_(44);
  ) $

entonces:

$ A^(\(2)) = mat(
    a_(11), a_(12);
    a_(21), a_(22);
  ) #h(1em) A^(\(3\)) = mat(
    a_(11), a_(12), a_(13);
    a_(21), a_(22), a_(23);
    a_(31), a_(32), a_(33);
  ) #h(1em) A^(\(4\)) = mat(
    a_(11), a_(12), a_(13), a_(14);
    a_(21), a_(22), a_(23), a_(24);   
    a_(31), a_(32), a_(33), a_(34);
    a_(41), a_(42), a_(43), a_(44);
  )   
$

#pagebreak()
=== Matrices especiales
==== Matriz Identidad
La *matriz identidad* $I in RR^(n times n)$ es la matriz cuadrada que tiene $1$ en la diagonal y $0$ en el resto de las posiciones:

$
  I = mat(
    1, 0, ..., 0;
    0, 1, ..., 0;   
    dots.v, dots.v, dots.down, dots.v;
    0, 0, ..., 1;
  )
$

==== Matriz diagonal
Una *matriz diagonal* $D in RR^(n times n)$ es una matriz cuadrada que tiene $0$ en todas las posiciones excepto en la diagonal:

$
  D = mat(
    d_(11), 0, ..., 0;
    0, d_(22), ..., 0;   
    dots.v, dots.v, dots.down, dots.v;
    0, 0, ..., d_(n n);
  ) 
$

==== Matriz triangular superior
Una *matriz triangular superior* $U in RR^(n times n)$ es una matriz cuadrada que tiene $0$ en todas las posiciones por debajo de la diagonal:

$
  U = mat(
    u_(11), u_(12), ..., u_(1n);
    0, u_(22), ..., u_(2n);   
    dots.v, dots.v, dots.down, dots.v;
    0, 0, ..., u_(n n);
  )
$

==== Matriz triangular inferior
Una *matriz triangular inferior* $L in RR^(n times n)$ es una matriz cuadrada que tiene $0$ en todas las posiciones por encima de la diagonal: 

$
  L = mat(
    l_(11), 0, ..., 0;
    l_(21), l_(22), ..., 0;   
    dots.v, dots.v, dots.down, dots.v;
    l_(n 1), l_(n 2), ..., l_(n n);
  )
$

#pagebreak()
#propiedad[
  El *producto de dos matrices triangulares superiores* es una matriz *triangular superior*. 
  
  Analogamente, el *producto de dos matrices triangulares inferiores* es una *matriz triangular inferior*.
]

==== Matriz estrictamente diagonal dominante
Una matriz $A in RR^(n times n)$ es *estrictamente diagonal dominante* si para todo $i in {1, 2, ..., n}$ se cumple que $ |a_(i i)| > sum_(j = 1\ j != i)^(n) |a_(i j)| $

==== Matriz de permutación
Una *matriz de permutación* $P in RR^(n times n)$ es una matriz que se obtiene de la matriz identidad $I in RR^(n times n)$ al *intercambiar dos o más filas (o columnas)* de $I$.

Al multiplicar una matriz $A in RR^(m times n)$ por una matriz de permutación $P in RR^(n times n)$, se obtiene:
$ P = mat(
  0,1,0,0;
  0,0,0,1;
  0,0,1,0;
  1,0,0,0;
) #h(1em) P A = mat(
  dash.em, fila_blue(2)(A), dash.em;
  dash.em, fila_blue(4)(A), dash.em;
  dash.em, fila_blue(3)(A), dash.em;
  dash.em, fila_blue(1)(A), dash.em;
) $ 
$ A P = mat(
  bar.v, bar.v, bar.v, bar.v;
  col_blue(4)(A), col_blue(2)(A), col_blue(3)(A), col_blue(1)(A);
  bar.v, bar.v, bar.v, bar.v;
) $

==== Matriz elemental (tipo 1)
Una *matriz elemental (tipo 1)* es la matriz identidad con una *fila multiplicada por un escalar no nulo*:

$ E = mat(
    1, 0, 0, 0;
    0, blue(alpha), 0, 0;
    0, 0, 1, 0;
    0, 0, 0, 1;
  ) #h(1em) E A = mat(
    dash.em, fila_1(A), dash.em;
    dash.em, blue(alpha) fila_2(A), dash.em;
    dash.em, fila_3(A), dash.em;
    dash.em, fila_4(A), dash.em;
  ) \ A E = mat(
    bar.v, bar.v, bar.v, bar.v;
    blue(alpha) col_2(A), col_1(A), col_3(A), col_4(A);
    bar.v, bar.v, bar.v, bar.v;
  )
$

==== Matriz elemental (tipo 2)
Una *matriz elemental (tipo 2)* es la matriz identidad con *un elemento no nulo fuera de la diagonal*:

$ E = mat(
    1, 0, 0, 0;
    0, 1, 0, 0;
    blue(alpha), 0, 1, 0;
    0, 0, 0, 1;
) #h(1em) E A = mat(
    dash.em, fila_1(A), dash.em;
    dash.em, fila_2(A), dash.em;
    dash.em, blue(fila_3(A) + alpha " " fila_1(A)), dash.em;
    dash.em, fila_4(A), dash.em; ) 
$
$ A E = mat(
    bar.v, bar.v, bar.v, bar.v;
    blue(col_1(A) + alpha col_3(A)), col_2(A), col_3(A), col_4(A);
    bar.v, bar.v, bar.v, bar.v;
    )
$