#import "../theme.typ": *

= Cuadrados Mínimos Lineales
== El problema
*Dado un conjunto de $m$ pares ordenados $(x_i, y_i)$* con $i = 1, 2, \ldots, m$, *buscamos una función $f(x)$* perteneciente a una familia $cal(F)$ tal que "mejor aproxime" a los datos.

*Hay diferentes formas de realizar esta aproximación*:

- Se puede intentar minimizar el error máximo, es decir, buscar la función $f(x)$ que minimiza la siguiente función:
  $
  min_(f in cal(F)) max_(i=1, dots, m) abs(f(x_i) - y_i)
  $

  Sin embargo, al considerar el error máximo, la función obtenida es sensible a valores atípicos que pueden aparecer en la muestra.

- Se puede intentar minimizar la suma de los errores absolutos, es decir, buscar la función $f(x)$ que minimiza la siguiente función:
  $
  min_(f in cal(F)) sum_(i=1)^m abs(f(x_i) - y_i)
  $

  En este caso, los valores atípicos deja de dominar a la muestra y reflejan mejor la tendencia de los datos. Sin embargo, la función obtenida puede no ser continua o diferenciable en todos los puntos.

- En general, *la forma más común de realizar la aproximación es minimizar la suma de los cuadrados de los errores*. Es decir, buscar la función $f(x)$ que minimiza la siguiente función:

$
 min_(f in cal(F)) sum_(i=1)^m (f(x_i) - y_i)^2
$



Dado un conjunto de funciones *${phi.alt_1, dots, phi.alt_n}$ linealmente independientes*, la familia $cal(F)$ se define como:
$
  cal(F) = {f(x) = sum_(j=1)^n c_j phi.alt_j(x)}
$

Donde *$c_j$ son los coeficientes* que se deben determinar *para minimizar la función de error*. Entonces:

$
min_(f in F) sum_(i=1)^m (f(x_i) - y_i)^2 = min_(c_1, dots, c_n) sum_(i=1)^m (sum_(j=1)^n c_j phi.alt_j(x_i) - y_i)^2
$

Sean $A in RR^(m times n)$, $b in R^m$ y $x in RR^n$ definidos como:
$
A = mat(phi.alt_1(x_1), dots, phi.alt_n(x_1);
        dots.v, dots.down, dots.v;
        phi.alt_1(x_m) , dots , phi.alt_n(x_m)) #h(2em) b = mat(y_1, dots, y_m) #h(2em) x = mat(c_1, dots, c_n)
$

Entonces podemos reescribir *el problema de minimización de manera matricial* como:
$
macron(x) = min_(x in RR^n) ||A x - b||_2^2
$

#pagebreak()
#propiedad[
  Existe $macron(x)$ solución del problema de cuadrados mínimos lineales (CML).

  #demoLine()
  Hay un resultado de álgebra lineal que establece que dada una matriz $A in RR^(m times n)$, $"Im"(A) plus.circle "Nu"(A) = RR^m$. Es decir, todo vector de $RR^m$ se puede escribir como la suma de dos vectores, uno en la imagen de $A$ y otro en el núcleo de $A^t$. Además, el $"Nu"(A^t) = "Im"(A)^bot$

  Aplicando este resultado al vector $b$, nos queda que  $b = b^1 + b^2$ con $b^1 in "Im"(A)$ y $b^2 in "Nu"(A^t)$. Entonces, el problema de minimización se puede reescribir como:
  $
    min_(x in RR^n) ||A x - b||_2^2 &= min_(x in RR^n) ||A x - #blue[$b^1 - b^2$]||_2^2
    \ &= min_(x in RR^n) #blue[$((A x - b^1) + b^2)^t ((A x - b^1) - b^2)$] " (por def de norma 2)"
    \ &= min_(x in RR^n) #blue[$(A x - b^1)^t (A x - b^1) - 2(A x - b^1)^t b^2 + b^2^t b^2$]
  $

  Como $A x - b^1 in "Im"(A)$ y $b^2 in "Nu"(A^t) = "Im"(A)^bot$, entonces $(A x - b^1)^t b^2 = 0$ y:

  $
   min_(x in RR^n) ||A x - b||_2^2 &= (A x - b^1)^t (A x - b^1) + b^2^t b^2 
   \ &= #blue[$||A x - b^1||_2^2$] + #blue[$||b^2||_2^2$]
  $

  Como el segundo termino es constante (no depende de $x$), el minimo será aquel que minimice $||A x - b^1||_2^2$.

  Ahora como $b^1 in "Im"(A)$, entonces existe $macron(x) in RR^n$ tal que $A macron(x) = b^1$. Luego, $||A macron(x) - b^1||_2^2 = 0$ que es lo mínimo que puede valer una norma. 

  Por lo tanto, siempre existe $macron(x)$ solución del problema de cuadrados mínimos lineales (CML). $qed$  

]

#propiedad[
  La solución es única si y solo si las columnas de $A$ son linealmente independientes.

  #demoLine()
  #blue[$=>)$] Sea $macron(x)$ una solución única del problema. Supongamos las columnas de $A$ son linealmente dependientes, entonces existe $z != 0 $ tal que $A z = 0$. Entonces, $A (macron(x) + z) = A macron(x) + A z = A macron(x) = b^1$. Luego, $macron(x) + z$ también es solución del problema, lo que contradice la unicidad de la solución.

  #blue[$arrow.l.double)$] Supongamos que las columnas de $A$ son linealmente independientes y existen al menos dos soluciones distintas $macron(x)_1$ y $macron(x)_2$. Entonces, $A (macron(x)_1 - macron(x)_2) = A macron(x)_1 - A macron(x)_2 = b^1 - b^1 = 0$. Luego, $macron(x)_1 - macron(x)_2$ es un vector no nulo que es solución del sistema homógeneo ($A z = 0$). Esto contradice que las columnas de $A$ sean linealmente independientes. $qed$
]

=== Ecuaciones normales
La caracterización de la solución de CML depende del valor de $b^1$ (proyección de $b$ en "Im"(A)), sin embargo *nos gustaría conseguir un sistema que dependa de los valores conocidos originales*: $A$ y $b$.

Si $macron(x) in RR^n$ es la solución de CML, entonces sabemos que 

$
A macron(x) = b^1 - b^2 &=>  #blue[$b^1$] - A macron(x) = b^2
    \ &=> #blue[$A^t$] (b^1 - A macron(x)) = #blue[$A^t$] b^2
$

Como $b^2 in Nu(A^t)$ entonces $A^t b^2 = 0$:

$
A^t (b - A macron(x)) = A^t b = 0 &=> A^t (b - A macron(x)) = 0
\ &=> #blue[$A^t$] b - #blue[$A^t$] A macron(x) = 0 
\ &=> #blue[$A^t A macron(x) = A^t b$]
$

Este sistema de ecuaciones es conocido como las *ecuaciones normales* del problema de CML.

Esta formulación nos da *$A^t A$ que es una matríz simétrica semidifinida positiva* (y si todas las columnas de $A$ son linealmente independientes es simétrica definida positiva). Gracias a esto podemos utilizar el método de Cholesky para resolver el sistema.

Sin embargo, *debido a la aritmética finita se pueden presentar algunos problemas*. Por ejemplo: 
$
A = mat(1, 1; epsilon, 0; 0, epsilon)  => A^t A = mat(1 + epsilon^2, 1; 1, 1 + epsilon^2)
$

En este caso, la matriz original $A$ tiene dos columnas iguales, pero problemas de representación numérica, las columnas guardadas en la computadora no lo son y la representación de $A$ termina teniendo dos columnas linealmente independientes. Por lo tanto 

#propiedad[
  Sea $A in RR^(m times n)$ con $rang(A) = n$. Entonces $A^t A$ es inversible y la solución de CML es $
   macron(x) = (A^t A)^(-1) A^t b
  $
]


Definimos $chi(A) = ||A||_2 ||(A^t A)^(-1) A^t||_2$.

#propiedad[
  Sea $A in RR^(m times n)$ con $rang(A) = n$. Sean $b, macron(b) in RR^m$ y $b^1, macron(b)^1$ las proyecciones en $"Im"(A)$. Si $b^1 != 0$ entonces:
$
  (||(A^t A)^(-1) A^t b - (A^t A)^(-1) A^t macron(b)||_2)/(||(A^t A)^(-1) A^t b||_2) <= chi(A) (||b^1 - macron(b)^1||_2)/(||b^1||_2)
$
]

#propiedad[
  $ chi(A)^2 = chi(A^t A) $
]

== Resolucion usando la factorización QR
=== Matriz de rango completo
Sea $A in RR^(m times n)$, $rang(A) = n$, $Q in RR^(m times m)$ matriz ortogonal y $R_1 in RR^(n times n)$ triangular superior con $rang(R_1) = n$ tal que: 
$
A = Q mat(R_1; 0)
$

Entonces el problema de Minimos Cuadrados Lineales (MCL) nos queda:
$
min_(x in RR^n) ||A x - b||_2^2 = min_(x in RR^n) norm(#blue[$Q^t$]A x - #blue[$Q^t$]b)_2^2 = min_(x in RR^n)1 norm(#blue[$mat(R_1; 0)$] x - Q^t b)_2^2 
$

Si definimos $c = Q^t b$, entonces queda:
$
min_(x in RR^n) norm(mat(R_1; 0) mat(x; 0) - mat(c_(1..n); c_(n+1...m)))_2^2 = min_(x in RR^n) norm( R_1 x - c_(1..n))_2^2 + norm(c_(n+1...m))_2^2
$

Luego la solución $x^*$ a CML es:
$
x^* = R_1^(-1) c_(1..n)
$

=== Matriz de rango no completo
Sea $A in RR^(m times n)$, $rang(A) = r < n$, $Q in RR^(m times m)$ matriz ortogonal y $R_1 in RR^(r times r)$ matriz triangular inferior con $rang(R_1) = r$ , $R_2 in RR^(r times (n-r))$ tal que:

$
A P = Q mat(R_1; R_2)
$

con $P$ matriz de permutación. Analicemos el problema de MCL:
$
min_(x in RR^n) norm(A x - b)_2^2 = min_(x in RR^n) norm(A P x - b)_2^2 = min_(x in RR^n) norm(Q^t A P x - Q^t b)_2^2 
$

Si $P x = macron(x)$ y $c = Q^t b$, entonces:
$
min_(macron(x) in RR^n) norm(mat(R_1; R_2) macron(x) - Q^t b)_2^2 = min_(macron(x) in RR^n) norm(R_1 macron(x)_(1 dots r) + R_2 macron(x)_(r+1 dots n) - c_(1 dots r))_2^2 + norm(c_(r+1 dots m))_2^2
$

La soluciónes $macron(x)^*$ de este sistema entonces son:
$
R_1 macron(x)^*_(1 dots r) + R_2 macron(x)^*_(r+1 dots n) = c_(1 dots r) \
$

== Resolucion usando la factorización SVD
Sea $A in RR^(m times n)$, $rang(A) = r$, $U in RR^(m times m)$ y $V in RR^(n times n)$ matrices ortogonales y $Sigma in RR^(m times n)$ matriz diagonal con $Sigma_(i,i) > 0$ tal que:
$
Sigma = mat(sigma_1, 0, dots.c, 0, dots.c, 0;
            0, sigma_2, dots.c, 0, dots.c, 0;
            dots.v, dots.v, dots.down, dots.v, dots.down, dots.v;
            0, 0, dots.c, sigma_r, dots.c, 0;
            0, 0, dots.c, 0, dots.c, 0;
            dots.v, dots.v, dots.down, dots.v, dots.down, dots.v;
            0, 0, dots, 0, 0, 0)
$

y $sigma_1 >= sigma_2 >= dots >= sigma_r > 0$ tal que $A = U Sigma V^t$. Analicemos el problema de MCL:

$
min_(x in RR^n) norm(A x - b)_2^2 = min_(x in RR^n) norm(U^t A x - U^t b)_2^2 = min_(x in RR^n) norm(Sigma V^t x - U^t b)_2^2
$

Definiendo $y = V^t x$:
$
min_(y in RR^n) norm(Sigma V^t x - U^t b)_2^2 = min_(y in RR^n) norm(Sigma y - U^t b)_2^2 = min_(y in RR^n) sum_(i=1)^r (sigma_i y_i - (U^t b)_i)^2 + sum_(i=r+1)^m (U^t b)_i^2
$

Definimos $y^*$ tal que $
y^*_i = (U^t b)_i/sigma_i " para " i = 1, dots, r$

Luego las soluciónes $x^*$ para el problema de MCL son:
$
x^* = V y^*   
$


