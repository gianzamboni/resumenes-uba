#import "theme.typ": *

#show: project.with(
  title: "Apuntes Metnum",
  authors: (
    "Gian",
  ),
  date: "October 8, 2023",
)

#outline(depth: 3, indent: 10pt)

#include "sections/01-algebra-lineal.typ"
#include "sections/02-sistemas-ecuaciones.typ"
#include "sections/03-factorizacion-LU.typ"
#include "sections/04-normas.typ"
#include "sections/05-matrices-sdp.typ"
#include "sections/06-factorizacion-qr.typ"
#include "sections/07-factorizacion-svd.typ"

//= Aritmética de la computadora
// Representación de números. Error de redondeo y truncamiento. Error relativo y absoluto. Operaciones aritméticas. Algoritmos. Estabilidad y convergencia.
// = Elementos de álgebra lineal
// Se repasan nociones de espacios vectoriales y subespacios. Sistemas de generadores. In
// Transformaciones lineales, definiciones, ejemplos, propiedades básicas, núcleo e imagen. Ortogonalidad. Introducción a la norma vectorial, desigualdad de CBS. Introducción a la diagonalización y autovalores.

// = Algoritmos para resolver ecuaciones no lineales en una variable
// Método de la bisección, iteraciones de punto fijo, método de Newton, método de la secante y regula falsi. Comparación, análisis de convergencia e implementación.

// = Resolución de sistemas lineales
// Sistemas triangulares, matrices elementales, eliminación gaussiana, factorización LU, estrategias de pivoteo, análisis del error y noción de la complejidad del problema. Introducción a las normas matriciales. Definiciones y propiedades, número de condición de una matriz.

// = Matrices especiales
// Matrices simétricas, banda, definidas positivas, definiciones y propiedades.

// = Factorización de Cholesky, QR y SVD
// Existencia y propiedades de las factorizaciones. Rotaciones de Givens y transformaciones de Householder.

// = Algoritmos iterativos para resolver sistemas lineales
// Método de Jacobi, Gauss- Seidel, gradiente conjugado

// = Algoritmos para el cálculo de autovalores
// Método de la potencia. Análisis de convergencia, aplicaciones e implementación.

// = Cuadrados mínimos lineales
// Motivación y data fitting. Fundamentos teóricos, definiciones y propiedades. Método de ecucaciones normales. Cuadrados mínimos y QR. Implementación y aplicaciones.

// = Interpolación e integración numérica
// Motivación y comparación con CML. Interpolación polinomial, Lagrange, diferencias divididas, Splines. Propiedades y aplicaciones.
// Metodos de integración basados en interpolación. Análisis del error, y aplicaciones.
 
// = Temas adicionales
// Los siguientes temas no son profundizados en la materia, y si bien no se tienen en cuenta en la evalucación del curso, están intrinsecamente relacionados. Durante el curso se hará una mención o breve introducción a ellos cuando sea necesario, y se recomiendan como lectura posterior al curso.

// Optimización
// Sistemas de inecuaciones lineales
// Programación lineal
// Método de simplex
// Aplicaciones del método de Montecarlo

= Bibliografía 

== Videos de clases
- #link("https://drive.google.com/file/d/1NpsBVYeWPQvfZaQeELAvJ9MIvuloGsVj/view")[Algebra Lineal]
- #link("https://drive.google.com/file/d/1WTBOduVXbefT041dLqre-DXPcWzsy4UY/view")[Sistemas Lineales]

- #link("https://drive.google.com/file/d/1UYNkBfrWhLYKllD0fMLoADFvosKushLd/view")[Factorización LU]

- #link("https://drive.google.com/file/d/1XD-Smq7hOaHVJiIyILeGm03dgdmxjpvf/view")[Normas y error]

- #link("https://drive.google.com/file/d/1jK_1N9qHkMK-mQugAVG6Tp8IjK_qV3J6/view")[Factorización SDP]

- #link("https://drive.google.com/file/d/1jBYFlPcOcGbUvtf_yRrVzkhl9lR-nbyn/view")[Factorización QR]

- #link("https://drive.google.com/file/d/1XVfj6KMoLKzAkV3p7sIox46bKhbliRxY/view")[Autovalores]

- #link("https://drive.google.com/file/d/18sPCFMjanWoGL0FlQzmPtFl84Xcbi19a/view")[Factorización SVD]

- #link("https://drive.google.com/file/d/1DlJCYjoP-prLuxoYWsKWVjzgYTnrJ1Bj/view")[Métodos Iterativos]

- #link("https://drive.google.com/file/d/1xS_udl71HL-rEhEZwgQ-lEdiqLqY-QfT/view")[Cuadrados Mínimos Lineales]

- #link("https://drive.google.com/file/d/1NMubKFUe_1gKM9RNwHcpAkHo0la6D9x7/view")[Interpolación]

== Enlaces 
- #link("https://www.cubawiki.com.ar/index.php/M%C3%A9todos_Num%C3%A9ricos")[Métodos Numéricos, CubaWiki]

== Libros
  - R. Burden y J.D.Faires, *Análisis numérico*, International Thomson Editors, 2002.
  - V. Chvatal, *Linear programming*, Freeman, 1983.
  - G. Dahlquist, A. Bjorck, *Numerical methods*, Dover, 2003.
  - J. Demmel, *Applied Numerical Linear Algebra*, SIAM,1997.
  - J. Dennis y J. More, *Numerical methods for unconstrained optimization and nonlinear equations*, Prentice- Hall, 1983.
  - P. Gill, W. Murray and M. Wright, *Numerical Linear Algebra and Optimization* , Addison Wesley, 1991.
  - G. H. Golub, *Matrix Computations*, Charles F. Van Loan,JHU Press, 2013.
  - G. Jerónimo, J. Sabia, S. Tesauri, *Algebra lineal*, Depto de Matemática, FCEN -  UBA, 2008.
  - M. Heath, *Scientific computing: an introductory survey, Philosophical Transactions*. Series A, Mathematical, Physical, and Engineering Sciences, 2002
  - N. Higham, *Accuracy and Stability of Numerical Algorithms*, SIAM, 2002.
  - K. Hoffman y R. Kunze, *Algebra lineal*, Prentice- Hall, 1977.
  - R. Horn and C. Johnson, *Matrix Analysis*, Cambridge University Press, 2012.
  - E. Isaacson and H. Keller, *Analysis of Numerical Methods*, Dover Publications, 1994.
  - D. Kincaid y W. Cheney, *Análisis numérico*, Addison Wesley Iberoamericana, 1994.
  - B. Kernighan y R. Pike, *The Practice of Programming*, Addison Wesley, 1999.

  - C. Meyer, *Matrix analysis and applied linear algebra*, SIAM, 2010.
  - P. J. Olver, C. Shakiban, *Applied Linear Algebra*, Second Edition, Springer International Publishing, 2018.
  - T. Sauer, *Numerical Analysis*, Pearson, 3rd Edition, 2017.
  - G. Stewart, *Introduction to matrix computations*, Academic Press, 1973.
  
  - G. Strang, *Algebra lineal y sus aplicaciones*, Ediciones Paraninfo, 4ta ed., 2007.
  - E. Süli, David F.Mayers, *An Introduction to Numerical Analysis*, Cambridge University Press, 2003.+
  - L. N. Trefethen, *Numerical Linear Algebra*, SIAM, 1997.
  - R. Varga, *Matrix Iterative Analysis*, Springer, 2000.
  
  - D. Watkins, *Fundamentals of matrix computations*, John Wiley & Sons, 2010