#import "../theme.typ": *
= Factorización de Cholesky

== Matrices Simétricas Definidas Positivas

Sea $A in R^{n times n}$ una matriz cuadrada, se dice que es *simétrica definida positiva (SDP)*  si:

- $A = A^T$ (es simétrica)
- $x^T A x > 0$ para todo $x in R^n$ con $x != 0$ (es definida positiva)

#propiedad[
  Si $A$ es SDP, entonces *$A$ es no singular*.

  #demoLine()
  Supongamos que $A$ es SDP y singular. Entonces existe $x != 0 in RR^n$ tal que $A x = 0$. Entonces $x^T A x = 0$ lo cual es absurdo pues contradice la definición de SDP $qed$
]

#propiedad[
Si $A$ es SDP, entonces *$a_(i i) > 0$* para todo $i = 1, 2, dots, n$.

#demoLine()
Sea $e_i$ el $i-$ésimo vector canónico. Entonces $e_i^T A e_i = a_(i i) > 0$ pues $A$ es SDP $qed$
]

#propiedad[
  Si $A$ es SDP, *todas sus submatrices principales son SDP*.

  #demoLine()
  Sea $A^((k))$ la submatriz principal de $A$ de orden $k$. Tenemos que ver que cumple con las dos condiciones de SDP:

  - $A^((k)) = (A^((k)))^T$

    $ a^((k))_(i j) = a_(i j) = a_(j i) = (a^((k))_(j i)) $

  - $x^T A^((k)) x > 0$ para todo $x in R^k$ con $x != 0$

    Supongamos que esto no sucede, entonces existe $macron(x) != 0 in R^k$ tal que $macron(x)^T A^((k)) macron(x) = 0$. Armemos un vector $x in R^n$ tal que $x = (macron(x), 0, dots, 0)$. Entonces:

    $ 
      x^T A x &= 
      mat( macron(x)^t, 0, dots, 0 ) 
      mat( 
        A^((k)), *, dots, *;
        *, *, dots, *;
        dots.v, dots.v, dots, dots.v;
        *, *, dots, *;
      ) 
      mat( macron(x); 0; dots.v; 0) \ &= 
      mat( macron(x)^t, 0, dots, 0 ) 
      mat( 
        A^((k)) macron(x); 
        *; dots.v; *
      ) =  x^t A^((k)) x <= 0
    $

    Entonces $x^t A x <= 0$, lo cual es absurdo pued $A$ era una matriz SDP.
  
  Entonces $A^((k))$ cumple con ambas condiciones y es SDP $qed$
]

#propiedad[
  $A$ es SDP $<=>$ *$forall B in R^(n times n)$ no singular vale que $B^T A B$ es SDP*.

  #demoLine()
  Supongamos que $A$ es SDP. Entonces tenemos que ver que $B^T A B$ cumple las condiciones de SDP:

  - $B^T A B = (B^T A B)^T$

    $
     (B^T A B)^t = ((B^T A) B)^T = B^T (B^T A)^T = B^T A^T B
    $
    Como $A^T = A$, queda:
    $
     (B^T A B)^t = B^T A^T B = B^T A B
    $
  
  - $x^T B^T A B x > 0$ para todo $x in R^n$ con $x != 0$

    Sea $x != 0 in RR^n$, entonces:

    $
      x^T B^T A B x = (B x)^T A (B x)
    $

    Si nombramos $y = B x$, entonces $y != 0$ pues $B$ es no singular y $x != 0$. Entonces resulta $x^T B^T A B x = y^T A y > 0$ pues $A$ es SDP.
    
  Luego $B^T A B$ es SDP $qed$
]

#propiedad[
  Si $A$ es SDP, entonces la submatriz conformada por las filas $2$ a $n$ y las columnas $2$ a $n$ despues del primer paso de la eliminación gaussiana es SDP.

  
  #demoLine()
  Sea $M_1$ la matriz asociada al primer paso de la eliminación gaussiana y $tilde(A) in RR^(n-1 times n-1)$ conformada por las filas $2$ a $n$ y las columnas $2$ a $n$ de $M_1 A$.

  Realicemos el producto $M_1 A M^T_1$:

  $
    M_1 A M^T_1 &= 
    mat( 
      1, 0, dots, 0;
      - a_(2 1) / a_(1 1), 1, dots, 0;
      dots.v, dots.v, dots.down, dots.v;
      - a_(n 1) / a_(1 1), 0, dots, 1;
    ) A mat(
      1, - a_(2 1) / a_(1 1), dots, - a_(n 1) / a_(1 1);
      0, 1, dots, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots, 1;
    ) \
    &= mat(
      a_(1 1), a_(1 2), dots, a_(1 n);
      0, , tilde(A), ;
    ) mat(
      1, - a_(2 1) / a_(1 1), dots, - a_(n 1) / a_(1 1);
      0, 1, dots, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots, 1;
    ) \
    &= mat(
      a_(1 1), 0;
      0, tilde(A);
    )
  $

  Por la propiedad anterior, podemos afirmar que $M_1 A M^T_1$ es SDP. Entonces $tilde(A)$ es SDP
]

#pagebreak()
#corolario[
  Si $A$ es SDP, entonces *tiene factorización LU*.
]

#corolario[
  Si $A$ es SDP, entonces se puede aplicar el *método de eliminación gaussiana sin pivoteo*.
]


== Factorización de Cholesky
Sea *$A in R^{n times n}$ una matriz SDP*. Entonces existe una única *matriz triangular inferior $L$ tal que $A = L L^T$*.    

=== Demostración
Sea $A in R^{n times n}$ una matriz SDP. Entonces $A$ tiene factorización LU 
$ A = L U => A^t = (L U)^t = U^t L^t $

Además como es SDP, $A^t = A => U^t L^t = L U$

Como $L$ es triangular inferior con 1s en la diagonal y $L^t$ es triangular superior con 1s en la diagonal, ambas son inversibles. Entonces:

$ L U = U^t L^t => #blue[$L^(-1)$]L U =  #blue[$L^(-1)$] U^t L^t => U = L^(-1) U^t L^t \
=> U#blue[$(L^t)^(-1)$] = L^(-1) U^t L^t #blue[$(L^t)^(-1)$] \ => U (L^t)^(-1) = L^(-1) U^t 
$

$U (L^t)^(-1)$ es triangular superior pues ambas matrices son triangulares superiores. Además $L^(-1) U^t$ es triangular inferior pues ambas matrices son triangulares inferiores. Por lo tanto, la igualdad a la que llegamos solo se puede dar si ambas matrices son diagonales:

$ U (L^t)^(-1) = L^(-1) U^t = D " matriz diagonal" $

Además, podemos escribir $U$ como:

$ U = D L^t $

Entonces $A = L U = L D L^t$

Sea ahora $x != 0$ tal que $L^t x = e_i$. Entonces:

$ 
0 < x^t A x = x^t L D L^t x = (L^t x)^t D (L^t x) = e_i^t D e_i = d_(i i)
$

Esto implica que todos los elementos de la diagonal son distintos de cero, por lo tanto $D$ es no singular. Además: $ D = sqrt(D)sqrt(D) $ donde $sqrt(D)$ es la matriz diagonal con la raíz cuadrada de los elementos de $D$ en la diagonal. Entonces:

$ A = L D L^t = L sqrt(D) sqrt(D) L^t = (L sqrt(D)) (L sqrt(D))^t = tilde(L) tilde(L)^t $

=== Algoritmo
El algoritmo para calcular la factorización de Cholesky es el siguiente:

Si $l_(i j)$ son los elementos de $L$ y $a_(i j)$ son los elementos de $A$, entonces:

#pseudo(title:"Cholesky", parameters:([$A$: Matriz], ))[
  $l_(1 1) = sqrt(a_(1 1))$
  Para $j <- 2$ a $n$ hacer #i\
    $l_(j 1) = a_(j 1) / l_(1 1)$
    Para $i <- 2$ a $n-1$ hacer #i\
      $ l_(i i) = sqrt(a_(i i) - sum_(k=1)^(i-1) l_(i k)^2) $ \
      Para $j <- i+1$ a $n$ hacer #i\
        $ l_(j i) = (a_(j i) - sum_(k=1)^(i-1) l_(j k) l_(i k)) / l_(i i) $ #d\
      Fin #d \
      $ l_(n n) = sqrt(a_(n n) - sum_(k=1)^(n-1) l_(n k)^2) $ #d\
  Fin
]