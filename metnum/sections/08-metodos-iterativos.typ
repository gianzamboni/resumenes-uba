#import "../theme.typ": *

= Métodos iterativos para sistemas de ecuaciones lineales

== Introducción

Sean $A in RR^(n times n)$ y $b in RR^n$. Un *método iterativo* para resolver el sistema $A x = b$ *es un algoritmo que* produce una secuencia de vectores ${x^(k)}$ que *se espera converja a la solución del sistema*.

Estos métodos, en la práctica, son *muy útiles para sistemas de gran tamaño*, en los que los métodos exactos son muy costosos en términos de tiempo y memoria.

Vamos a estudiar dos métodos iterativos muy conocidos: el *método de Jacobi* y el *método de Gauss-Seidel* que

=== Método de Jacobi
Sean *$x^0 in RR^n$*. Supongamos que *$a_(i i) != 0 " " forall i = 1 dots n$*. Definimos $x^1$ de la siguiente manera:

$
x_1^1 = (b_1 - sum_(j=1 \ j != 1)^(n) a_(1 j) x_j^0) / a_(1 1) \
x_2^1 = (b_2 - sum_(j=1 \ j != 2)^(n) a_(2 j) x_j^0) / a_(2 2) \
#v(2em) dots.v  #v(2em)\
x_i^1 = (b_i - sum_(j=1 \ j != i)^(n) a_(i j) x_j^0) / a_(i i) \
#v(2em) dots.v #v(2em)\
x_n^1 = (b_n - sum_(j=1 \ j != n)^(n) a_(n j) x_j^0) / a_(n n)
$

A partir de $x^1$, definimos $x^2, x^3, dots$ de la misma manera:

$
x_i^(k+1) = (b_1 - sum_(j=1 \ j != 1)^(n) a_(i j) x_j^k) / a_(i i)
$

Si quisieramos escribir usando operaciones matriciales, debemos encontrar una forma de escribir $A$ un poco más cómoda. Para ello, descompogamosla de la siguiente manera:
$
A &= D - L - U \ &= mat(
a_(1 1) , dots, 0, dots , 0 ;
dots.v, dots.down, dots.v, dots.down, dots.v;
0, dots, a_(i i), dots, 0 ;
dots.v, dots.down, dots.v, dots.down, dots.v;
0, dots, 0, dots, a_(n n)
) - mat(
  0, dots, 0, dots, 0 ;
  dots.v, dots.down, dots, dots.down, dots.v;
  -a_(i 1), dots, 0, dots, 0 ;
  dots.v, dots.down, dots, dots.down, dots.v;
  -a_(n 1), dots, -a_(n n-1), dots, 0
) - mat(
  0, dots, -a_(1 2), dots, -a_(1 n) ;
  dots.v, dots.down, dots, dots.down, dots.v;
  0, dots, 0, dots, -a_(i n) ;
  dots.v, dots.down, dots, dots.down, dots.v;
  0, dots, 0, dots, 0
)
$

Entonces:
$
 A x = b\
(D - L - U) x = b\
D x - (L + U) x = b \
D x = (L + U) x + b\
x = D^(-1)((L + U) x + b)
x = D^(-1)(L + U) x + D^(-1) b
$

Si ahora vemos como es la forma que tiene cada uno de los elementos de $x$, vemos que es igual a la forma al principio de cada sección, por lo que cada iteración de Jacobi se puede escribir como:

*$
x^(k+1) = D^(-1)(L + U) x^k + D^(-1) b
$*

=== Método de Gauss-Seidel
Sea $x^0 in RR^n$. Supongamos que *$a_(i i) != 0 " " forall i = 1 dots n$*. Definimos $x^1$ de la siguiente manera:

$
x_1^1 = (b_1 - sum_(j=1 \ j != 1)^(n) a_(1 j) x_j^0) / a_(1 1) \
x_2^1 = (b_2 - a_(2 1) x^1_1 - sum_(j=3)^(n) a_(2 j) x_j^1) / a_(2 2) \
#v(2em) dots.v  #v(2em)\
x_i^1 = (b_i - sum_(j = 1)^(i-1) a_(i j) x^1_j - sum_(j=i+1)^(n) a_(i j) x_j^1) / a_(i i) \
#v(2em) dots.v #v(2em)\
x_n^1 = (b_n - sum_(j=1)^(n-1) a_(n j) x_j^1) / a_(n n)
$

De manera similar, los siguientes valores de $x$ se definen como:

$
x_i^(k+1) = (b_i - sum_(j = 1)^(i-1) a_(i j) x^k_j - sum_(j=i+1)^(n) a_(i j) x_j^k) / a_(i i) 
$

Y usando la descomposición de $A$ en $D - L - U$, podemos despejar $x$ de tal manera que nos permitirá escribir el método de Gauss-Seidel de manera matricial:
$
A x = b \
(D - L - U) x = b \
(D - L)x - U x = b \
(D - L)x = U x + b \
x = (D - L)^(-1) U x + (D - L)^(-1) b
$

Luego, la iteración de Gauss-Seidel se puede escribir como:
*$
x^(k+1) = (D - L)^(-1) U x^k + (D - L)^(-1) b
$*

== Análisis de convergencia
  Dado un vector inicial *$x^0 in RR^(n times n)$* y *$T in RR^(n times n)$* y *$c in RR^n$*, 

$
x^(k+1) = T x^k + c
$

En Jacobi, $T = D^(-1)(L + U)$ y $c = D^(-1) b$. En Gauss-Seidel, $T = (D - L)^(-1) U$ y $c = (D - L)^(-1) b$.

Si *$x^*$ es la solución del sistema*, vamos a ver condiciones necesarias para que la secuencia ${x^(k)}$ converja a *$x^*$*.

=== Matriz convergente
Sea $A in RR^(n times n)$, decimos que $A$ es convergente si 
$
lim_(k -> oo) A^k = 0
$

#propiedad[
  $ 
  A "es convergente" &<=> rho(A) < 1 \ &<=> lim_(k -> oo) ||A_k || = 0 " para toda norma inducida" \ &<=> lim_(k -> oo) A^k x = 0 " para todo " x in RR^n
  $
]

#propiedad[
  Si $rho(A) < 1 => I - A$ es no singular y $
    sum_(k=0)^(oo) A^k = (I - A)^(-1)
  $
]

=== Teorema de convergencia
La sucesión ${x^(k)}$ definida por $x^(k+1) = T x^k + c$ converge a $x^*$ para cualquier $x^0$ inicial a la solución del sistema $x = T x + c$ si y solo si $rho(T) < 1$.

==== Demostración

*$arrow.l.double)$* Como $rho(T) < 1$, entonces $(I-T)$ es inversible. Entonces $
x = T x + c <=> (I - T) x = c <=> x^* = (I - T)^(-1) c
$

Sea la sucesión $x^k = T x^(k-1) + c$. Entonces podemos expresar a $x^(k-1)$ en función de $x^(k-2)$ quedandonos:
$
x^k = T x^(k-1) + c = T (T x^(k-2) + c) + c = T^2 x^(k-2) + T c + c
$

De manera similar, podemos expresar a $x^(k-2)$ en función de $x^(k-3)$ y así sucesivamente. Entonces, podemos expresar a $x^k$ en función de $x^0$ de la siguiente manera:

$
x^k = T^k x^0 + T^(k-1) c + T^(k-2) c + dots + c = T^k x^0 + (T^(k-1) + T^(k-2) + dots + I) c
$

Como $rho(T) < 1$, entonces $lim_(k -> oo) T^k = 0$. Además $sum_(k=0)^(oo) T^k = (I - T)^(-1)$. Entonces

$
lim_(k -> oo) x^k = lim_(k -> oo) T^k x^0 + lim_(k -> oo) (T^(k-1) + T^(k-2) + dots + I) c = 0 + (I - T)^(-1) c.
$

Luego el límite de la sucesión existe, no depende de $x^0$ y es igual a $x^* = (I - T)^(-1) c$.
#v(2em)
*$arrow.r.double)$* Debemos ver que $rho(T) < 1$ sabiendo que la sucesión converge independientemente del $x^0$ inicial.

Sabemos que $
  rho(T) < 1 <=> A " es convergente" <=> lim_(k -> oo) T^k z = 0 " para todo " z in RR^n
$

Demostremos entonces que $lim_(k -> oo) T^k z = 0 " para todo " z in RR^n$:

Sea $z in RR^n$. Consideremos $x^0 = x^* - z$. con $x^*$ el límite de la suseción ${x^k}$:
$
lim_(k -> oo) T^k z &= lim_(k -> oo) T^k#blue[$(x^* - x^0)$]
  \ & = lim_(k -> oo) T^(#blue[$k-1$]) (#blue[$T$] x^* - #blue[$T$] x^0) 
  \ & = lim_(k -> oo) T^(k-1)(#blue[$x^* - c$] - T x^0)
  \ &  = lim_(k -> oo) T^(k-1) (x^* - c - #blue[$x^1 + c$])
  \ &  = lim_(k -> oo) T^(k-1) (x^* - x^1)
  \ &  = lim_(k -> oo) T^(#blue[$k-2$]) (#blue[$T$] x^* - #blue[$T$] x^1)
  \ & = lim_(k -> oo) T^(k-2)(#blue[$x^* - c$] - T x^1)
  \ &  = lim_(k -> oo) T^(k-2) (x^* - c - #blue[$x^2 + c$])
  \ &  = lim_(k -> oo) T^(k-2) (x^* - x^2)
$

Si seguimos haciendo los remplazos correspondientes, llegaremos a que $
lim_(k -> oo) T^k z = lim_(k -> oo) (x^* - x^k)
$

Este último límite es igual a 0, ya que la sucesión converge a $x^*$. Por lo tanto, $rho(T) < 1$.

#propiedad[
  Si $A in RR^(n times n)$ es estrictamente diagonal dominante, entonces el método de Jacobi converge.
]

#pagebreak()
#propiedad[
  Si $A in RR^(n times n)$ es estrictamente diagonal dominante, entonces el método de Gauss-Seidel converge.
]

#propiedad[
  Si $A in RR^(n times n)$ es simétrica definida positiva, entonces el método de Gauss-Seidel converge.
]

#propiedad[
  Sea $A in RR^(n times n)$ tal que $a_(i j) <= 0 " " forall i != j$ y $a_(i i) > 0 " " forall i$. Se satisface una sola de las siguientes propiedades:

  - $rho(T_(G S)) < rho(T_(J)) < 1$
  
  - $1 < rho(T_(J)) < rho(T_(G S))$
  
  - $rho(T_(G S)) = rho(T_(J)) = 0$
  
  - $rho(T_(G S)) = rho(T_(J)) = 1$
]

#propiedad[
  Sea $A in RR^(n times n)$ tal que $a_(i j) <= 0 " " forall i != j$ y $a_(i i) > 0 " " forall i$. Entonces, ambos métodos divergen o ambos convergen. En el segundo caso, el método de Gauss-Seidel converge más rápido.
]

=== Cota del error
Sea $T in RR^(n times n)$ tal que $||T|| < 1$ para una norma inducida. Entonces:

#propiedad[
$ x^(k+1) = T x^k + c$ converge independientemente del $x^0$ inicial.

#demoLine()
Hay una propiedad que estables que $abs(rho(A)) <= ||A||$ para toda norma inducida. Por lo tanto $rho(T) < ||T|| < 1$ y la sucesión converge independientemente del $x^0$ inicial (por el teorema de convergencia).
]

#propiedad[
  $||x^* - x^k|| <= ||T||^k ||x^* - x^0||$

  #demoLine()
  Sabemos que $x^* = T x^* + c^1$ y que la suceción $x^k = T^k x^(k-1) + c$:
  $
  || x^* - x^k || &= || T x^* + c - T^k x^(k-1) - c || 
    \ &= || T (x^* - x^(k-1)) || <= || T || || x^* - x^(k-1) ||
  $

  Volviendo a aplicar el mismo razonamiento, llegamos a que:
  $
   || x^* - x^k || &<= || T || || T x^* + c - T^k x^(k-1) - c || 
    \ &= || T || || T (x^* - x^(k-1)) || <= || T ||^2 || x^* - x^(k-1) ||
  $

  Repetimos el proceso $k$ veces y llegamos a que:

  $
  || x^* - x^k || &<= || T ||^k || x^* - x^0 || qed
  $
]

#propiedad[
  $ ||x^* - x^k|| <= (||T||^k) / (1 - ||T||) ||x^1 - x^0|| $

  #demoLine()
  Veamos primero la diferentes dos iteraciones sucesivas de la serie:
  $
  || x^(k+1) - x^(k) || &= || T x^(k+1) + c - T^(k) x^(k-1) - c || 
    \ &= || T (x^(k) - x^(k-1)) || <= || T || || x^(k) - x^(k-1) ||
  $

  Si seguimos remplazando, nos queda que:
  $
  || x^(k+1) - x^(k) || &<= || T ||^k || x^1 - x^0 || <= 
  $

  Ahora tomamos $x^i$ y $x^j$ con $j > k$:

  $
  || x^j - x^k || &<= (||T||^(j-1) + ||T||^(j-2) + dots + ||T||^k) ||x^1 - x^0|| 
  \ &<= ||T||^k (sum_(i = 0)^(j-1-k) ||T||^i) ||x^1 - x^0||
  $

Si ahora tomamos el límite cuando $j -> oo$, como ${x^j}^(oo)_(j = 0)$ converge a $x^*$ y  
$
  sum_(i = 0)^(j-1-k) ||T||^i = sum_(i = 0)^(oo) ||T||^i " que es la serie geométrica"
$

Entonces, como $||T|| < 1$, la serie converge a $1 / (1 - ||T||)$. Por lo tanto, $
  || x^* - x^k || &<= (||T||^k) / (1 - ||T||) ||x^1 - x^0|| qed
 $
]