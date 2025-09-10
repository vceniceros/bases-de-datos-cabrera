# normalizacion

darle normas a algo, al diseñar una bdd hacemos un esquema, lo mas importante al cambiar un diseño es preservar los datos, tiene que ver con el modelo relacional (parte del modelo relacional),que un atributo se repita genera 2 problemas, uno, modificar una tupla es costoso, segundo es riesgoso

## disclaimer

en la calle no hay modelo entida-relacion, normalmente se va derecho a la relacion.

## descomposicion

consiste en desarmar una tabla grande en trablas mas chicas (cuando hablamos de tamaño hablamos de la cantidad de atributos no de tuplas)

## dependencia funcional

es una relacion entre 2 conjuntos de atributos, significa que un conjunto de atributos depende otro para funcionar (en el ejemplo del profe dni -> apellido, ya que en la tabla dni implica apellido) una atributo implica al otro cuando si yo agarro la tupla y me la llevo a otra relacion la prescencia de un atributo implica al otro (osea cuando el implicante es igual el implicado tambien), ejemplo si yo tengo un dni con un apellido a donde sea que lleve la tupla con el dni voy a llevar ese mismo apellido(la relacion inversa no siempre existe, o sea no siempre es conmutativo) en este caso dni implica apellido, cada relacion tiene una dependencia funcional y surge de la semantica de los datos, la unica manera de deducirlas es entendiendo la logica de negocio (entender el contexto real de los datos). 

## necesidades al normalizar las relaciones(modificar el diseño)

- preservar los datos(esto es lo escencial, el resto es mas ideal)
- reducir redundancia
- preservar las dependencias funcionales

## dependencias funcionales triviales

dni -> dni
dni, apellido -> dni

cuando implicancia se implica a si misma o a un conjunto donde se encuentra la misma

## dependencia parcial

cuando existe un subconjunto implicante que tambien implica al implicado se le llama parcial, total es cuando no existe subconjunto de implicantes

## dependencia funcional transitiva

se generan cuando en una tupla hay 2 dependendencias funcionales donde el implicante de una es el implicado de la otra

## primera forma normal

no puedo tener como atributo un conjunto de valores, o sea no puedo tener un atributo multivaluado en una relacion

### solucion

crear una tabla para guardar con una clave cada uno de los valores de ese atributo multi-valuado, en esa tabla las claves serian el atributo y la clave de la otra entidad

## segunda forma normal

los atributos deben depender completamente de la clave primaria, las dependencias parciales generar problemas de redundancia, en otras palabras no pueden haber dependencias parciales, ninguna clave candidata deberia tener una dependencia parcial

### solucion

separar en tablas una con una clave parcial y su respectivo implicado y otra para otra clave parcial y el mismo implicado (por cada clave de una relacion parcial hacer una tabla para dicho implicante)

## tercera forma normal

no pueden haber dependencias transitivas, para toda dependencia funcional o bien la parte izquierda sea una clave candidata o bien la parte derecha es un atributo primo

### solucion

hacer una relacion para cada una de las dependencias funcionales separadas evistando asi la dependendencia transitiva

## atributo primo

pertenece solamente a una clave candidata

## tercera forma normal de boire cold 

para toda dependencia funcional la parte izquierda sea una clave candidata

### solucion

ni modo, hacer mas tablas hasta que del lado izquierdo que solo clave candidata

## dependencia multivaluda

cuando a la derecha siempre hay mas de un valor (un conjunto de valores) o sea para un implicante hay siempre mas de un implicado

## cuarta forma normal

siempre que haya una df multivaluada a la izquierda debe haber una clave candidata

### solucion

otra tabla donde la clave candidata se vinculo que cada uno de los valores de el implicado  

## quinta forma normal

si voy a dividir una tabla en varias tablas en todas las tablas debe existir varias tablitas se deben unir por join con un join posible por tabla