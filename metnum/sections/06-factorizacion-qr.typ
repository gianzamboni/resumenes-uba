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

=== Métodos
Sea *$A in RR^(n times n)$, $Q in RR^(n times n)$ ortogonal y $R in RR^(n times n)$ triangular superior tal que $A = Q R$*

Entonces podemos resolver el sistema de ecuaciones $A x = b$ de la siguiente manera:

$ 
A x = b => Q R x = b => Q^t Q R x = Q^t b => R x = Q^t b $

Entonces *podemos resolver el sistema $R x = Q^t b$ en $cal(O)(n^2)$ operaciones*.

Veamos como obtener $Q$ y $R$ usando dos métodos distintos: *Método de Givens* y *Método de Householder*.

== Método de Givens
=== Rotaciones de Givens
Dado un angulo $theta$ definimos la transformación lineal *$W: RR^2 -> RR^2 $ que rota al vector $theta$ grados en el sentido horario*: 

$
W = mat(
  cos(theta), sin(theta);
  -sin(theta), cos(theta);
)
$   

Entonces *$W$ es ortogonal* y $||W x||_2 = ||x||_2$ para todo $x in RR^2$.

Sean $tilde(x), tilde(y) in RR^2$ tal que 

$
tilde(y) = mat( ||tilde(x)||_2; 0 )
$

Queremos encontrar $W$ tal que $W tilde(x) = tilde(y)$. Proponemos:

#align(center + horizon)[
  #stack(dir: ltr, spacing: 2em)[
    #image("../assets/givens-rotations.png", width: 25%)
  ][
    $
W = mat(
  (tilde(x)_1) / (||tilde(x)||_2), tilde(x)_2 / (||tilde(x)||_2);
  -tilde(x)_2 / (||tilde(x)||_2), (tilde(x)_1) / (||tilde(x)||_2);
)
$
  ]
]

=== Factorización QR en el plano ($2 times 2$)
Si $A in RR^(2 times 2)$ y tomamos $ tilde(x) = col_1(A) mat(a_(1 1); a_(2 1))  #h(2em) tilde(y) = mat(||tilde(x)||_2; 0) $ entonces podemos armar $W in RR^(2 times 2)$ tal que $W tilde(x) = tilde(y)$. Además:

$
W A = mat(
  ||tilde(x)||_2, \*;
  0, \*;
) = R => W A = R => W^t W A = W^t R => A = W^t R
$

Si renombramos $W^t = Q$ entonces $A = Q R$.

=== Factorización en $RR^(n times n)$
Tenemos que ver como adapatar este proceso a más dimensiones. Sean $A in RR^(n times n)$, nuestro primer objetivo es anular el elemento $a_(2 1)$. Sabemos que si tomamos un vector $ tilde(x) = mat(a_(1 1); a_(2 1))  $ entonces existe $W in RR^(2 times 2)$ tal que $ W tilde(x) = mat(||tilde(x)||_2; 0) $.


Vamos a inventar una matriz $W_(1 2) in RR^(n times n)$ que realize esta misma operación sobre $A$. Definimos entonces $W_(1 2) in RR^(n times n)$ como:

$
W_(1 2) = mat(
  #blue[$w_11$], #blue[$w_12$], 0, dots, 0;
  #blue[$w_21$], #blue[$w_22$], 0, dots, 0;
  0, 0, 1, dots, 0;
  dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, 0, dots, 1;
) => W_(1 2) A = mat(
  \*, \*, dots, \*;
  #blue[$0$],  \*, dots, \*;
  a_(3 1), a_(3 2), dots, a_(3 n);
  dots.v, dots.v, dots, dots.v;
  a_(n 1), a_(n 2), dots, a_(n n);
) = A^1
$ 

Ahora queremos anular el elemento $a_(3 1)$, para eso vamos a usar una matriz $W_(2 3) in RR^(n times n)$ que realize esta misma operación sobre $A^1$. Nuestro nuevo es $
tilde(x) = mat(a_(1 1); a_(3 1))
$ y nuestro nuevo $W in RR^(2 times 2)$ tal que $ W tilde(x) = mat(||tilde(x)||_2; 0) $.

Definimos entonces $W_(1 3) in RR^(n times n)$ como:

$
W_(2 3) = mat(
  #blue[$w_11$], 0, #blue[$w_12$], dots, 0;
  0, 1, , dots, 0;
  #blue[$w_21$], 0, #blue[$w_22$], dots, 0;
  0, 0, 0, dots, 1;
  dots.v, dots.v, dots.v, dots.v, dots.v;
  0, 0, 0, dots, 0;
) => W_(2 3) A^1 = mat(
  \*, \*, dots, \*;
  #blue[$0$], \*, dots, \*;
  #blue[$0$],  \*, dots, \*;
  a_(4 1), a_(4 2), dots, a_(4 n);
  dots.v, dots.v, dots, dots.v;
  a_(n 1), a_(n 2), dots, a_(n n);
) = A^2
$

Podemos repetir este proceso, por cada elemento que queremos anular: Supongamos que queremos anular el elemento $a_(i j)$, entonces elegimos $ tilde(x) = mat(a_(i i); a_(i j)) $ y $W in RR^(2 times 2)$ tal que $ W tilde(x) = mat(||tilde(x)||_2; 0) $ y definimos $W_(i j) in RR^(n times n)$ como:

$
W_(i j) = mat(
  1, dots, 0, dots, 0, dots, 0;
  dots.v, dots.down, dots.v, dots, dots.v, dots, dots.v;
  0, dots, #blue[$w_(i i)$], dots, #blue[$w_(i j)$], dots, 0;
  dots.v, dots.down, dots.v, dots.down, dots.v, dots, dots.v;
  0, dots, #blue[$w_(j i)$], dots, #blue[$w_(j j)$], dots, 0;
  dots.v, dots.down, dots.v, dots.down, dots.v, dots.down, dots.v;
  0, dots, 0, dots, 0, dots, 1;
) 
$

En las coordenadas resaltadas, ubicamos los elementos de $W$.

Tras realizar este proceso $n - 1$ veces, obtenemos una matriz $R in RR^(n times n)$ triangular superior:

$
W_(n-1 n) W_(n-2 n) W_(n-2 n-1) dots W_(1 n) dots W_(1 2) A = R
$

Ademas como cada $W_(i j)$ es ortogonal, entonces es inversible y podemos armar una matriz $Q in RR^(n times n)$ tal que:

$
Q = W_(1 2)^t dots W_(1 n)^t dots W_(n-2 n-1)^t W_(n-2 n)^t W_(n-1 n)^t
$

Luego:

$
A = Q R
$
#propiedad[
 Ejecutar el método de Givens sobre una matriz $A in RR^(n times n)$ cuesta *$cal(O)(4/3 n^3)$ operaciones*
]

== Método de Householder
=== Reflexiones de Householder
Dado tres vectores $u$, $v in RR^2$ ortogonales entre si y $tilde(x) in RR^2$.Buscamos la transformación lineal *$H: RR^n -> RR^n $ que refleja al vector $x$ respecto del plano definido por $u$ y $v$*:
#align(center + horizon)[
  #stack(dir: ltr, spacing: 2em)[
    #image("../assets/householder-reflexion.png", width: 25%)
  ][
    #block(width: 70%)[
      #set align(left)
      Esta matriz debe cumplir las siguientes condiciones:
    + $H u = -u$
    + $H v = v$
    + $H tilde(x) = tilde(y)$

    Como $u$ y $v$ son ortogonales, forman una base de $RR^2$, entonces podemos escribir $tilde(x)$ como combinación lineal de $u$ y $v$:
    ]
  ]
]
$
tilde(x) = alpha v + beta u
$

Además, la reflexion de $tilde(x)$ respecto del plano definido por $u$ y $v$ se puede escribir como $tilde(y) = alpha v - beta u$.

Entonces, si remplazamos  $tilde(y)$ en la ecuación $H tilde(x) = tilde(y)$ obtenemos que:

$
H tilde(x) &= tilde(y)  \
&= alpha v - beta u  \
&= alpha v #blue[$+ beta u - beta u$] - beta u " (agregamos un termino que es cero)"\
& = alpha v + beta u - 2 beta u \
& = tilde(x) - 2 beta u \
& = I tilde(x) - #blue[$W tilde(x) " con " W tilde(x) = 2 beta u$] \
& = (I - W) tilde(x)
$

Entonces *$H = I - W$*. Ahora tenemos que encontrar $W$. Como $tilde(x) = alpha v + beta u$ entonces:

$
W tilde(x) &= W (alpha v + beta u)  = alpha W v + beta W u = 2 beta u \ 
&=> alpha = 0 " y " #blue[$W u = 2u$] 
$

Por ahora, asumamos por simplicidad que $||u||_2 = 1$. Sea 
$
#blue[$P = u u^t$] = mat(
  u_1^2, u_1 u_2;
  u_1 u_2, u_2^2;
)
$

Entonce *$P$ es simétrica* y cumple las siguientes propiedades:

- $PP^t = P$

- $P P^t = P$

- $P u = u$

- $P v = 0$

Entonces, si tomamos $W = 2 P$ entonces $W u = 2 P u = 2u$.

Finalmente, *$H = I - 2 P$*.

#propiedad[
 $H$ es simétrica y ortogonal
]

#propiedad[
  Sean $tilde(x), tilde(y) in RR^n$ tal que $||x||_2 = ||y||_2$ entonces existe una reflexión $H$ tal que $H tilde(x) = tilde(y)$:

  $
   H = I - 2 ((tilde(x) - tilde(y))(tilde(x) - tilde(y))^t) / (||tilde(x) - tilde(y)||_2^2) 
  $
]

=== Factorización en el plano ($2 times 2$)
Sea $A in RR^(1 times 2)$ buscamos una reflexión $H$ tal que $H A$ resulte en una matriz triangular. Tomemos 
$ 
tilde(x) = col_1(A) = mat( a_11; a_21 ) #h(2em) tilde(y) = mat( ||tilde(x)||_2; 0 )
$

Entonces, por la propiedad anterior, existe una reflexión $H$ tal que $H tilde(x) = tilde(y)$. Entonces:
$
H A = mat(
  ||tilde(x)||_2, \*;
  0, \*;
) = R => H A = R => H^t H A = H^t R => A = H^t R
$

Como $H^t$ es ortogonal, podemos renombrar $H^t = Q$ y entonces $A = Q R$.

#pagebreak()
=== Factorización en $RR^(n times n)$
Se puede extender el mismo concepto a múltiples dimensiones. En este caso, nuestro primer objetivo es anular todos los elementos de la primer fila por debajo de la diagonal. Para eso, tomamos 
$
tilde(x) = col_1(A) = mat( a_11; a_21; dots; a_(n 1) ) #h(2em) tilde(y) = mat( ||tilde(x)||_2; 0; dots.v; 0 )
$ y buscamos una reflexión $H_1$ tal que $H_1 tilde(x) = tilde(y)$. 

Por la misma propiedad anterior, existe una reflexión $H_1$ tal que $H_1 tilde(x) = tilde(y)$. Entonces:

$
H_1 A = mat(
  ||tilde(x)||_2, \*, dots, \*;
  0, \*, dots, \*;
  dots.v, dots.v, dots, dots.v;
  0, \*, dots, \*;
) = A^1
$

En los siguientes paso, buscamos $H_2$ tal que $H_2 A^1$ anule todos los elementos de la segunda fila por debajo de la diagonal.

En cada paso, buscamos la reflexión $H_i$ que permite anular las entradas de la fila $i$ por debajo de la diagonal.

Al final del proceso, obtenemos una secuencia de productos matriciales que nos permiten obtener una matriz $R in RR^(n times n)$ triangular superior:
$
H_n H_(n-1) dots H_1 A = R
$

Además, como cada $H_i$ es ortogonal, entonces es inversible y podemos armar una matriz $Q in RR^(n times n)$ tal que:
$
Q = H_1^t H_2^t dots H_(n-1)^t
$


== Propiedades
#propiedad[
 Ejecutar el método de Householder sobre una matriz $A in RR^(n times n)$ cuesta *$cal(O)(2/3 n^3)$ operaciones*
]

#propiedad[
  Sea $A in RR^(n times n)$, $A$ no singular. Existen únicas $Q in RR^(n times n)$ ortogonal y $R in RR^(n times n)$ triangular superior tal que $A = Q R$
]
