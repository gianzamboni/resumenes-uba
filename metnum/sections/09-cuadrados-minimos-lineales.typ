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

En este caso, la matriz original $A$ tiene dos columnas iguales, pero problemas de representación numérica, las columnas guardadas en la computadora no lo son y la representación de $A$ termina teniendo dos columnas linealmente independientes. Osea que *este sistema aproximado tiene una única solución pero el sistema original tiene infinitas soluciones*. 

Por otro lado, es posible que $A^t A$ esté mal condicionada, veamos su número de condición relativo a la norma 1:

$
(A^t A)^(-1) = mat( (1 + epsilon^2)/(epsilon^2(2 + epsilon^2)), (-1)/(epsilon^2(2 + epsilon^2)); -1/(epsilon^2(2 + epsilon^2)), 1/(epsilon^2(2 + epsilon^2))) \

||A^t A||_1 = max_(j=1, dots, n) sum_(i=1)^n |(A^t A)_(i,j)| = 2 + epsilon^2 \

||(A^t A)^(-1)||_1 = max_(j=1, dots, n) sum_(i=1)^n |(A^t A)^(-1)_(i,j)| = (2 + epsilon^2)/(epsilon^2) \

kappa(A^t A) = ||A^t A||_1 ||(A^t A)^(-1)||_1 = (2 + epsilon^2)^2/(epsilon^2)
$

Entonces, para valores de $epsilon$ muy pequeños, el número de condición de $A^t A$ es muy grande. 

#pagebreak()
#propiedad[
  Sea $A in RR^(m times n)$ con $rang(A) = n$. Entonces $A^t A$ es inversible y la solución de CML es $
   macron(x) = (A^t A)^(-1) A^t b
  $
]

== Resolución usando la factorización QR
Sea $A in RR^(m times n)$, $rang(A) = n$, $Q' in RR^(m times m)$ matriz ortogonal y $R' in RR^(m times n)$ triangular superior tal que $A P= Q R$. Además, $rang(A) = rang(R)$

Sea $P in RR^(n times n)$ matriz de permutación tal que $A P = Q R$ tal que $R$ es $R'$ reorganizada de la siguiente manera:
$
R = mat(
  r_(11), r_(12), dots, r_(1p), r_(1p+1), dots, r_(1n);
  0, r_(22), dots, r_(2p), r_(2p+1), dots, r_(2n);
  dots.v, dots.v, dots.down, dots.v, dots.v, dots.down, dots.v;
  0, 0, dots, r_(p p), r_(p p+1), dots, r_(p n);
  0, 0, dots, 0, 0, dots, 0;
  dots.v, dots.v, dots.down, dots.v, dots.v, dots.down, dots.v;
  0, 0, dots, 0, 0, dots, 0
) = mat(R_1; 0^(n-p))
$

donde $R_1 in (p times n)$ es la submatriz que toma desde la fila $1$ hasta la fila $p$ y desde la columna 1 hasta $n$ de $R'$

$
A P = Q mat(R_1; 0^(n-p))
$

Entonces el problema de Minimos Cuadrados Lineales (MCL) nos queda:
$
min_(x in RR^n) norm(A x - b)_2^2 &= min_(x in RR^n) norm(#blue[$Q^t$] (A x - b))_2^2  
 \ &= min_(x in RR^n) norm(#blue[$Q^t$]A x - #blue[$Q^t$]b)_2^2 
 \ &= min_(x in RR^n) norm(Q^t A #blue[$P P^(-1)$] x - Q^t b)_2^2
 \ &= min_(x in RR^n) norm(#blue[$R$] P^(-1) x - Q^t b)_2^2 
$

Simplifiquemos un poco más el problema, definamos $y = P^(-1) x$ y $c = mat(c^(p); c^(m-p)) = Q^t b$ entonces:

- Si $A$ tiene columnas linealmente independientes, entonces $rang(A) = n = p$ y $P = I$:
  
  $
    min_(x in RR^n) norm(A x - b)_2^2 &= min_(x in RR^n) norm(R x - Q^t b)_2^2 \
      &= min_(x in RR^n) norm(#blue[$R_1$]x - mat(c_(1..n); c_(n+1...m)))_2^2 \
      &= min_(x in RR^n) norm( R_1 x - c)_2^2 + norm(c^(m-n))_2^2
  $

  El segundo término es una constante, por lo que podemos eliminarlo:
  
  $
    min_(x in RR^n) norm(A x - b)_2^2 = min_(x in RR^n) norm( R_1 x - c)_2^2 >= 0
  $

  Como $R_1$ es triangular superior con elementos no nulos en ladiagonal, entonces podemos afirmar que existe $x$ tal que $R_1 x - c = 0$ y este $x$ es solución del problema de MCL.

- Ahora si $A$ tiene columnas linealmente dependientes, entonces $rang(A) = p < n$ y
$
  min_(x in RR^n) norm(A x - b)_2^2 &= min_(x in RR^n) norm(#blue[$R$] P^(-1) x - Q^t b)_2^2  
  \ &= min_(#blue[$y in RR^n$]) norm(R #blue[$y$] - Q^t b)_2^2
  \ &= min_(y in RR^n) norm(#blue[$mat(R_1; 0^(n-p))mat(y^p; y^(n-p))$] - #blue[$mat(c^(p); c^(m-p))$])_2^2
  \ &= min_(y in RR^n) norm(#blue[$R_1 y^p - c^(p)$])_2^2 + norm(c^(m-p))_2^2
  \ &= min_(y in RR^n) norm(R_1 y^p - c^(p))_2^2
$

Luego el problema se reduce a encontrar $y^p$ tal que $R_1 y^p - c^(p) = 0$ y asignar valores arbitrarios al resto de las coordenadas de $y$. De esta manera, una vez obtenido $y$, se puede resolver el sistema $y = P^(-1) x$

== Resolucion usando la factorización SVD
Sea $A in RR^(m times n)$, $rang(A) = r$, por la descomposición SVD sabemos que existen $U in RR^(m times m)$ y $V in RR^(n times n)$ matrices ortogonales y $Sigma in RR^(m times n)$ matriz diagonal:
$
Sigma = mat(sigma_1, 0, dots.c, 0, dots.c, 0;
            0, sigma_2, dots.c, 0, dots.c, 0;
            dots.v, dots.v, dots.down, dots.v, dots.down, dots.v;
            0, 0, dots.c, sigma_r, dots.c, 0;
            0, 0, dots.c, 0, dots.c, 0;
            dots.v, dots.v, dots.down, dots.v, dots.down, dots.v;
            0, 0, dots, 0, 0, 0)
$

y $sigma_1 >= sigma_2 >= dots >= sigma_r > 0$ tal que $A = U Sigma V^t$. Analicemos el problema de Cuadrados Mínimos Lineales:

$
min_(x in RR^n) norm(A x - b)_2^2 &= min_(x in RR^n) norm(#blue[$U^t$] (A x - b))_2^2 
\ &= min_(x in RR^n) norm(#blue[$U^t$] A x - #blue[$U^t$] b)_2^2 
\ &= min_(x in RR^n) norm(#blue[$Sigma V^t$] x - U^t b)_2^2
$

Definiendo $y = V^t x$ y $c = mat(c ^(r); c^(m-r)) = U^t b$ entonces:

$
min_(x in RR^n) norm(Sigma V^t x - U^t b)_2^2 = min_(#blue[$y in RR^n$]) norm(Sigma #blue[$y$] - #blue[$c$])_2^2 
$

- Si A tiene todas sus columnas linealmente independientes entonces $r = n$ y:
  $
   min_(y in RR^n) norm(Sigma y - c)_2^2 = min_(y in RR^n) norm(Sigma y - c^(n))_2^2 + norm(c^(m-n))_2^2
  $

  El segundo término es una constante y lo mínimo que puede valer el primer término es cero. Como $Sigma$ tiene $n$ elementos no nulos, entonces podemos afirmar que existe único $y$ tal que $Sigma y - c^(n) = 0$. Basta tomar $
   y = c_i^n / sigma_i " para " i=1, dots, n
  $
  y luego resolver el sistema $y = V^t x$ para obtener $x$.

- Si A tiene columnas linealmente dependientes entonces $r < n$: sea $Sigma^p$ la submatriz de $Sigma$ con las primeras $r$ filas y $r$ columnas e $y^p$ el vector formado por las primeras $r$ coordenadas de $y$ e $y^(n-p)$ el vector que contiene al resto.

  $
   min_(y in RR^n) norm(Sigma y - c)_2^2 = min_(y in RR^n) norm(Sigma^p y^p - c^(p))_2^2 + norm(c^(m-r))_2^2
  $

  El segundo término es una constante y lo mínimo que puede valer el primer término es cero. Como $Sigma^p$ tiene $r$ elementos no nulos, entonces podemos afirmar que existe único $y^p$ tal que $Sigma^p y^p - c^(p) = 0$. Basta tomar $
   y^p = c_i^p / sigma_i " para " i=1, dots, r
  $
  
  El resto de las coordenadas de $y$ no influyen en el mínimo y pueden tomar valores arbitarios. De esta manera se pueden obtener las infinitas soluciones $x$ del problema resolviendo el sistema $y = V^t x$.

== Estimación del error
Vamos a proponer una *generalización del número de condición* que funcion para matrices no cuadradas:

$
chi(A) = ||A||_2 ||(A^t A)^(-1) A^t||_2
$

Este número lo podremos utilizar para medir la  relación entre pequeños cambios del vector $b$ con los cambios en la solución del problema de Cuadrados Mínimos Lineales.

#propiedad[
  Sea $A in RR^(m times n)$ con $rang(A) = n$. Sean $b, macron(b) in RR^m$ tales que $b = b_1 + b_2$, $macron(b) = macron(b)_1 + macron(b)_2$ con $b_1, macron(b)_1 in "Im"(A)$ y $b_2, macron(b)_2 in "Nu"(A^t)$. Si $b^1 != 0$ entonces:
$
  norm(x - macron(x))/norm(macron(x)) = (||(A^t A)^(-1) A^t b - (A^t A)^(-1) A^t macron(b)||_2)/(||(A^t A)^(-1) A^t b||_2) <= chi(A) (||b^1 - macron(b)^1||_2)/(||b^1||_2)
$

#demoLine()
Como $rang(A) = n$, la solución del problema de Cuadrados Mínimos Lineales es única y sabemos que verifica:
$
  x = (A^t A)^(-1) A^t b \
  macron(x) = (A^t A)^(-1) A^t macron(b)
$

Entonces:
$
  norm(x - macron(x))_2 &= norm(#blue[$(A^t A)^(-1) A^t b$] - #blue[$(A^t A)^(-1) A^t macron(b)$])_2
  \ &= norm((A^t A)^(-1) A^t #blue[$(b^1 + b^2)$] - (A^t A)^(-1) A^t #blue[$(macron(b)^1 + macron(b)^2)$])_2
  \ &= norm((A^t A)^(-1) A^t b^1 - (A^t A)^(-1) A^t macron(b)^1)_2 " porque " b^2, macron(b)^2 in "Nu"(A^t)
  \ &= norm((A^t A)^(-1) A^t (b^1 - macron(b)^1))_2
  \ &<= norm((A^t A)^(-1) A^t)_2 norm(b^1 - macron(b)^1)_2 " por def de norma"
$

Por otro lado, $A x = b^1$ entonces $||b_1||_2 = ||A x||_2 <= ||A||_2 ||x||_2$:
$
  1/norm(x)_2 <= norm(A)_2 / norm(b^1)_2
$

Multiplicando los dos términos del mismo lado de las desigualdades tenemos:
$
  norm((A^t A)^(-1) A^t b - (A^t A)^(-1) A^t macron(b))_2 / norm(x)_2 <= (norm(A)_2 norm((A^t A)^(-1) A^t)_2 norm(b^1 - macron(b)^1)_2) / norm(b^1)_2 qed
$
]

#pagebreak()
#propiedad[
  $ chi(A)^2 = chi(A^t A) $
]