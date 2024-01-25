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
  Si $v$ es autovector entonces *$alpha v$ también es autovector*.
]

#pagebreak()
#propiedad[
  Si $lambda$ es autovalor de $A => $ *$lambda - alpha$ es autovalor de $A - alpha I$*.

  #demoLine()
$
  (A - alpha I)v = A v - alpha v = lambda v - alpha v = (lambda - alpha) v 
$
]

#propiedad[
  Si $lambda$ es autovalor de $A$ y $v$ autovector de asociado, entonces *$\(lambda\)^(\(k\))$ es autovalor de $A^(\(k\))$ y $v$ es autovector asociado*.

  #demoLine()
  Vamos a demostrar por inducción en $k$:
  - *Caso base ($k = 1$):* $A v = lambda v => A^1 v = lambda_1 v$ por definición de autovector.
  - *Paso inductivo:* Supongamos que vale para $k$, entonces $A^k v = lambda^k v$. Queremos ver que $A^(k + 1) v = lambda^(k + 1) v$.

    $
      A^(k + 1) v = A^k (A v) = A^k (lambda v) = lambda A^k v
    $
  
    Por hipótesis inductiva $A^k v = lambda^k v$ entonces 
    $
      lambda A^k v = lambda lambda^k v = lambda^(k + 1) v #h(1em) qed
    $ 
]

#propiedad[
  Sea *$Q in RR^(n times n)$ una matriz ortogonal*, entonces *sus autovalores reales son $1$ o $-1$*

  #demoLine()
  Por ser $Q$ ortogonal, sabeemos que $||A v||_2 = ||v||_2$. Supongamos que $v$ es autovector asociado a $lambda$ entonces $A v = lambda v$ y $||A v||_2 = ||lambda v||_2 = |lambda| ||v||_2$. Entonces $|lambda| = 1 #h(1em) qed$ 
]

#propiedad[
  Si *$lambda_1, lambda_2, ..., lambda^n$ son los autovalores distintos* con autovalores asociados *$v^1, v^2, ..., v^n$ son linealmente independientes*.

  #demoLine()
  Vamos a demostrar por inducción en $k$:
  - *Caso base ($k = 1$):* es válido ya que $v_1$ no es el vector nulo.

  - *Paso inductivo:* Supongamos que vale para $k$, entonces $v^1, v^2, ..., v^k$ son linealmente independientes. Queremos ver que $v^1, v^2, ..., v^(k + 1)$ tambien lo son.

  Supongamos que no, entonces $v^(k+1)$ se puede escribir como combinación lineal de $v^1, v^2, ..., v^k$:
  $
    v^(k + 1) = sum_(i = 1)^k c_i v^i
  $

  Los coeficientes $c_i$ no son todos nulos ya que $v^(k + 1) != 0$ por definición de autovector.
  
  Multiplicando por $A$ a ambos lados de la igualdad queda:
  $
 A v^(k + 1) = lambda^(k + 1) v^(k + 1) 
 $

 y

 $`
  A sum_(i = 1)^k c_i v^i = sum_(i = 1)^k c_i A v^i = sum_(i = 1)^k c_i lambda^i v^i
 $

 Osea que: $
  lambda^(k + 1) v^(k + 1) = sum_(i = 1)^k c_i lambda^i v^i
 $
  
  Por otro lado, si multiplicamos la igualdad original por $lambda^(k + 1)$ queda:
  $
    lambda^(k + 1) v^(k + 1) = lambda^(k + 1) sum_(i = 1)^k c_i v^i = sum_(i = 1)^k c_i lambda^(k + 1) v^i 
  $ 

  Entonces podemos combinar las igualdades y nos queda:
  $
    sum_(i = 1)^k c_i lambda^i v^i = sum_(i = 1)^k c_i lambda^(k + 1) v^i \ 
    => sum_(i = 1)^k c_i lambda^i v^i - sum_(i = 1)^k c_i lambda^(k + 1) v^i = 0 \
    => sum_(i = 1)^k c_i (lambda^i - lambda^(k + 1)) v^i = 0
$

Ahora, como $v^1, v^2, ..., v^k$ son linealmente independientes (por hipotesis induvtiva), la única manera de que esta combinación lineal resulte en el vector nulo es que $c_j(lambda^j - lambda^(k+1)) = 0$ para todo $j=1...k$.

Sabemos que existe algún $c_j != 0$, lo que implica que para ese $j$ tiene que valer que $lambda^j - lambda^(k+1) = 0 => lambda^j = lambda^(k+1)$, lo cual es una contradicción ya que por hipótesis $lambda_1, lambda_2, ..., lambda^n$ son distintos. $#h(1em) qed$
] 

#propiedad[
  $A$ y $A^t$ tienen los *mismos autovalores*

  #demoLine()
  Sabemos que los autovalores de $A$ son las raíces del polinomio característico $P(lambda) = det(A - lambda I)$. Además sabemos que _la determinante de una matriz y su traspuesta son iguales_, entonces $
  det(A - lambda I) = det((A - lambda I)^t) = det(A^t - lambda I)
  $

  Entonces el polinomio característico de $A$ y $A^t$ es el mismo y sus raíces también lo son.
]

#pagebreak()
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
 Sea $lambda$ autovalor de $A$ entonces *$lambda in D_i$ para algún $i = 1, 2, ..., n$*

 #demoLine()
 Sea $v$ el autovector asociado a $lambda$. Como $v != 0$ entonces
 $
 ||v||_oo = max_(1 <= i <= n) |v_i| != 0
 $

 Sea $k_0$ el índice de una coordenada de $v$ tal que $||v||_oo = abs(v_(k_0))$. Sabemos que $A v = lambda v$. En particular, considerando la fila $k_0$ de $A$, tenemos que:
$
  sum_(j = 1)^n a_(k_0 j) v_j = lambda v_(k_0)
$

Separando de la sumatoria el término $k_0$:
$
  a_(k_0 k_0) v_(k_0) + sum_(j = 1\ j != k_0)^n a_(k_0 j) v_j = lambda v_(k_0) \
  => sum_(j = 1\ j != k_0)^n a_(k_0 j) v_j = lambda v_(k_0) - a_(k_0 k_0) v_(k_0) = (lambda - a_(k_0 k_0)) v_(k_0)
$

Si tomamos módulo a ambos lados de la igualdad nos queda:
$
  |sum_(j = 1\ j != k_0)^n a_(k_0 j) v_j| = |lambda - a_(k_0 k_0)| |v_(k_0)| = |lambda - a_(k_0 k_0)| ||v||_oo \
  => sum_(j = 1\ j != k_0)^n |a_(k_0 j) v_j| >= |lambda - a_(k_0 k_0)| |v_(k_0)|
$

Como $|v_(k_0)| != 0$ podemos pasar dividiendo y nos queda:
$
  sum_(j = 1\ j != k_0)^n |a_(k_0 j)| (|v_j|) / (|v_(k_0)|) >= |lambda - a_(k_0 k_0)|
$

Como $||v||_oo = abs(v_(k_0))$ entonces $(|v_j|) / (|v_(k_0)|) <= 1$ y por lo tanto:
$
  sum_(j = 1\ j != k_0)^n |a_(k_0 j)| >= sum_(j = 1\ j != k_0)^n |a_(k_0 j)| (|v_j|) / (|v_(k_0)|) >= |lambda - a_(k_0 k_0)|
$

Luego $lambda$ cumple la condición para pertenecer a $D #h(1em) qed$
]

#propiedad[
  Si *$M = D_(i_1) union D_(i_2) union ... union D_(i_k)$ es disjunto con la unión de los restantes discos $D_i$ entonces hay exactamente $m$ autovalores de $A$* (contados con su multiplicidad) en $M$.
]

#pagebreak()
=== Matriz semejantes
Sean $A, B, C in CC^(n times n)$ son *matrices semejantes* si existe $P in CC^(n times n)$ matriz inversible, tal que:
$
A = P^(-1) B P
$

#propiedad[
  Si $A$ y $B$ son semejantes entonces *tienen los mismos autovalores*

  #demoLine()
  Sea $lambda$ autovalor de $A$ y $v$ autovector asociado. Queremos ver que $lambda$ es autovalor de $B$. Sabemos que 
  $
  A v = lambda v
  $

  Multiplicando a ambos lados por $P^(-1)$ nos queda:
  $
  P^(-1) A v = lambda P^(-1) v
  $

  Como $A$ y $B$ son semejantes:
  $
P^(-1)P B P^(-1) v = lambda P^(-1) v \ => B P^(-1) v = lambda P^(-1) v
  $

  Como $P$ es inversible y $v != 0$, entonces $P^(-1) v != 0$ y por lo tanto $lambda$ 
  Si nombramos $u = P^(-1) v$ entonces $B u = lambda u$ podemos concluir que $lambda$ es autovalor de $B$ y $u$ su autovector asociado $qed$
]

==== Diagonalización por semenjanza
Dada $A in CC^(n times n)$, $A$ es *diagonizable por semejanza* si es semejante a una matriz diagonal.

#propiedad[
  *$A$ es diagonizable por semejanza* si y solo si sus *autovectores forman una base*.

  #demoLine()
  *$=>)$* Si $A$ es diagonizable por semejanza, entonces existe $P$ matriz inversible tal que $A = P D P^(-1)$. Por la propiedad anterior, $D$ tiene los mismos autovalores que $A$. Además si $v$ es autovector de $D$, entonces $P v$ es autovector de $A$.
  
    Los autovectores de una matriz diagonal son los vectores canónicos $e_1, e_2, ..., e_n$. Entonces los autovectores de $A$ son $P e_1, P e_2, ..., P e_n$. 

    Ahora, $P e_i = col_i(P)$. Como $P$ es inversible, sus columnas son linealmente independiente, por lo tanto, $P e_1, P e_2, ..., P e_n$ son linealmente independientes y forman una base.

    Luego, los auvotes de $A$ forman una base.

  *$arrow.l.double)$* Si $A$ tiene base de autovectores, entonces existen $v_1, v_2, ..., v_n$ autovectores linealmente independientes tal que $A v_i = lambda_i v_i$ siendo $lambda_i$ el autovalor al que están asociados.

    Definamos $P in RR^(n times n)$ a la matriz cuyas columnas son los autovectores $v_1, v_2, ..., v_n$. Como $v_1, v_2, ..., v_n$ son linealmente independientes $=>$ $P$ es inversible.

    $
     A P &= A mat(v_1, v_2, ..., v_n) = mat(A v_1, A v_2, ..., A v_n)  \
         &= mat(lambda_1 v_1, lambda_2 v_2, ..., lambda_n v_n) \
         &= mat(v_1, v_2, ..., v_n) mat(lambda_1, 0, ..., 0; dots.v, dots.v,dots.down, dots.v; 0, 0, ..., lambda_n) \
          &= P D
    $

    Entonces logramos conseguir $D in RR^(n times n)$ diagonal tal que $A P = P D$ y como $P$ es inversible, si multiplicamos a derecha por su inversa en ambos lados nos queda:

    $ 
    A P P^(-1) = P D P^(-1) => A = P D P^(-1)
    $

    Luego $A$ es diagonizable por semejanza $qed$
]

#pagebreak()
=== Propiedades de autovalores<secc:propiedades-autovalores>
Sea $A in RR^(n times n)$:

#propiedad[
  Si $A$ es *simétrica*, sus *autovolores son reales*.

  #demoLine()
  Sea $lambda$ autovalor de $A$ y $v != 0$ su autovector asociado. Entonces $A v = lambda v$. _Conjugemos_ (Si $a = x + y i => macron(a) = x - y i$ )  ambos lados de la igualdad:

  $
    A v = lambda v => macron(A v) = macron(lambda v) => macron(A) macron(v) = macron(lambda) macron(v)
  $

  Como $A in RR^(n times n)$, $macron(A) = A$:
  $
    macron(A) macron(v) = macron(lambda) macron(v) => A macron(v) = macron(lambda) macron(v)
  $

  Multipliquemos por $v^t$ ambos lados de la igualdad:
  $
    v^t A macron(v) = v^t macron(lambda) macron(v) => v^t A macron(v) = macron(lambda) v^t macron(v)
    => (A^t v)^t macron(v) = macron(lambda) v^t macron(v)
  $

  Como $A$ es simétrica:
  $
    (A^t v)^t macron(v) = macron(lambda) v^t macron(v) => (A v)^t macron(v) = macron(lambda) v^t macron(v)
  $

  Como $v$ es autovector asociado a $lambda$:
  $
    (A v)^t macron(v) = macron(lambda) v^t macron(v) => lambda v^t macron(v) = macron(lambda) v^t macron(v)
  $

  Ahora como $v != 0$:
  $
  v^t macron(v) = v_1 * macron(v_1) + v_2 * macron(v_2) + ... + v_n * macron(v_n) = |v_1|^2 + |v_2|^2 + ... + |v_n|^2 > 0
  $

  Entonces: 
$
  lambda v^t macron(v) = macron(lambda) v^t macron(v) => lambda = macron(lambda) (v^t macron(v)) / (v^t macron(v)) => lambda = macron(lambda)
$

Luego $lambda$ es real $qed$
]

#pagebreak()
#propiedad[
  Si $A$ tiene un *autovalor real* entonces existe un *autovector asociado con coeficientes reales*.

  #demoLine()
  Sea $lambda$ autovalor real de $A$ y $v$ autovector asociado. Entonces $v$ es solución al sistema $(A - lambda I)v = 0$. Este sistema puede resolverse utilizando elminiación gaussiana. Como $A in RR^(n times n)$, todos los coeficientes que se usan en el proceso son reales, por lo tanto, la solución que se obtiene tendrá coeficientes reales $qed$
]

#propiedad[
  Si $A$ es *simétrica* y *$lambda_1$ y $lambda_2$ autovalores distintos* con $v_1$ y $v_2$ autovectores asociados. Entonces *$v_1$ y $v_2$ son ortogonales*.

  #demoLine()
  Sea $lambda_1$ y $lambda_2$ autovalores distintos de $A$ y $v_1$ y $v_2$ autovectores asociados. Entonces $A v_1 = lambda_1 v_1$ y $A v_2 = lambda_2 v_2$. 

  Multiplicando a ambos lados de la primera igualdad por $v_2$ y a ambos lados de la segunda igualdad por $v_1$ nos queda:

  $
    v_2^t A v_1 = v_2^t lambda_1 v_1 \
    v_1^t A v_2 = v_1^t lambda_2 v_2
  $

  Como $A$ es simétrica, $A^t = A$ y entonces:
  $
    v_2^t A v_1 = (A^t v_2)^t v_1 = (A v_2)^t v_1 = (v_1^t A v_2)^t = v_1^t A v_2
  $

  Entonces:
  $
    lambda_1 v_2^t v_1 = lambda_2 v_1^t v_2 \
  $

  Como por hipotesis $lambda_1 != lambda_2$ y además $v_2^t v_1 = v_1^t v_2$, entonces $v_1^t v_2 = 0$ y por lo tanto $v_1$ y $v_2$ son ortogonales $qed$
]

#pagebreak()
#propiedad[
  Sea *$Q in RR^(n times n)$ ortogonal, $lambda$ es autovalor de $A$* si y solo si *$lambda$ es autovalor de $Q A Q^t$*.
]

#propiedad(title: "Teorema de Schur (simplificado)")[
  Si *$A$ tiene todos tus autovalores reales*, *existe $Q in RR^(n times n)$ ortogonal* tal que $
  Q^t A Q = T
  $ con *$T in RR^(n times n)$ triangular superior*.

  #demoLine()
  Sea $lambda_1$ autovalor de $A$ y $v_1$ su autovector asociado, asumamos que $||v_1||_2 = 1$. 

  Sabemos que existe una transformación de Householder $H_1$ tal que $H_1 v_1 = e_1$ con $e_1$ el primer vector canónico. Como $H_1$ es una transformación de householder es simétirca y ortogonal, por lo tanto $H_1^t = H_1^(-1) = H_1$.  Entonces:
  
  $
    H_1 A H_1^t e_1 = H_1 A v_1 = H_1 lambda_1 v_1 = lambda_1 H_1 v_1 = lambda_1 e_1
  $


  Osea que $
    H_1 A H_1^t = mat(
      lambda_1, *, dots.c, *;
      0, ,tilde(A), ;
    )
  $
  Además $A$ es semejante a $H_1 A H_1^t$ pues:
  $
    A &= #blue[$H_1^(-1)H_1$] A #blue[$H_1^(-1)H_1$] \
      &= #blue[$H_1^t$] H_1 A #blue[$H_1^t$] H_1 " (porque " H_1 " es ortogonal")\
      &= H_1^t #blue[$\($]H_1 A H_1^t#blue[$\)$] H_1

  $

  Luego, como $A$ es semejante a $H_1 A H_1^t$, ambas matrices tienen los mismos autovalores.
  
  Como $col_1(H_1 A H_1^t) = lambda_1 e_1$, sabemos tambien que el resto de los autovalores están determinados por los autovalores de la matriz $tilde(A) in RR^((n - 1) times (n - 1))$ que se obtiene al eliminar la primera fila y la primera columna de $A$:

  Repitiendo el proceso para $tilde(A)$ obtenemos una reflexión de Householder $tilde(H)_2 in RR^((n - 1) times (n - 1))$ que tiene exactametne las mismas propiedades que $H_1$:
   - $tilde(H)_2tilde(A)tilde(H)_2^t = lambda_2 e_2$ con $e_2 in RR^(n-1)$
   - $tilde(A)$ y $tilde(H)_2tilde(A)tilde(H)_2^t$ son semejantes y tienen los mismos autovalores.

  Armemos entonces $H_2 in RR^(n times n)$ de la siguiente manera:
  $
    H_2 = mat(
      1, 0^t;
      0, tilde(H)_2;
    )
  $


  Queda entonces que:
  $
    H_2 H_1 A H_1^t H_2^t = mat(
      lambda_1, *, dots.c, *;
      0, lambda_2, dots.c, *;
      0, 0, dots.c, *; 
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots.c, *;
    )
  $

  Repitiendo este proceso $n-1$ llegaremos a una matriz $T$ triangular superior tal que 
  $
  H_(n-1) ... H_2 H_1 A H_1^t H_2^t ... H_(n-1)^t = T
  $

  Solo queda renombrar $Q = H_(n-1) ... H_2 H_1$ y listo $qed$
]
#propiedad[
  Si *$A$ es simétrica*, entonces *$T$ es diagonal*. *Los elementos* de la diagonal de $T$ *son los autovalores* y *las columnas de $Q$ son los autovectores*.

  #demoLine()
  Como $A$ es simétrica, todos sus autovalores son reales. Entonces, por el teorema de Schur, existe $Q in RR^(n times n)$ ortogonal y $T$ traiangular superior tal que 
  $
  A = Q T Q^t
  $ 
  Además
  $
  A^t = (Q T Q^t)^t = (T Q^t)^t Q^t = (Q^t)^t T^t Q^t = Q T^t Q^t   
  $ 

  Como $A$ es simétrica, $A^t = A$ y entonces:
  $
   Q T Q^t = Q T^t Q^t
  $

  Como $Q$ es ortogonal, $Q^t = Q^(-1)$:
  $
  Q T Q^t = Q T^t Q^t => #blue[$Q^t$]Q T Q^t #blue[$Q$] = #blue[$Q^t$]Q T^t Q^t #blue[$Q$] =>  T = T^t 
  $

  Luego $T^t$ es una matriz triangular superior y simétrica, por lo tanto es diagonal, es decir $A$ es diagonizable por semejanza $qed$
]

#corolario[
  Si *$A$ es simétrica*, entonces *tiene base (ortonormal) de autovectores*.

  #demoLine()
  Sabemos que $A$ es diagonizable por semejanza a $Q T Q^t$, esto implica que tiene base de autovecotores.  Por la propiedad anterior, tambien sabemos que las columnas de $Q$ son los autovectores de $A$. Como $Q$ es ortogonal, sus columnas son linealmente independientes y además $||col_i (Q)||_2 = 1$ para todo $i = 1, 2, ..., n$ concluimos que esa base es ortonormal $qed$
]

== Métodos para calcular autovalores
=== Método de la potencia
Sea *$A in RR^(n times n)$*, $lambda_1, lambda_2, ..., lambda^n$ sus $n$ autovalores con *autovectores asociados $v^1, v^2, ..., v^n$ que forman una base*.

Supongamos que *$abs(lambda_1) > abs(lambda_2) > ... >= abs(lambda^n)$*. Sea $q_0 in RR^n$ tal que $||q_0|| = 1$, definimos la sucesión ${q_k}$ donde cada uno de sus elementos se define como:

$
  q^k = (A q^(k - 1)) / (||A q^(k - 1)||_2)
$

Esta sucesión *converge al autovector $v^1$*. Además *$lambda_k = (q^k)^t A q^k$ converge a $lambda_1$*.

=== Método de la deflación
Sea *$A in RR^(n times n)$*, $lambda_1$ autovalor de $A$ con autovector asociado $v^1$ y $||v^1|| = 1$. 

Sea *$H in RR^(n times n)$ ortogonal* tal que *$H^t v^1 = e_1$*, entonces:

$
H^t A H = mat(
  lambda_1, a^t;
  0, B
)
$

Como $A$ y $H^t A H$ tienen los mismos autovalores, *los otros autovalores de $A$ son los autovalores de $B$*.

== Descomposición en valores singulares (SVD)

=== Método
Sea *$A in RR^(m times n)$*, $r = rang(A)$, existen matrices *$U in RR^(m times m)$*, *$V in RR^(n times n)$* ortogonales y *$Sigma in RR^(m times n)$ diagonal* tal que:

$
  A = U Sigma V^t
$

Además, $Sigma$ tiene la forma:
$
Sigma = mat(
  sigma_1, 0, ..., 0, 0, dots.c, 0;
  0, sigma_2, ..., 0, 0, dots.c, 0;
  dots.v, dots.v, dots.down, dots.v, dots.v, dots.down, dots.v;
  0, 0, ..., sigma_r, 0, dots.c, 0;
  0, 0, ..., 0, 0, dots.c, 0;
  dots.v, dots.v, dots.down, dots.v, dots.v, dots.down, dots.v;
  0, 0, ..., 0, 0, dots.c, 0;
)
$

con *$sigma_1 >= sigma_2 >= ... >= sigma_r > 0$*. Llamamos a los $sigma_i$ *valores singulares* de $A$.

Proponemos la siguientes condiciones para las matrices de esta descomposición:

- *$U$ tiene como columnas los autovectores de $A A^t$*
- *$V$ tiene como columnas los autovectores de $A^t A$*
- *$sigma_i = sqrt(lambda_i)$* donde $lambda_i$ es el $i-$ésimo  autovalor de $A^t A$ si los tomamos ordenados de mayor a menor: $lambda_1 >= lambda_2 >= ... >= lambda_r$.

=== Demostración
Sea *$u_1, u_2, ..., u_m$ a las columnas de $U$* y *$v_1, v_2, ..., v_n$ a las columnas de $V$*. Si la descomposición SVD existe, entonces $A = U Sigma V^t$ y $A^t = V Sigma^t U^t$. Entonces:
$ A V = U Sigma underbrace(V^t V,"ortogonales") = U Sigma => A v_i =  cases(sigma_i u_i "si" i <= r, 0 "sino"  ) $

$ A^t U = V Sigma^t underbrace(U^t U, "ortogonales") = V Sigma^t => A^t u_i =  cases(sigma_i v_i "si" i <= r, 0 "sino"  ) $

==== Columnas de $V$
Supongamos $i <= r$ multiplicamos la primera relación por $A^t$ obtenemos:
$
  A^t A v_i = sigma_i A^t u_i  = sigma_i^2 v_i
$

Entonces *$v_i$ es autovector de $A^t A$*, además *$sigma_i^2$ deben ser sus autovalores*.

*$A^t A$ es una matriz simétrica definida positiva* (ver @secc:SDP) y su rango es $r$. Por la condición de símetria sabemos que *existe una base ortonormal de autovectores* (ver @secc:propiedades-autovalores). Además por ser semidefinida positiva, *todos sus autovalores son reales y positivos*. 

Sabemos que $r$ de esos autovalores son no nulos y el $0$ es autovalor con multiplicidad $n-r$.  Sean $lambda_1, dots, lambda_r$ los autovalores no nulos de $A^t A$ y $v_1, dots, v_r$ los autovectores asociados y $v_(r+1), dots, v_n$ los autovectores asociados al $0$, entonces *$v_1, dots, v_r, v_(r+1), dots, v_n$ es una base ortonormal de autovectores de $A^t A$*.

Estos vectores son los candidatos a conformar las columnas de $V$ y definimos *$sigma_i = sqrt(lambda_i) > 0$*.

==== Columnas de $U$
De la relación $A v_i = sigma_i u_i$ *podemos despejar $u_i$* para $i <= r$:
$
  u_i = 1/sigma_i A v_i
$

Para que esta relación sea correcta, *debemos ver que $u_1, dots, u_r$ son otornomales*:

$
u_i^t u_j &= (1/sigma_i A v_i)^t (1/sigma_j A v_j)
           = #blue[$1/sigma_i$] (A v_i)^t #blue[$1/sigma_j$] A v_j 
           = #blue[$1/sigma_i 1/sigma_j$]  (A v_i)^t A v_j
           \ &= 1/sigma_i 1/sigma_j #blue[$v_i^t A^t$] A v_j
        = 1/sigma_i 1/sigma_j  v_i^t #blue[$lambda_j v_j$] #h(2em) (v_j "autovector de" A^t A) 
        \ &= 1/sigma_i 1/sigma_j #blue[$lambda_j$] v_i^t v_j = #blue[$0$] #h(2em) (v_i " y " v_j "son ortonormales")
$

Luego *$u_1, dots, u_r$ son ortogonales*. Falta ver que *$|| u_i ||_2 = 1$*:
$
  u_i^t u_i &= (1/sigma_i A v_i)^t (1/sigma_i A v_i)
             = #blue[$1/sigma_i$] (A v_i)^t #blue[$1/sigma_i$] A v_i 
             = #blue[$1/sigma_i^2$]  (A v_i)^t A v_i \
            &= 1/sigma_i^2 #blue[$v_i^t A^t$] A v_i 
             = 1/sigma_i^2 #blue[$lambda_i v_i^t$] #h(2em) (v_i "autovector de" A^t A) \
        &= 1/sigma_i^2 #blue[$lambda_i$] v_i^t v_i = 1/sigma_i^2 #blue[$lambda_i$]  #h(2em) (v_i^t v_i = 1) \
        &= 1/(#blue[$sqrt(lambda_i)$])^2 lambda_1 #h(2em) ("por definición de" sigma_i) \ &= 1/#blue[$lambda_i$] lambda_i = 1
$

Entonces *$u_1, dots, u_r$ son ortonormales*. Falta definir los $u_i$ con $i > r$ 


=== Propiedades
#propiedad[
  $
  ||A||_2 = sigma_1
  $
]

#propiedad[
  $
  kappa(A) = sigma_1 / sigma_r
  $
]

#propiedad[
  $
  ||A||_F = sqrt(sum_(i = 1)^r sigma_i^2)
  $
]