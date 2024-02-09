#import "../theme.typ": *

= Cuadrados Mínimos Lineales
== El problema
*Dado un conjunto de $m$ pares ordenados $(x_i, y_i)$* con $i = 1, 2, \ldots, m$, *buscamos una función $f(x)$* perteneciente a una familia $cal(F)$ tal que "mejor aproxime" a los datos.

Hay diferentes formas de realizar esta aproximación:

- $min_(f in cal(F)) max_(i=1, dots, m) abs(f(x_i) - y_i)$
La mejor aproximación se define como aquella función $f(x)$ *que minimiza la suma de los cuadrados de los errores*, es decir, que minimiza la siguiente función:

$
 min_(f in cal(F)) sum_(i=1)^m (f(x_i) - y_i)^2
$

Dado un conjunto de funciones ${phi.alt_1, dots, phi.alt_n}$ linealmente independientes, la familia $cal(F)$ se define como:
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
min_(x in RR^n) ||A x - b||_2^2 = min_(y in "Im"(A)) ||y - b||_2^2
$

Como $"Im"(A) plus.circle "Nu"(A) = RR^m$ porque las funciones son linealmente independientes, vale que que *$b = b^1 + b^2$ con $b^1 in "Im"(A)$ y $b^2 in "Nu"(A^t)$*. Si remplazamos en la fórmula de arriba:

$
||y - b||_2^2 = ||y - b^1 - b^2||_2^2 = ||y - b^1||_2^2 + ||b^2|| - 2(y - b^1)^t b^2
$

Pero $(y - b^1) in "Im"(A)$ y $b^2 in "Nu"(A^t)$ y estos dos espacios son ortogonales entre sí. Entonces $2(y - b^1)^t b^2 = 0$ y la fórmula se simplifica a:
$
 min_(y in "Im"(A)) ||y - b||_2^2 =  min_(y in "Im"(A)) ||y - b^1||_2^2 + ||b^2||_2^2
$

Ahora, como el segundo termino es constante (no depende de $y$), minimizar el primer término es lograr que valga cero. Entonces $y = b^1$ y *el problema de minimización se reduce a encontrar $x^* in RR^n$ tal que $A x^* = b^1$*. 

Este problema *siempre tiene solución* ya que $b^1 in "Im(A)"$. 

#pagebreak()
#propiedad[
  La solución es única si y solo si las columnas de $A$ son linealmente independientes.
]

#propiedad[
  Si $x^* in RR^n$ es solución y $r = b - A x^*$ entonces:
  $
  A^t r = 0 \

  A^t A x^* = A^t b
  $
]	

#propiedad[
  Sea $A in RR^(m times n)$ con $rang(A) = n$. Entonces $A^t A$ es inversible y la solución de CML es $
    x^* = (A^t A)^(-1) A^t b
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
Sea $A in RR^(m times n)$, $rang(A) = r < n$, $Q in RR^(m times m)$ matriz ortogonal y $R_1 in RR^(r times r$ matriz triangular inferior con $rang(R_1) = r$ , $R_2 in RR^(r times (n-r))$ tal que:

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
Sigma = mat(sigma_1, 0, dots, 0, dots, 0;
            0, sigma_2, dots, 0, dots, 0;
            dots, dots, dots, dots, dots, dots;
            0, 0, dots, sigma_r, 0, dots;
            0, 0, dots, 0, 0, dots;
            dots, dots, dots, dots, dots, dots;
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

