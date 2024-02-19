#import "../theme.typ": *

= Interpolación
== Definiciones
Dado un conjunto de pares ordenadas de valores $(x_i, y_i)$ para $i=0,1,2,...,n$, *buscamos un polinomio $P(x)$ de grado menor o igual a $n$* que interpole a los puntos dados, es decir, *tal que*:
$
P(x_i) = y_i #h(1em) forall i=0,1,2,...,n
$

=== Polinomio de Lagrange
Definamos el polinomio $
L_(n k) = product_(i=0, i!=k)^n (x-x_i)/(x_k-x_i)
$

Entonces $L_(n k)$ es un polinomio de grado $n$ tal que

- $L_(n k) (x_i) = 0 #h(1em) forall i = 0, dots, n and i != k$

- $L_(n k) (x_k) = 1$

Nos falta hacer que $L_(n k)$ sea igual a $y_k$ en $x_k$. Entonces:
$
  P(x) = sum_(k=0)^n y_k L_(n k) (x)
$

Este último polinomio cumple con la condición de interpolación, es decir, $P(x_i) = y_i$ para $i=0,1,2,...,n$ y es conocido como el *polinomio interpolador*.

#propiedad[
  Dados $(x_i, y_i) "para" i=0,1,2,...,n$, el polinomio interpolador de grado menor o igual a $n$ es único.
]

==== Error de interpolación
*Sea $f: RR -> RR in C^(n+1)[a,b]$* (una función $n+1$ veces derivable definida en el intervalo cerrado $[a,b]$) y sean $x_0, dots, x_n in [a,b]$.

Consideremos $P(x)$, el polinomio interpolador de grado menor o igual a $n$ que la interpola y $macron(x) in [a, b]$ entonces *existe $xi(macron(x))$ tal que*:
$
f(macron(x)) = P(macron(x)) + (f^(n+1)(xi(macron(x))))/(n+1)! product_(i=0)^n (macron(x) - x_i)
$

===== Demostración
Supongamos que $P$ es el polinomio interpolador de $f$ que pasa por los puntos $(x_i, f(x_i))$ para $i=0,1,2,...,n$.

- Si $macron(x) = x_k$ para algun $k in {0, dots, n}$ entonces $P(macron(x)) = f(macron(x))$ porque para armar $P$ usamos a $macron(x)$. Por otro lado, $product_(i=0)^n (macron(x) - x_i)$ se anula. Entonces no importa que valor tome $xi(macron(x))$, la identidad siempre es verdadera.

- Supongamos ahora que $macron(x)$ no es ninguno de los $x_i$ originales, entonces definimos la función $
g(t) = f(t) - P(t) - (f(macron(x)) - P(macron(x))) product_(i=0)^n (t - x_i) / (macron(x) - x_i) " para " t in [a, b]
$ 

Veamos sus propiedades:

#propiedad[
  $
  g in C^(n+1)[a, b] 
  $

  #demoLine()
  Tenemos que analizar la derivabilidad de cada uno de los términos de $g(t)$:

  - $f(t)  in C^(n+1)[a,b]$ por hipótesis.
  - $P(t) in  C^(n+1)[a,b]$ porque es un polinomio de grado menor o igual a $n$.
  - $f(macron(x)) - P(macron(x))$ por que es resta de funciones en $C^(n+1)[a,b]$.
  - $product_(i=0)^n (t - x_i) / (macron(x) - x_i) in C^(n+1)[a,b]$ porque es un polinomio.

]

#propiedad[
  Si $x_k$ es uno de los puntos usados para armar el polinomio, entonces $g(x_k) = 0$

  #demoLine()
  $
  g(x_k) &= f(x_k) - P(x_k) - (f(macron(x)) - P(macron(x))) product_(i=0)^n (x_k - x_j) / (macron(x) - x_j) 
   \ &= f(x_i) - #blue[$f(x_i)$] - (f(macron(x)) - P(macron(x))) #blue[$(x_k - x_k)$] product_(j=0 \ j!=k)^n (x_i - x_j) / (macron(x) - x_j) 
   \ &= 0
  $
]

#propiedad[
    $ g(macron(x)) = 0 $

  #demoLine()
  $
  g(macron(x)) &= f(macron(x)) - P(macron(x)) - (f(macron(x)) - P(macron(x))) product_(i=0)^n (macron(x) - x_j) / (macron(x) - x_j) 
   \ &= f(macron(x)) - P(macron(x)) - (f(macron(x)) - P(macron(x)))
   \ &= 0
  $
]

#corolario(title:"Teorema de Rolle")[
  Sea $h: RR -> RR$ una función continua en $[c,d]$ y diferenciable en $(c,d)$ tal que $h(c) = h(d)$, entonces existe $xi in (c,d)$ tal que $h'(xi) = 0$
]

Sabemos que $g$ tiene al menos $n+2$ puntos donde se anula. Si ordenamos $x_0, dots, x_n, macron(x)$ de menor a mayor, podemos aplicar el teorema de Roll en cada intervalo definido por dos puntos sucesivos. Entonces, podemos afirmar que $g'$ se anula en al menos un punto en cada intervalo. Por lo tanto podemos afirmar que $g'$ se anula en al menos $n+1$ puntos.

Siguiendo este mismo razonamiento sobre $g'$ podemos concluir que $g''$ se anula en al menos $n$ puntos, $g'''$ en al menos $n-1$ puntos y así sucesivamente hasta llegar a $g^(n+1)$ que se anula en al menos un punto. Este punto depende de los valores de $x_0, dots, x_n, macron(x)$ y se lo denotará como $xi(macron(x))$.

Calculemos la derivada de orden $n+1$ de $g$:
$
g^(n + 1)(t) = f^(n + 1)(t) - P^(n + 1)(t) - (f(macron(x)) - P(macron(x))) (product_(i=0)^n (t - x_i) / (macron(x) - x_i))^(n+1)
$

Sabemos que $P$ es un polinomio de grado menor o igual a $n$, por lo que $P^(n + 1)(t) = 0$. Además $(product_(i=0)^n (t - x_i) / (macron(x) - x_i))$ es un polinomio de grado $n+1$, por lo tanto la derivada de orden $n+1$ es igual al coeficiente que acompaña a la potencia de orden $n+1$ que es igual $(n-1)!product_(i=0)^n 1/(macron(x) - x_i)$. Luego:
$
g^(n + 1)(t) = f^(n+1)(t) - (f(macron(x)) - P(macron(x))) (n-1)!(product_(i=0)^n 1/(macron(x) - x_i))
$

Si ahora evaluamos esta expresión en $xi(macron(x))$ obtenemos que:
$
g^(n + 1)(t) &= 0 = f^(n+1)(xi(macron(x))) - (f(macron(x)) - P(macron(x))) (n-1)!(product_(i=0)^n 1/(macron(x) - x_i)) \
  \ &=> f^(n+1)(xi(macron(x))) = (f(macron(x)) - P(macron(x))) (n-1)!(product_(i=0)^n 1/(macron(x) - x_i)) 
  \ &=> (f^(n+1)(xi(macron(x)))) / (n+1)! = (f(macron(x)) - P(macron(x))) (product_(i=0)^n 1/(macron(x) - x_i))
  \ &=> (f^(n+1)(xi(macron(x)))) / (n+1)! product_(i=0)^n (macron(x) - x_i) = f(macron(x)) - P(macron(x))
  \ &=> (f^(n+1)(xi(macron(x)))) / (n+1)! product_(i=0)^n (macron(x) - x_i) + P(macron(x)) = f(macron(x))
$
Luegos llegamos a la expresión propuest al comienzo de esta sección $qed$



== Diferencias divididas
Si bien el polinomio que encontramos con el método de Lagrange es el único que interpola a los puntos dados, la forma que tenemos de armarlo no es la más eficiente. Además, si queremos agregar un punto más a la interpolación, debemos rehacer todo el cálculo.

Para evitar esto, se utiliza el método de las *diferencias divididas que nos permite conseguir el polinomio interpolador de manera recursiva*.

Definimos la secuencia de *diferencias divididas* como:

- *Orden 0*:
$
f[x_i] = f(x_i)
$

- *Orden 1*:
$
f[x_i, x_(i+1)] = (f[x_(i+1)] - f[x_i])/(x_(i+1) - x_i)
$

- *Orden k*:
$
f[x_i, x_(i+1), dots, x_(i+k)] = (f[x_(i+1), x_(i+2), dots, x_(i+k)] - f[x_i, x_(i+1), dots, x_(i+k-1)])/(x_(i+k) - x_i)
$

Entonces podemos escribir al polinomio interpolador $P(x)$ como:
$
P(x) = &f[x_0] + f[x_0, x_1] (x - x_0) + f[x_0, x_1, x_2] (x - x_0) (x - x_1) 
 \ &+ dots + f[x_0, x_1, dots, x_n] (x - x_0) (x - x_1) dots (x - x_(n-1))
$

*Supongamos ahora que queremos agregar un punto más a la interpolación*, es decir, queremos encontrar el polinomio interpolador que tambien tenga en cuenta al punto $(x_(n+1), y_(n+1))$. En este caso, *simplemente debemos calcular la diferencia dividida de orden $0$ a $n$ para $x_(n+1)$ y agregar el término correspondiente a $P(x)$*.

=== Demostración
Vamos a demostrar por inducción que el polinomio obtenido con diferencias divididas es el mismo polinomio que se obtiene con el método de Lagrange:

===== Caso base
Para $n=1$, el polinomio interpolador de Lagrange es:
$
P(x) &= f(x_0)(x - x_1)/(x_0 - x_1) + f(x_1)(x - x_0)/(x_1 - x_0)
  \ &= f(x_0)(x #blue[$- x_0 + x_0$] - x_1)/(x_0 - x_1) + f(x_1)(x - x_0)
  \ &= f(x_0) #blue[$(x_0 - x_1) + (x-x_0)$] / (x_0 - x_1) + f(x_1)(x - x_0)/(x_1 - x_0)
  \ &=  #blue[$f(x_0) underbrace((x_0 - x_1)/(x_0 - x_1), = 1)$] + #blue[$f(x_0) (x - x_0)/(x_0 - x_1)$] + f(x_1)(x - x_0)/(x_1 - x_0)
$
$
  P(x) &= #blue[$f(x_0)$] +  f(x_0) (x - x_0)/(x_0 - x_1) + f(x_1)(x - x_0)/(x_1 - x_0)
  \ &= f(x_0) + #blue[$(x - x_0)(f(x_0)/(x_0 - x_1) + f(x_1)/(x_1-x_0))$]
  \ &= f(x_0) + (x-x_0)(#blue[$(-f(x_0)) /(x_1 - x_0)$] + f(x_1)/(x_1-x_0))
  \ &= f(x_0) + (x-x_0)#blue[$(f(x_1) - f(x_0))/(x_1 - x_0)$]
  \ &= f(x_0) + (x-x_0)#blue[$f[x_0, x_1]$] #h(1em) qed
$

==== Caso inductivo
Sea $P_n (x)$ el polinomio interpolador  en los  puntos $x_0,...,x_n$, es decir, $P_n (x_i) = f(x_i)$ para $i=0,1,2,...,n$. 

*Hipotesis inductiva:* $
P_n (x) &= f[x_0] + f[x_0, x_1] (x - x_0) + f[x_0, x_1, x_2] (x - x_0) (x - x_1) 
\ &+ dots + f[x_0, x_1, dots, x_n] (x - x_0) (x - x_1) dots (x - x_(n-1))
$
#demoLine(withTitle: false)

*Queremos ver que:*

Si $P_(n+1) (x)$ el polinomio interpolador en los puntos $x_0,...,x_n, x_(n+1)$ entonces:
$
P_(n+1) = f[x_0] + dots + f[x_0, dots, x_n] (x - x_0) dots (x - x_(n-1)) + f[x_0, dots, x_(n+1)] (x - x_0) dots (x - x_n)
$
#demoLine(withTitle: false)

Definamos $
P(x) = P_n (x) + a (x - x_0)dots(x-x_n)
$
Entonces $P$ es un polinomio de grado de grado menor o igual a $n+1$ tal que $P(x_i) = f(x_i)$ para $i=0,1,2,...,n$. Debemos encontrar el valor de $a$ tal que $P(x_(n+1)) = f(x_(n+1))$ para poder considerarlo como el polinomio interpolador en los puntos $x_0,...,x_n, x_(n+1)$:

$
 P(x_(n+1)) = f(x_(n+1)) &<=> #blue[$P_n (x_(n+1)) + a (x_(n+1) - x_0) dots (x_(n+1) - x_n)$] = f(x_(n+1)) 
 \ &<=>  a (x_(n+1) - x_0) dots (x_(n+1) - x_n) = f(x_(n+1)) #blue[$- P_n (x_(n+1))$]
 \ &<=>  a = (f(x_(n+1)) - P_n (x_(n+1))) / #blue[$(x_(n+1) - x_0) dots (x_(n+1) - x_n)$]
$

Entonces $P_(n+1) = P$, si demostramos que $a = f[x_0, dots, x_(n+1)]$ habremos demostrado la propiedad.
#demoLine(withTitle: false)
Consideremos $Q_n (x)$ el polinomio interpolador de los puntos $x_1, dots, x_(n+1)$, por hipoteis inductiva: $
  Q_n (x) = f[x_1] + f[x_1, x_2] (x - x_1) + dots + f[x_1, dots, x_(n+1)] (x - x_1) dots (x - x_n)
$ 

Definamos $
  Q(x) = Q_n (x) + (x - x_(n+1)) / (x_(n+1) - x_0) (Q_n (x) - P_n (x)) 
$

Entonces $Q$ es un polinomio de grado menor o igual a $n+1$. Además:
-  $Q$ interpola a los puntos $x_1, dots, x_n$.
    $
    Q(x_i) = Q_n (x_i) + (x_i - x_(n+1)) / (x_(n+1) - x_0) underbrace((Q_n (x_i) - P_n (x_i)), =0) = f(x_i) #h(1em) forall i=1,2,...,n
    $

- $Q(x_(n+1)) = f(x_(n+1))$
  $
    Q(x_(n+1)) = Q_n (x_(n+1)) + underbrace((x_(n+1) - x_(n+1)) / (x_(n+1) - x_0), = 0) (Q_n (x_(n+1)) - P_n (x_(n+1))) = f(x_(n+1))
  $
- $Q(x_0) = P_n (x_0)$
  $
    Q(x_0) &= Q_n (x_0) + underbrace((x_0 - x_(n+1)) / (x_(n+1) - x_0), = -1) (Q_n (x_0) - P_n (x_0))
    \ & = Q_n (x_0) - (Q_n (x_0) - P_n (x_0)) = P_n (x_0) = f(x_0)
  $
#demoLine(withTitle: false)
Tanto $P$ como $Q$ son polinomios interpoladores de $x_0, dots, x_(n+1)$, osea que son el mismo polinomio (ya que el polinomio interpolador es único).

Queriamos demostrar que $a$ (el coeficiente que acompaña a la potencia de orden $n+1$ de $P$ es $f[x_1, dots, x_n+1]$

El coeficiente $c_((n, Q))$ que acompaña a la potencia $n+1$ de $Q$ es el coeficiente que acompaña a la potencia $n$ de $Q_n$ es:
$
a = c_((n, Q)) = (c_((n, Q_n)) - c_((n, P_n)) )/(x_(n+1) - x_0)
$

Pero, por hipotesis inductiva: $c_((n, Q_n)) = f[x_1, dots, x_(n+1)]$ y $c_((n, P_n)) = f[x_0, dots, x_n]$. Entonces:

$
a = (f[x_1, dots, x_(n+1)] - f[x_0, dots, x_n])/(x_(n+1) - x_0) = f[x_0, dots, x_(n+1)] #h(1em) qed
$

== Interpolación de Neville
Sean $f: [a,b] -> RR$ y $(x_i, f(x_i))$ un conjunto de pares ordenados tal que $x_i in [a,b]$ para $i=0,dots,n$. Sabemos que existe un único polinomio $P$ de grado menor o igual a $n$ tal que $P(x_i) = f(x_i)$ para $i=0,dots,n$. 

Buscamos una forma de calcular $P(x)$ en función de dos polinomios que interpolan en un punto menos que nos permita calcular $P$ de manera recursiva.

#corolario(title:"Notación")[
  Vamos a notar $P_(m_1 m_2 dots m_k)$ al polinomio interpolador en los puntos $x_(m_1)$, $x_(m_2)$, ..., $x_(m_k) in [a,b]$.
]

#propiedad[
  Dados $x_0, dots, x_k in [a,b]$ e $i,j in {0, dots, k}$. Si $P_(01 dots (j-1) (j+1) dots k)$ es el polinomio que interpola todos los puntos salvo $x_i$ y $P_(0 dots (i-1) (i+1) dots k)$ es el polinomio que interpola todos los puntos salvo $x_j$, entonces el polinomio interpolador $P_(01 dots k)$ puede expresarse como:
  $
    P_(01 dots k)(x) = ((x-x_j)P_(01 dots (j-1) (j+1) dots k)(x) - (x-x_i)P_(0 dots (i-1) (i+1) dots k)(x)) / (x_i - x_j) 
  $

  #demoLine()
  Tenemos que ver que $P_(01 dots k)(x_i) = f(x_i)$ para $i=0,1,2,...,n$.

  Sea $x_r$ con $r in {0, dots, k}$, entonces:
  - *Si $r != i,j$:*
    $
    P(x_r) &= ((#blue[$x_r$]-x_j)P_(01 dots (j-1) (j+1) dots k)(#blue[$x_r$]) - (#blue[$x_r$]-x_i)P_(0 dots (i-1) (i+1) dots k)(#blue[$x_r$])) / (x_i - x_j) 
    \ &= ((x_r - x_j) #blue[$f(x_r)$] - (x_r - x_i) #blue[$f(x_r)$]) / (x_i - x_j) 
    \ &= (#blue[$f(x_r)(x_r - x_j - x_r + x_i)$]) / (x_i - x_j) 
    \ &= f(x_r)(x_i - x_j)/(x_i - x_j) 
    \ &= f(x_r) 
    $
  - *Si $r = i$:*
    $
    P(x_i) &= ((#blue[$x_i$]-x_j)P_(01 dots (j-1) (j+1) dots k)(#blue[$x_i$]) - (#blue[$x_i$]-x_i)P_(0 dots (i-1) (i+1) dots k)(#blue[$x_i$])) / (x_i - x_j)
    \ &= ((x_i - x_j) P_(01 dots (j-1) (j+1) dots k)(x_i)) / (x_i - x_j)
    \ &= (x_j - x_i) P_(01 dots (i-1) (i+1) dots k)(x_i)) / (x_i - x_j)
    \ &= f(x_i)
    $
  - *Si $r = j$:*
    $
    P(x_j) &= ((#blue[$x_j$]-x_j)P_(01 dots (j-1) (j+1) dots k)(#blue[$x_j$]) - (#blue[$x_j$]-x_i)P_(0 dots (i-1) (i+1) dots k)(#blue[$x_j$])) / (x_i - x_j)
    \ &= ((x_j - x_i) P_(0 dots (i-1) (i+1) dots k)(x_j)) / (x_i - x_j)
    \ &= P_(0 dots (i-1) (i+1) dots k)(x_j)
    \ &= f(x_j)
    $

Luego $P = P_(0,dots,k) #h(1em) qed$ 
]

Definimos ahora el polinomio $Q_(i j)$ $(i >= j)$ como el polinomio que interpola en los puntos $x_(i-j)$ hasta el punto $x_i$ como:
$
Q_(i j) (x)= P_(i-j dots i) (x) = ((x-x_(i-j)) Q_(i j-1) - (x-x_i) Q_(i-1 j-1)) / (x_i - x_(i-j))
$

Entonces:
$
P_(0, dots, n) = Q_(n n) = ((x - x_0) Q_(n n-1) - (x - x_n) Q_(n-1 n-1)) / (x_n - x_0)
$

Y para calcularlo podemos armar el siguiente arbol de recursión:

#align(center)[
  #grid(columns: 6, rows: 9, gutter: 1em,
    [$x_0$],[$f(x_0) = Q_(00)(x)$],[],            [],           [],           [],
    [],     [],                    [$Q_(11)(x)$], [],           [],           [],
    [$x_1$],[$f(x_1) = Q_(10)(x)$],[],            [$Q_(22)(x)$],[],           [],
    [],     [],                    [$Q_(21)(x)$], [],           [$Q_(33)(x)$],[],
    [$x_2$],[$f(x_2) = Q_(20)(x)$],[],            [$Q_(32)(x)$],[],           [$Q_(44)(x)$],
    [],     [],                    [$Q_(31)(x)$], [],           [$Q_(33)(x)$],[],
    [$x_3$],[$f(x_3) = Q_(30)(x)$],[],            [$Q_(42)(x)$],[],           [],
    [],     [],                    [$Q_(41)(x)$], [],           [],           [],
    [$x_4$],[$f(x_4) = Q_(40)(x)$],[],            [],           [],           []
  )
]	

== Interpolación segmentaria
=== Interpolación lineal segmentaria
Sean $(x_i, y_i)$ con $x_i < x_(i+1)$ para $i=0,1,2,...,n$. Por cada par de puntos $(x_i, y_i)$ y $(x_(i+1), y_(i+1))$ para $i=0,1,2,...,n-1$, realizamos una interpolación lineal:
$
L_i(x) = a_i x + b_i
$

Entonces por cada $x_i$, tenemos dos incognitas $a_i$ y $b_i$ y dos ecuaciones:

$
L_i (x_i) = y_i \
L_i (x_(i+1)) = y_(i+1)
$

Entonces tenemos un sistema de $2n$ ecuaciones con $2n$ incognitas en la que cada $L_i$ queda univocamente determinado.

=== Interpolación cuadrática segmentaria
Sean $(x_i, y_i)$ con $x_i < x_(i+1)$ para $i=0,1,2,...,n$. Por cada par de puntos $(x_i, y_i)$ y $(x_(i+1), y_(i+1))$ para $i=0,1,2,...,n-1$, realizamos una interpolación cuadrática:
$
Q_i = a_i + b_i (x - x_i) + c_i (x - x_i)^2
$

Entonces por cada $x_i$, tenemos tres incognitas $a_i$, $b_i$ y $c_i$ y dos ecuaciones:
$
Q_i (x_i) = y_i \
Q_i (x_(i+1)) = y_(i+1)
$

Además podemos pedir que la función  derivada de $Q_i$ en $x_(i+1)$ sea igual a la derivada de $Q_(i+1)$ en $x_(i+1)$, es decir:
$
Q'_i (x_(i+1)) = Q'_(i+1) (x_(i+1)) " para " i=0,1,2,...,n-2
$

Tenemos un sistema de $2n + n - 1$ ecuaciones con $3n$ incognitas, nos falta una ecuación para poder terminar de definir el sistema. La condición que agreamos, en general, se utiliza para controlar el comportamiento de la derivada en alguno de los extremos ($x_0$ o $x?n$). Sin embargo, esto resulta en una solución asímetrica ya que es imposible pedir condiciones simulteáneas en ambos extremo y mantener la certeza de que el sistema resultante sea compatible.

=== Interpolación cúbica segmentaria
Sean $(x_i, y_i)$ con $x_i < x_(i+1)$ para $i=0,1,2,...,n$. Por cada par de puntos $(x_i, y_i)$ y $(x_(i+1), y_(i+1))$ para $i=0,1,2,...,n-1$, realizamos una interpolación cúbica:
$
S_i (x) = a_i + b_i (x - x_i) + c_i (x - x_i)^2 + d_i (x - x_i)^3
$

Luego la interpolacion $S(x) = S_i(x)$ para $x in [x_i, x_(i+1)]$

Por cada $x_i$, tenemos cuatro incognitas $a_i$, $b_i$, $c_i$ y $d_i$ y las siguientes ecuaciones:

- $S_i (x_i) = y_i$

- $S_i (x_(i+1)) = y_(i+1)$

- $S'_i (x_(i+1)) = S'_(i+1) (x_(i+1)) " para " i=0,1,2,...,n-1$

- $S''_i (x_(i+1)) = S''_(i+1) (x_(i+1)) " para " i=0,1,2,...,n-1$

Tenemos un sistema de $4n$ incognitas con $2n + n - 1 + n - 1 = 4n - 2$ ecuaciones, nos falta dos condiciones:

- *Frontera sujeta*: $S''_0 (x_0) = f''(x_0)$ y $S''_n (x_n) = f''(x_n)$
- *Frontera natural*: $S''_0 (x_0) = 0$ y $S''_n (x_n) = 0$

En ambos casos, el sistema resultante es tridiagonal y estrictamente diagonal dominante, por lo que es posible resolverlo de manera eficiente y tiene solución única.

==== Demostración
Vamos a demostrar que siempre existe una función que cumple las condiciones impuestas por el sistema de ecuaciones, vamos a escribir en rojo, las incognitas:

Tomemos la primer condición $S_i (x_i) = y_i$ entonces:
$
S_i (x_i) = #red[$a_i$] + #red[$b_i$] (x_i - x_i) + #red[$c_i$] (x_i - x_i)^2 + #red[$d_i$] (x_i - x_i)^3 = #red[$a_i$] = y_i " para " i=0,1,2,...,n-1
$

$
S(x_n) = S_(n-1)(x) &= overbrace(a_(n-1), = f(x_(n-1))) + #red[$b_(n-1)$] (x_n - x_(n-1)) + #red[$c_(n-1)$] (x_n - x_(n-1))^2 + #red[$d_(n-1)$] (x_n - x_(n-1))^3
\  &= y_(n-1) + #red[$b_(n-1)$] (x_n - x_(n-1)) + #red[$c_(n-1)$] (x_n - x_(n-1))^2 + #red[$d_(n-1)$] (x_n - x_(n-1))^3 = f(x_n) 
\ &=> #red[$b_(n-1)$] (x_n - x_(n-1)) + #red[$c_(n-1)$] (x_n - x_(n-1))^2 + #red[$d_(n-1)$] (x_n - x_(n-1))^3 = y_n - y_(n-1)
$

De la segunda condición $S_i (x_(i+1)) = S_(i+1) (x_(i+1))$ para $i=0,1,2,...,n-2$:
$
S_i &(x_(i+1)) = S_(i+1) (x_(i+1))  
\ &=> a_i + #red[$b_i$] (x_(i+1) - x_i) + #red[$c_i$] (x_(i+1) - x_i)^2 + #red[$d_i$] (x_(i+1) - x_i)^3 \ &#h(2em)= a_(i+1) + #red[$b_(i+1)$] (x_(i+1) - x_(i+1)) + #red[$c_(i+1)$] (x_(i+1) - x_(i+1))^2 + #red[$d_(i+1)$] (x_(i+1) - x_(i+1))^3
\ &=> a_i + #red[$b_i$] (x_(i+1) - x_i) + #red[$c_i$] (x_(i+1) - x_i)^2 + #red[$d_i$] (x_(i+1) - x_i)^3 = a_(i+1)
\ &=> y_i + #red[$b_i$] (x_(i+1) - x_i) + #red[$c_i$] (x_(i+1) - x_i)^2 + #red[$d_i$] (x_(i+1) - x_i)^3 = y_(i+1)
$

De la tercera condición $S'_i (x_(i+1)) = S'_(i+1) (x_(i+1))$ para $i=0,1,2,...,n-2$:
$
S'_i (x_(i+1)) &= S'_(i+1) (x_(i+1))
\ => #red[$b_i$] + 2 #red[$c_i$] (x_(i+1) - x_i) + 3 #red[$d_i$] (x_(i+1) - x_i)^2 &= #red[$b_(i+1)$] + 2 #red[$c_(i+1)$] (x_(i+1) - x_(i+1)) + 3 #red[$d_(i+1)$] (x_(i+1) - x_(i+1))^2
\ => #red[$b_i$] + 2 #red[$c_i$] (x_(i+1) - x_i) + 3 #red[$d_i$] (x_(i+1) - x_i)^2 &= #red[$b_(i+1)$]
$

De la cuarta condición $S''_i (x_(i+1)) = S''_(i+1) (x_(i+1))$ para $i=0,1,2,...,n-2$:
$
S''_i &(x_(i+1)) = S''_(i+1) (x_(i+1)) 
\ &=> 2 #red[$c_i$] + 6 #red[$d_i$] (x_(i+1) - x_i) = 2 #red[$c_(i+1)$] + 6 #red[$d_(i+1)$] (x_(i+1) - x_(i+1))
\ &=> 2 #red[$c_i$] + 6 #red[$d_i$] (x_(i+1) - x_i) = 2 #red[$c_(i+1)$]
$

De la última condición $S''_0 (x_0) = 0$ y $S''_n (x_n) = 0$:
$
S''_0 (x_0) = 2 #red[$c_0$] = 0 \
S''_(n-1) (x_n) = 2 #red[$c_(n-1)$] + 6 #red[$d_(n-1)$] (x_n - x_(n-1)) = 0
$

Resumiendo, nos quedaron las siguientes ecuaciones:

+ $a_i = y_i$ para $i=0,1,2,...,n-1$

+ $#red[$b_(n-1)$] (x_n - x_(n-1)) + #red[$c_(n-1)$] (x_n - x_(n-1))^2 + #red[$d_(n-1)$] (x_n - x_(n-1))^3 = y_n - y_(n-1)$	

+ $y_i + #red[$b_i$] (x_(i+1) - x_i) + #red[$c_i$] (x_(i+1) - x_i)^2 + #red[$d_i$] (x_(i+1) - x_i)^3 = y_(i+1)$ para $i=0,1,2,...,n-1$

+ $#red[$b_i$] + 2 #red[$c_i$] (x_(i+1) - x_i) + 3 #red[$d_i$] (x_(i+1) - x_i)^2 = #red[$b_(i+1)$]$ para $i=0,1,2,...,n-2$

+ $2 #red[$c_i$] + 6 #red[$d_i$] (x_(i+1) - x_i) = 2 #red[$c_(i+1)$]$ para $i=0,1,2,...,n-2$

+ $c_0 = 0$

+ $2 #red[$c_(n-1)$] + 6 #red[$d_(n-1)$] (x_n - x_(n-1)) = 0$

Nombremos $h_i = x_i - x_(i-1)$, entonces:

De (7) podemos despejar 
$
  d_(n-1) = -#red[$c_(n-1)$] / (3 h_n)
$

De (2) podemos despejar:
$
  b_(n-1) &= (y_n - y_(n-1) - c_(n-1) h_n^2 - d_(n-1) h_n^3) / h_n 
  \ &= (y_n - y_(n-1) - c_(n-1) h_n^2 + c_(n-1) h_n^2 + c_(n-1) h_n^3/(3 h_n)) / h_n 
  \ &= (y_n - y_(n-1))/h_n - 2/3 #red[$c_(n-1)$] h_n
$

De (5) podemos despejar:
$
d_i = (2 #red[$c_(i+1)$] - 2 #red[$c_i$]) / (6 h_i) " para " i=0, dots, n-2
$

De (3) podemos despejar:
$
b_i &= (y_(i+1) - y_i - #red[$c_i$] h_(i+1)^2 - #red[$d_i$] h_(i+1)^3) / h_(i+1) " para " i=0, dots, n-2 
\ &= (y_(i+1) - y_i - #red[$c_i$] h_(i+1)^2 + (2 #red[$c_(i+1)$] - 2 #red[$c_i$])/ (6 h_i) h_(i+1)^3) / h_(i+1) 
\ &= (y_(i+1) - y_i)/h_(i+1) - 2/3 #red[$c_i$] h_(i+1) - #red[$c_(i+1)$]/3 h_(i+1) 
$

Finalmente, usamos (4) remplazando los valores despejados:
$
  b_i + 2 #red[$c_i$] h_(i+1) + 3#red[$d_i$]h_(i+1)^2 = b_(i+1) " para " i=0, dots, n-2 \
  (y_(i+1) - y_i)/h_(i+1) - 2/3 #red[$c_i$] h_(i+1) - #red[$c_(i+1)$]/3 h_(i+1) + 2 #red[$c_i$] h_(i+1) + 3 h_(i+1) (2 #red[$c_(i+1)$] - 2 #red[$c_i$]) / (6 h_i) = (y_(i+2) - y_(i+1)) / h_(i+2) - (y_(i+1) - y_i) / h_(i+1)
  $
  $
  c_i (-2/3 h_i + 2 h_(i+1) - h_(i+1)) + c_(i+1) (-1/3 h_(i+1) + h_(i+1) + 2/3 h_(i+2)) + c_(i+2) (1/3 h_(i+2)) = (y_(i+2) - y_(i+1)) / h_(i+2) - (y_(i+1) - y_i) / h_(i+1) \
  c_i/3 h_(i+1) + 2 c_(i+1)/3 (h_(i+1) + h_(i+2)) + c_(i+2)/3 h_(i+2) = (y_(i+2) - y_(i+1)) / h_(i+2) - (y_(i+1) - y_i) / h_(i+1) \
$

Nos queda el caso $i = n-2$:
$
b_(n-2) + 2 #red[$c_(n-2)$] h_(n-1) + 3#red[$d_(n-2)$]h_(n-1)^2 = b_(n-1) \
(y_(n-1) - y_(n-2))/h_(n-1) - 2/3 #red[$c_(n-2)$] h_(n-1) - #red[$c_(n-1)$]/3 h_(n-1) + 2 #red[$c_(n-2)$] h_(n-1) + 3 h_(n-1)^2 (2 #red[$c_(n-1)$] - 2 #red[$c_(n-2)$]) / (6 h_(n-2)) = (y_n - y_(n-1)) / h_n - 2/3 #red[$c_(n-1)$] h_n \
c_(n-2)(-2/3 h_(n-1) + 2 h_(n-1) - h_(n-1)) + c_(n-1)(-1/3 h_(n-1) + h_(n-1) + 2/3 h_n) = (y_n - y_(n-1)) / h_n - (y_(n-1) - y_(n-2)) / h_(n-1) \
c_(n-2)/3 h_(n-1) + 2 c_(n-1)/3 (h_(n-1) + h_n) = (y_n - y_(n-1)) / h_n - (y_(n-1) - y_(n-2)) / h_(n-1) \
$

Luego la matriz asociada al sistema es:
$
mat(
  c_0, c_1, c_2, c_3, dots, c_(i), c_(i+1), c_(i+2), dots, c_(n-2), c_(n-1);
  1, 0, 0, 0, dots, 0, 0, 0, dots, 0, 0;
  1/3 h_1, 2/3 (h_1 + h_2), 1/3 h_2, 0, dots, 0, 0, 0, dots, 0, 0;
  0, 1/3 h_2, 2/3 (h_2 + h_3), 1/3 h_3, dots, 0, 0, 0, dots, 0, 0;
  dots.v, dots.v, dots.v, dots.v, dots, dots.v, dots.v, dots.v, dots, dots.v, dots.v;
  0, 0, 0, 0, dots, 1/3 h_(i+1), 2/3 (h_(i+1) + h_(i+2)), 1/3 h_(i+2), dots, 0, 0;
  dots.v , dots.v, dots.v, dots.v, dots, dots.v, dots.v, dots.v, dots, dots.v, dots.v;
  0, 0, 0, 0, dots, 0, 0, 0, dots, 1/3 h_(n-1), 2/3 (h_(n-1) + h_n)

)
$

Que resulta ser estrictamente diagonal dominante, por lo que existe una solución y es única. Al obtener todos los $c_i$ podemos calcular el resto de las incognitas que quedaron expresadas en función de estos coeficientes.