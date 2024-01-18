#import "../theme.typ": *

= Factorización QR
== Marices Ortogonales
Sea $Q in RR^(n times n)$, $Q$ es *ortogonales* si y solo si $Q Q^T = Q^T Q = I$

#propiedad[
  Sea $Q in RR^(n times n)$ ortogonal, entonces $||col_i (Q)||_2 = 1$ para todo $i = 1 dots n$
]

#propiedad[
  Sea $Q in RR^(n times n)$ ortogonal, entonces $||fila_i (Q)||_2 = 1$ para todo $i = 1 dots n$
]

#propiedad[
  Sea $Q in RR^(n times n)$ ortogonal, entonces $||Q||_2 = 1$
]

#propiedad[
  Sea $Q in RR^(n times n)$ ortogonal, entonces $kappa(Q) = 1$
]

#propiedad[
  Sea $Q in RR^(n times n)$ ortogonal y $x in RR^n$ entonces $||Q x||_2 = ||x||_2$ 
]

#propiedad[
  Sea $Q, R in RR^(n times n)$ ortogonales entonces $Q R$ es ortogonal
]

== Factorización QR
Sea *$A in RR^(n times n)$, $Q in RR^(n times n)$ ortogonal y $R in RR^(n times n)$ triangular superior tal que $A = Q R$*

Entonces podemos resolver el sistema de ecuaciones $A x = b$ de la siguiente manera:

$ 
A x = b => Q R x = b => Q^t Q R x = Q^t b => R x = Q^t b $

Entonces *podemos resolver el sistema $R x = Q^t b$ en $cal(O)(n^2)$ operaciones*.

Veamos como obtener $Q$ y $R$.

== Método de Givens
=== Rotaciones de Givens
Dado un angulo $theta$ definimos la transformación lineal $W: RR^2 -> RR^2 $ que rota al vector $theta$ grados en el sentido horario: 
$
W = mat(
  cos(theta), sin(theta);
  -sin(theta), cos(theta);
)
$

Entonces $W$ es ortogonal y $||W x||_2 = ||x||_2$ para todo $x in RR^2$.

Sean $tilde(x), tilde(y) in RR^2$ tal que 

$
tilde(y) = mat( ||tilde(x)||_2; 0 )
$

Queremos encontrar $W$ tal que $W tilde(x) = tilde(y)$. Proponemos:

$
W = mat(
  (tilde(x)_1) / (||tilde(x)||_2), tilde(x)_2 / (||tilde(x)||_2);
  -tilde(x)_2 / (||tilde(x)||_2), (tilde(x)_1) / (||tilde(x)||_2);
)
$

=== Factorización QR
==== En el plano (para $2 times 2$)
Sean 
$
A in RR^(2 times 2) #h(2em) tilde(x) = mat(a_(1 1); a_(2 1)) #h(2em) tilde(y) = mat(||tilde(x)||_2; 0) 
$
entonces existe $W in RR^(2 times 2)$ tal que $W tilde(x) = tilde(y)$. Además:

$
W A = mat(
  ||tilde(x)||_2, \*;
  0, \*;
) = R => W A = R => W^t W A = W^t R => A = W^t R
$

Si renombramos $W^t = Q$ entonces $A = Q R$.

==== En $RR^n$
Sean
$
A in RR^(n times n) #h(2em) tilde(x) = mat(a_(1 1); a_(2 1)) #h(2em) tilde(y) = mat(||tilde(x)||_2; 0)
$

Entonces existe $W in RR^(2 times 2)$ tal que $W tilde(x) = tilde(y)$. Podemos definir $W_(1 2) in RR^(n times n)$ como:
$
W_(1 2) = mat(
  w_11, w_12, 0, dots, 0;
  w_21, w_22, 0, dots, 0;
  0, 0, 1, dots, 0;
  dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, 0, dots, 1;
)
$ 

Cuando multiplicamos por $A$:
$
W_(1 2) A = mat(
  \*, \*, dots, \*;
  #blue[$0$],  \*, dots, \*;
  a_(3 1), a_(3 2), dots, a_(3 n);
  dots.v, dots.v, dots, dots.v;
  a_(n 1), a_(n 2), dots, a_(n n);
) 
$




