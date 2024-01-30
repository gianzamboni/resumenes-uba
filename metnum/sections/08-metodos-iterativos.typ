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