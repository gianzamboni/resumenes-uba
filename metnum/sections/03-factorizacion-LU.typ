#import "../theme.typ": *

= Factorización de Matrices
== Factorización LU
Resolver varios sistemas de ecuaciones lineales con Eliminación Gaussiana tiene complejidad $cal(O)(n^3)$ por cada uno. Existen técnicas de factorización de matrices que nos permiten mejorar esta complejidad.

La *factorización LU* de una matriz $A in RR^(n times n)$ es una factorización de la forma $A = L U$, donde $L$ es una *matriz triangular inferior* y $U$ es una *matriz triangular superior*.

Podemos usar esta factorización para resolver el sistema $A x = b$ de la siguiente forma:

- Factorizamos $A = L U$: Entonces $A x = b <=> L U x = b$.
- Definimos $y = U x$: Entonces podemos resolver $L y = b$  usando *forward substitution*.
- Luego, resolvemos el sistema $U x = y$ usando *backward substitution*.

Osea que resolvemos dos sistemas triangulares, lo cual tiene *complejidad $cal(O)(n^2)$ por cada uno*. Hay que ver cuanto nos cuesta factorizar $A$.

=== Método
Sea $A in RR^(n times n)$, supongamos que aplicamos eliminación gaussiana y se verifica que $a_(i i) != 0$ para todo $i in {1, 2, ..., n}$.

Sea $E$ la matriz elemental (tipo 2) que representa la *primer operación de la eliminación gaussiana*:

$
  E = mat(
    1, 0, 0, dots, 0;
    -m_(2 1), 1, 0, dots, 0;
    0, 0, 1, dots, 0;
    dots.v, dots.v, dots.v, dots.down, dots.v;
    0, 0, 0, dots, 1;
  )
$

Vemos que $E A = A_1$ representa la operación $ fila_2 (A) = fila_2 (A) - m_(2 1) fila_1 (A) $. Podemos juntar todas las matrices elementales (tipo 2) que representan las operaciones que anulan todos los elementos por debajo de la diagonal, y obtener una matriz $M_1$:

$
  M_1 = mat(
    1, 0, 0, dots, 0;
    -m_(2 1), 1, 0, dots, 0;
    -m_(3 1), 0, 1, dots, 0;
    dots.v, dots.v, dots.v, dots.down, dots.v;
    -m_(n 1), 0, 0, dots, 1;
  )
$.

Entonces $M^1 A = A^1$ donde $A^1$ es la matriz que se obtiene de $A$ al aplicar el primer paso de eliminación gaussiana.

De la misma manera, podemos definir *$M^i$ como la matriz que representa las operaciones que anulan todos los elementos por debajo de la diagonal* en la columna $i$:

$
  M^i = mat(
    1, dots, 0, 0, dots, 0;
    dots.v, dots.down, dots.v, dots.v;
    0, dots, 1, 0, dots, 1;
    0, dots, -m_(i+1 i), 1, dots, 0;
    dots.v, dots.v, dots.v, dots.down, dots.v;
    0, dots, -m_(n i), 0, dots, 1;
  )
$

Entonces $M^i A^(i-1) = A^i$ donde $A^i$ es la matriz que se obtiene de $A$ al aplicar el paso $i$ de eliminación gaussiana.

Luego, podemos pensar al proceso de eliminación gaussiana como una *secuencia de multiplicaciones de matrices*: Sea $U in RR^(n times n)$ la matriz triangular superior que se obtiene de aplicar eliminación gaussiana a $A$, entonces:

$ U = M^n M^(n-1) ... M^2 M^1 A $

#propiedad[
    #set pad(top: 2em)
  Sea $I in RR^(n times n)$ la matriz identidad, $e_i$ el vector que tiene $1$ en la posición $i$ y $0$ en el resto, y $m_i = [ 0, dots, m_(i+1 i), dots, m_(n i) ]$, entonces:

  *$ M^i = I - m_i^t e_i $* 
]

#pagebreak()
#propiedad[
 $M^i$ es una matriz *triangular inferior* con $1$ en la diagonal. 
] 

#propiedad[
 $M^i$ es *inversible* y su inversa es *$ \(M^i\)^(-1) = I + m_i^t e_i $*

  #demoLine()

  $ 
  M_i (M_i)^t &= (I - m_i^t e_i) (I + m_i^t e_i)  \
  &= I + m_i^t e_i - m_i^t e_i - m_i^t e_i m_i^t e_i \
  &= I - m_i^t e_i m_i^t e_i \
  $

  Pero $e_i m_i^t = 0$ porque $e_i$ tiene $0$ en todas las posiciones salvo en la $i$ y $m_i^t$ tiene $0$ en todas las posiciones hasta la posición $i$. Entonces $e_i m_i^t= 0$:

  $
    I - m_i^t e_i m_i^t e_i =  I - m_i^t 0 e_i = I
  $
]

Como habiamos dicho que $U = M^n M^(n-1) ... M^2 M^1 A$ y ahora sabemos que $M^i$ es inversible para todo $i = {1,dots,n}$, entonces:

$ A = (M^1)^(-1) (M^2)^(-1) ... (M^n)^(-1) U $

Entonces, si definimos *$L = (M^1)^(-1) (M^2)^(-1) ... (M^n)^(-1)$*, tenemos que $A = L U$ obtenemos la factorización LU de $A$ asociada a la eliminación gaussiana.

#v(1em)
#alert[
  *La factorización LU no siempre existe*. Si en algún paso de la eliminación gaussiana, nos encontramos con que $a_(i i) = 0$ para algún $i in {1, 2, ..., n}$, entonces la factorización LU no existe.
]

#pagebreak()
#propiedad[
 Si $A in RR^(n times n)$ es *no singular* y tiene *factorización LU*, entonces esa *factorización es única*.
 
 #v(1em)
 #demoLine()
 Supongamos que existen al menos dos factorizaciones LU de $A$: $A = L_1 U_1$ y $A = L_2 U_2$. 

 Como $A$ es inversible, entonces $U_1$ y $U_2$ son inversibles. Además, las inversas son tambien triangulares superiores. Tanto $L_1$ como $L_2$ son triangulares inferiores con $1$ en la diagonal. Entonces, partiendo de las dos factorizaciones:

  $ 
    L_1 U_1 &= L_2 U_2 \
    L_1^(-1) L_1 U_1 &= L_1^(-1) L_2 U_2 \
    U_1 &= L_1^(-1) L_2 U_2 \
    U_1 U_2^(-1) &= L_1^(-1) L_2 U_2 U_2^(-1) \
    U_1 U_2^(-1) &= L_1^(-1) L_2 \
  $ 

  $U_1 U_2^(-1)$ es una matriz triangular superior por ser producto de dos matrices triangulares superiores. $L_1^(-1) L_2$ es una matriz triangular inferior por ser producto de dos matrices triangulares inferiores. 

  Como $D = U_1 U_2^(-1) = L_1^(-1) L_2$ entonces $D$ necesariamente tiene que ser una matriz diagonal.

  Tambien sabemos que $L_1^(-1) L_2$ tiene $1$ en la diagonal. Entonces $D = I$. 

  Luego, $U_1 U_2^(-1) = I$ y $U_1 = U_2$. Entonces $L_1 = L_2$. $qed$
]

#pagebreak()
#propiedad[
  Sea $A in RR^(n times n)$ no singular.  
*$
  A " tiene factorización" L U \ <=> \ " todas sus matrices principales son no singulares"
$*

  #demoLine()
  $=>)$ Si $A$  es no signular y tiene factorización LU, tanto $L$ como $U$ son no singulares. Los elementos de la diagona de $L$ son todos $1$ y los elementos de la diagonal de $U$ son todos no nulos.  Las submatrices principales de $L$ son tambien triangulares con $1$ en la diagonal, por lo tanto son no singulares. Las submatrices principales de $U$ son triangulares superiores con elementos no nulos en la diagonal, por lo tanto son no singulares. 

  Como $A = L U$, entonces las submatriz de orden $k$ de $A$ es el resultado del producto de la submatriz de orden $k$ de $L$ y la submatriz de orden $k$ de $U$. Como ambas son no singulares, entonces la submatriz de orden $k$ de $A$ tambien es no singular.	 

  $arrow.l.double)$ Demostramos por inducción en la dimensión de la matriz $A$.

  - *Caso base*: $n = 2$

    Como $a_(11)$ no es nulo por ser la submatriz principal de orden $1$ de $A$, entonces el primer (y único) paso de la eliminación Gaussiana se puede realizar sin inconvenientes y se encuentra la factorización LU.

  - *Paso inductivo*: Supongamos que vale para matrices de imensión2 $n$ y veamos que vale para matrices de orden $n+1$. 

    Consideremos $A in RR^((n+1) times (n+1))$ con todas sus submatrices principales no singulares. Veamos que $A$ tiene factorización LU. 

    Si escribimos $A$ como:
    $
      A = mat(
        A^(\(n\)), c_(n+1);
        f^t_(n+1 1), a_(n+1 n+1);
      )
   $
    donde $A^(\(n\)) in RR^(n times n)$, $c_(n+1) in RR^n$, $f_(n+1 1) in RR^n$ y $a_(n+1 n+1) in R$.
]

#propiedad[
  Si $A in RR^(n times n)$ es estrictamente diagonal dominante, entonces $A$ tiene factorización LU.
]

=== Factorización PLU
En caso de que la factorización LU no exista, podemos usar *pivoteo parcial* para obtener una factorización PLU que es una factorización LU la *matriz original con sus filas permutadas*.

