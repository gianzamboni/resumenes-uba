#import "../theme.typ": *

= Factorización SVD
== Autovalores
Sea $A in CC^(n times n)$, $lambda in CC$ es *autovalor de $A$* si y solo si existe $v in CC^n$ tal que $v != 0$ y 
$
A v = lambda v
$

Si $lambda$ es autovalor de $A$, entonces $v$ es *autovector asociado a $lambda$*.

Vamos a llamar *radio espectral* de $A$ al número 
$
rho(A) = max{|lambda| : lambda " es autovalor de " A }
$

#propiedad[
  *$A - lambda I$ es una matriz singular* (no inversible)
]

Vamos a definir el *polinomio característico* de $A$ como:
$
P(lambda) = det(A - lambda I)
$

#propiedad[
  *$lambda$ es autovalor* de $A$ si y solo si es *raiz de $P(lambda)$* (si $P(lambda) = 0$)
]

#propiedad[
 *$A$ tiene $n$ autovalores*, algunos pueden tener multiplicidad mayor a $1$ (pueden estar repetidos)
]

#propiedad[
  Si $v$ es autovector entonces $alpha v$ también es autovector
]

#pagebreak()
#propiedad[
  Si $lambda$ es autovalor de $A => lambda - alpha$ es autovalor de $A - alpha I$.
]

#propiedad[
  Si $lambda$ es autovalor de $A$ y $v$ autovector de asociado, entonces $\(lambda\)^(\(k\))$ es autovalor de $A^(\(k\))$ y $v$ es autovector asociado.
]

#propiedad[
  Sea $Q in RR^(n times n)$ una matriz ortogonal, entonces sus autovalores reales son $1$ o $-1$
]

#propiedad[
  Si $lambda^1, lambda^2, ..., lambda^n$ son los autovalores distintos con autovalores asociados $v^1, v^2, ..., v^n$ son linealmente independientes.
]

#propiedad[
  $A$ y $A^t$ tienen los mismos valores
]

=== Disco de Gershgorin
Sea $A in CC^(n times n)$ y 
$
r_i = sum_(k = 1\ k != i)^n |a_{i k}|
$ 

definimos el disco de Gershgorin
$
  D_i = { x in CC : |x - a_(i i)| <= r_i }
$

#propiedad[
 Sea $lambda$ autovalor de $A$ entonces $lambda in D_i$ para algún $i = 1, 2, ..., n$
]

#propiedad[
  Si $M = D_(i_1) union D_(i_2) union ... union D_(i_k)$ es disjunto con la unión de los restantes discos $D_i$ entonces hay exactamente $m$ autovalores de $A$ (contados con su multiplicidad) en $M$.
]

=== Matriz semejantes
Sean $A, B, C in CC^(n times n)$ son *matrices semejantes* si existe $P in CC^(n times n)$ matriz inversible, tal que:
$
A = P^(-1) B P
$

#propiedad[
  Si $A$ y $B$ son semejantes entonces tienen los mismos autovalores
]

Dada $A in CC^(n times n)$, $A$ es *diagonizable por semejanza* si es semejante a una matriz diagonal.

#propiedad[
  $A$ es diagonizable por semejanza si y solo si sus autovectores forman una base.
] 

#pagebreak()
=== Propiedades de autovalores
Sea $A in RR^(n times n)$:

#propiedad[
  Si $A$ es *simétrica*, sus *autovolores son reales*.
]

#propiedad[
  Si $A$ tiene un *autovalor real* entonces existe un *autovector asociado con coeficientes reales*.
]

#propiedad[
  Si $A$ es *simétrica* y *$lambda^1$ y $lambda^2$ autovalores distintos* con $v^1$ y $v^2$ autovectores asociados. Entonces *$v^1$ y $v^2$ son ortogonales*.
]

#propiedad[
  Sea *$Q in RR^(n times n)$ ortogonal, $lambda$ es autovalor de $A$* si y solo si *$lambda$ es autovalor de $Q A Q^t$*.
]

#propiedad[
  Si *$A$ tiene todos tus autovalores reales*, *existe $Q in RR^(n times n)$ ortogonal* tal que $
  Q^t A Q = T
  $ con *$T in RR^(n times n)$ triangular superior*.
]