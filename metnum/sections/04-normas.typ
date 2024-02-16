#import "../theme.typ": *

= Normas vectoriales y matriciales
== Normas vectoriales
Una *norma vectorial* es una función $f: RR^n -> RR$ que cumple las siguientes propiedades:

- $f(x) > 0$ para todo $x != 0 in RR^n$
- $f(x) = 0 <=> x = 0$
- $f(alpha x) = |alpha| f(x)$ para todo $alpha in RR$ y $x in RR^n$
- $f(x + y) <= f(x) + f(y)$ para todo $x, y in RR^n$

===== Norma 1 (norma Manhattan) 
$ ||x||_1 = sum_(i=1)^n |x_i| $

===== Norma 2 (norma Euclídea) 

$ ||x||_2 = sqrt(sum_(i=1)^n x_i^2) $

===== Norma $p$

$ ||x||_p = (sum_(i=1)^n |x_i|^p)^(1/p) $

===== Norma infinito

$ ||x||_inf = max_{1 <= i <= n} |x_i| $

== Normas matriciales
Una *norma matricial* es una función $f: RR^(m times n) -> RR$ que cumple las siguientes propiedades:

- $f(A) > 0$ para todo $A != 0 in RR^(m times n)$
- $f(A) = 0 <=> A = 0$
- $f(alpha A) = |alpha| f(A)$ para todo $alpha in RR$ y $A in RR^(m times n)$
- $f(A + B) <= f(A) + f(B)$ para todo $A, B in RR^(m times n)$

Adicionalmente, si $f$ cumple que $f(A B) <= f(A) f(B)$ para todo $A in RR^(m times n)$ y $B in RR^(n times p)$ entonces diremos que $f$ es una *norma submultiplicativa*.

===== Norma de Frobenius
$ ||A||_F = sqrt(sum_(i=1)^m sum_(j=1)^n a_(i j)^2) $


==== Normas matficiales inducidas
Sean $f_1$ una norma vctiral definida en $RR^m$ y $f_2$ una norma vectorial definida en $RR^n$, entonces la función $F: RR^(m times n)$ es una *norma inducida* si:
$
  F(A) = max_(x != 0) (f_1\(A x\)) / (f_2\(x\)) = max_(x: f_2\(x\) = 1) f_1(A x)
$

==== Número de condición
Cuando representamos una matriz $A in RR^(n times n)$ en una computadora, usamos aritmética de punto flotante finita. Esto quiere decir que los coeficientes que usamos y los cálculos que hacemos no son exactos. El *número de condición* de una matriz nos da una idea de cuánto puede variar la solución de un sistema de ecuaciones lineales si se dan errores de redondeo: 

$ kappa\(A\) = ||A|| ||A^(-1)|| $

Mientras más chico sea este número, mejor condicionada estará la matriz para que la podamos usar en un algoritmo que resuelve sistemas de ecuaciones. 

#propiedad[
  Si $||.||$ es una norma matricial inducida, entonces $kappa\(I\) = 1$.
]

#propiedad[
  Si $||.||$ es una norma submultiplicativa, entonces $kappa\(A\) >= 1$ 
]

#pagebreak()
=== Cota del error
Si $A in RR^(n times n)$ matriz no singular y $||.||$ una norma matricial inducida. Sea $tilde(x)$ una solución aproximada de $A x = b$ con $b != 0$ y sea $A tilde(x) = tilde(b)$ entonces:

$
  ( || x - tilde(x) || ) / ( || x || ) <= || A^-1 || (|| b - tilde(b) ||) / (|| b ||)
$
