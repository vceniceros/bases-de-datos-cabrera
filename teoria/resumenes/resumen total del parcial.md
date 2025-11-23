# resumen de parcial

## modelos de bases de datos

ua base de datos es un conjunto de datos interrelacionados, el modelo conceptual describe la semantica de los datos, tiene un conjunto de objetos que son la estructura y propiedades que tienen, conjunto de operaciones, como manipulan los datos y el lenguaje y restricciones

## modelo entidad - relacion

se describe con entidades, atributos y relaciones

### entidad

es un objeto de la vida real que existe por si solo, se nota en singular y representa un elemento en si

![entidad](image-21.png)

#### entidad fuerte

es una entidad que cuya clave candidata o primaria le pertenece a si misma

![entidad fuerte](image-26.png)

#### entidad debil

es una entidad cuya clave candidata es una clave foranea, osea no posee una clave en si misma

![entidad debil](image-27.png)

![entidad debil completa](image-31.png)

### Atributo

son los componentes o datos que conforman una entidad, son los datos en si mismo

![atributo](image-22.png)

#### atributos compuestos

son atributos que se componen por otros atributos

![atributo compuesto](image-23.png)

#### atributo derivado

es un atributo que deriva de otro

![atributos derivados](image-24.png)

#### atributos multivaluado

es un atributo que almacena varios valores

![atributo multivaluado](image-25.png)

### dominio de los atributos

es conjunto de valores que puede tomar un atributo, no confundir con tipo de datos, (ejemplo: dni puede ser un int, ahora no puede ser ni 0 ni negativo)

### null

un valor puede ser null o bien porque no aplica o porque el valor es desconocido

## restriccion de unicidad

toda entidad debe tener un atributo clave que la distinga de las demas entidades

## restriccion de unicidad minimal

el conjunto de atributos clave debe ser minimal, ningun subconjunto del mismo debe ser capaz de identificar univocamente a las entidades

### relacion

son las asociaciones entres distintas entidades, se notan con un rombo, estas pueden tener atributos pero no claves

#### binaria

es una relacion de dos entidades

![binaria](image-28.png)

#### ternaria

es una relacion de tres entidades

![ternaria](image-29.png)

### restricciones

son las restricciones en una relacion, se dividen en (participacion,cardinalidad) donde participacion es el numero minimo de tuplas que puede tener la relacion y cardinalidad el maximo de tuplas participantes de la relacion, estas se marcan invertidas (en el ejemplo, 1 cliente puede tener una sola condicion fiscal, ahora una condicion fiscal puede no tenerse directamente o tener mas de una) 

![participacion y cardinalidad](image-30.png)

### participacion total

todas las entidades deben estar asociadas a la relacion (participacion minima 1)

### participacion parcial

la participacion es opcional (participacion minima 0)

### especializacion

se define un conjunto de subclases para una entidad

### generalizacion

es una abstraccion comun para un conjunto de entidades, en definitiva, se diferencia en que una especializacion se crea primero las entidades y luego las sub entidades, en la generalizacion en cambio se parten de entidades distintas que comparten una serie de atributos

![especializacion/generalizacion](image-32.png)

### union

es como la especializacion pero cada sub entidad tiene sus propias claves, la entidad padre viene a agregar atributos comunes a las mismas

![union](image-33.png)

### agregacion

se usa para hacer una relacion entre relaciones, como no se puede hacer una relacion con otra relacion, se engloba a una de las relaciones junto con su entidad para tratarlas como una entidad en si misma, se empaqueta una relacion y sus entidades para participar en otra relacion 

![agregacion](image-34.png)


## modelo relacional

es un modelo logico que representa los elementos del mundo real como relaciones

### relacion

es un conjunto de tuplas que comparten un esquema de atributos cada uno con su respectivo dominio, estas se representan como tablas, las filas son las tuplas y las columnas los atributos, y se notan R(A1,A2,...,An) donde R es el nombre de la relacion y A son los atributos

no se pueden repetir tuplas en una relacion

### grado

es el numero de atributos que tiene una relacion

### cardinalidad

es el numero de tuplas que tiene una relacion

## claves

son antributos que identifican a una tupla (una entidad/relacion individual) de otras tuplas

### superclave

es el conjunto de todos los atributos que identifican a una tupla de otra

### clave candidata

es el conjunto minimo de claves

### clave primaria

son es una clave arbitraria elegida de entre las claves candidatas, se nota con un subrayado solido

### clave foranea

son las claves que pertenecen a otra entidad, se notan con subrayado (estas no son compatibles en el modelo ER)

## restricciones de integridad

### integridad de entidad

ninguna tupla puede tener un valor nulo en su clave primaria

### integridad referencial

si una tupla tiene una clave foranea, el valor de la misma debe coincidir con el valor de una clave primaria en otra relacion o ser nulo

## mapeo de modelo ER a relacional

### entidades fuertes

se mapea cada entidad fuerte a una relacion, los atributos de la entidad se convierten en atributos de la relacion, la clave primaria de la entidad se convierte en la clave primaria de la relacion

### atributos derivados

no se mapean

### atributos compestos

se mapean sus atributos simples

![atributo compuesto](image-23.png)

```
pasa a ser

(primer_nombre, primer_apellido)
```

### atributos multivaluado

se crea una nueva relacion para el atributo multivaluado, la clave primaria de la entidad original se convierte en clave foranea en la nueva relacion, el atributo multivaluado se convierte en un atributo de la nueva relacion, la clave primaria de es el atributo multivaluado.

![atributo multivaluado](image-25.png)

```pasa a ser

(dni, email) con dni como clave foranea y email como clave primaria
```


### entidades debiles

se crea una relacion para la entidad debil, los atributos de la entidad se convierten en atributos de la relacion, la clave primaria de la entidad fuerte se convierte en clave foranea en la nueva relacion, la clave primaria de la nueva relacion es la combinacion de la clave primaria de la entidad fuerte y la clave parcial de la entidad debil

![entidad debil completa](image-31.png)

```pasa a ser

(razonsocial, nro_mesa) con razonsocial como clave foranea y (razonsocial,nro_mesa) como clave primaria
```

### relaciones

estas se mapean dependiendo de su tipo

#### relacion binaria 1:1 parcial

se elige una de las dos entidades participantes y se agrega la clave primaria de la otra entidad como clave foranea en la entidad elegida, si la participacion es total en alguna de las dos entidades, se debe elegir esa entidad para agregar la clave foranea

![binaria](image-35.png)

```pasa a ser

en este  caso la participacion total la tienen facultad, entonces a decano se le agrega la clave primaria de facultad como clave foranea

decano(nombre, dni, profesion, facultad_nombre) con facultad_nombre como clave foranea
```

#### relacion binaria 1:1 total

se crea una nueva relacion, se agregan las claves primarias de ambas entidades como claves foraneas en la nueva relacion, la clave primaria de la nueva relacion es la combinacion de las claves primarias de ambas entidades

![relacion binaria 1:1 total](image-36.png)

```pasa a ser

facultad_decano(facultad_nombre, decano_dni) con ambas como claves foraneas y (facultad_nombre, decano_dni) como clave primaria
```

#### relacion binaria 1:1 1:n

en este caso se agrega la clave primaria de la entidad del lado 1 como clave foranea en la entidad del lado n


![relacion binaria 1:n](image-37.png)

```pasa a ser

alumno(padro, nombre, apellido, ingreso, nombre_facultad) con nombre_facultad como clave foranea
```

#### relacion binaria 1:n 1:m

en este caso se crea una nueva relacion, se agregan las claves primarias de ambas entidades como claves foraneas en la nueva relacion, la clave primaria de la nueva relacion es la combinacion de las claves primarias de ambas entidades


![relacion binaria 1:n 1:m](image-38.png)

```pasa a ser

alumno_docente(alumno_padron, docente_dni) con ambas como claves foraneas y (alumno_padron, docente_dni) como clave primaria
```

#### generalizacion o especializacion

se crea una relacion para la entidad padre y una relacion para cada subentidad, los atributos de la entidad padre se convierten en atributos de la relacion padre, la clave primaria de la entidad padre se convierte en clave primaria de la relacion padre, los atributos de cada subentidad se convierten en atributos de la relacion hija, la clave primaria de la relacion hija es la misma que la clave primaria de la relacion padre


![especializacion](image-39.png)

```pasa a ser   

electrodomestico(marca, modelo, pais, consuma) con (marca, modelo) como clave primaria

heladera(marca, modelo, capacidad) con (marca, modelo) como clave primaria

televisor(marca, modelo, canales) con (marca, modelo) como clave primaria

lavaropas(marca, modelo, programas) con (marca, modelo) como clave primaria

si es una especializacion total

se agregan todos los atributos de la entidad padre a cada subentidad

heladera(marca, modelo, pais, consuma, capacidad) con (marca, modelo) como clave primaria

televisor(marca, modelo, pais, consuma, canales) con (marca, modelo) como clave primaria

lavaropas(marca, modelo, pais, consuma, programas) con (marca, modelo) como clave primaria

```

#### union

se crea una relacion para la entidad padre y una relacion para cada subentidad, los atributos de la entidad padre se convierten en atributos de la relacion padre, la clave primaria de la entidad padre se convierte en clave primaria de la relacion padre, los atributos de cada subentidad se convierten en atributos de la relacion hija, la clave primaria de la relacion hija es la clave primaria de la entidad hija

![union](image-40.png)

```pasa a ser

producto(id_producto, precio)
con id_producto como clave primaria

libro(titulo, año, id_producto)

con titulo como clave primaria y id_producto como clave foranea

pelicula(titulo, duración, id_producto)

con titulo como clave primaria y id_producto como clave foranea
```

#### ternarias con cardinalidad n;n;n

se crea una nueva relacion, se agregan las claves primarias de las tres entidades como claves foraneas en la nueva relacion, la clave primaria de la nueva relacion es la combinacion de las claves primarias de las tres entidades

![ternaria n;n;n](image-41.png)

```pasa a ser

materia_docente_universidad(codigo_materia,legajo_docente,nombre_universidad)

con las tres como claves foraneas y (codigo_materia, legajo_docente, nombre_universidad) como clave primaria
```

#### ternarias con cardinalidad n;n;1

a dirimir

#### ternaria con cardinalidad n;1;1

a dirimir

## algebra relacional

es un lenguaje procedural que permite manipular y consultar relaciones en una base de datos relacional, se compone de un conjunto de operaciones que toman una o mas relaciones como entrada y producen una nueva relacion como salida

### seleccion (σ)

devuelve todas las tuplas de una relacion que cumplen una condicion especifica

```
σ condicion (R)
```
### proyeccion (π)

devuelve una nueva relacion que contiene solo los atributos especificados de la relacion original, eliminando las tuplas duplicadas

```
π atributos (R)
```

### union (∪)

es binaria, devuelve una nueva relacion que contiene todas las tuplas que estan en al menos una de las dos relaciones de entrada, para que sea posible ambas relaciones tienen que tener misma aridad, dominios compatibles y tener coherencia semantica

```
R1 ∪ R2
o bien
π atributos (R1) ∪ π atributos (R2)
```

### diferencia (-)

es binaria, devuelve una nueva relacion que contiene todas las tuplas que estan en la primera relacion pero no en la segunda, para que sea posible ambas relaciones tienen que tener misma aridad, dominios compatibles y tener coherencia semantica

```
R1 - R2
o bien
π atributos (R1) - π atributos (R2)
```

### producto cartesiano (×)

es binaria, devuelve una nueva relacion que contiene todas las combinaciones posibles de tuplas de las dos relaciones de entrada

```
R1 × R2
```

### renombrar (ρ)

sirve para cambiar el nombre de una relacion o de sus atributos

```
ρ nuevo_nombre (R)
o bien
ρ nuevo_nombre (atributo1, atributo2, ...) (R)
``` 

### interseccion (∩)

es binaria, devuelve una nueva relacion que contiene todas las tuplas que estan en ambas relaciones de entrada, para que sea posible ambas relaciones tienen que tener misma aridad, dominios compatibles y tener coherencia semantica

```
R1 ∩ R2
o bien
π atributos (R1) ∩ π atributos (R2)
```

### join (⨝)

combina dos relaciones basandose en una condicion de igualdad entre atributos comunes de ambas relaciones, devuelve una nueva relacion que contiene todas las tuplas que cumplen la condicion de join

```
R1 ⨝ condicion R2
o bien
R1 ⨝ R2  (si los atributos comunes tienen el mismo nombre)
```
### join natural (⋈)

combina dos relaciones basandose en la igualdad de todos los atributos comunes entre ambas relaciones, devuelve una nueva relacion que contiene todas las tuplas que cumplen la condicion de join natural

```

R1 ⋈ R2
```

### division (÷)

es binaria, devuelve una nueva relacion que contiene todas las tuplas de la primera relacion que estan asociadas con todas las tuplas de la segunda relacion

```
R1 ÷ R2

```

### asignacion (←)

permite almacenar el resultado de una operacion en una nueva relacion para su uso posterior

```
R3 ← operacion
```

## dependencias funcionales

una dependencia funcional es una restriccion entre dos conjuntos de atributos en una relacion, donde un conjunto de atributos determina de manera unica a otro conjunto de atributos

```
A -> B
```

significa que el valor de A determina de manera unica el valor de B

### superclave bis

un conjunto de atributos K es una superclave para una relacion R si para cualquier par de tuplas en R, si tienen el mismo valor para K, entonces deben tener el mismo valor para todos los atributos en R

### clave candidata bis

un conjunto de atributos K es una clave candidata para una relacion R si se cumplen dos condiciones:

1. Unicidad: para cualquier par de tuplas en R, si tienen el mismo valor para K, entonces deben tener el mismo valor para todos los atributos en R

2. Minimalidad: no existe un subconjunto propio de K que cumpla la condicion de unicidad

### clausura 

la clausura de un conjunto de atributos A, denotada como A+, es el conjunto de todos los atributos que pueden ser determinados funcionalmente por A utilizando un conjunto dado de dependencias funcionales F

### reglas de inferencia de Armstrong

1. Reflexividad: si B es un subconjunto de A, entonces A -> B

2. Aumentacion: si A -> B, entonces AC -> BC para cualquier conjunto de atributos C

3. Transitividad: si A -> B y B -> C, entonces A -> C

### conjunto minimo de dependencias funcionales

un conjunto minimo de dependencias funcionales F es un conjunto que cumple las siguientes condiciones:

1. Cada dependencia funcional en F tiene una sola atributo en el lado derecho
2. No se puede eliminar ninguna dependencia funcional de F sin cambiar el cierre de F
3. No se puede eliminar ningun atributo del lado izquierdo de ninguna dependencia funcional en F sin cambiar el cierre de F
4. El conjunto F es equivalente al conjunto original de dependencias funcionales

como obtenerlo:

1. descomponer las dependencias funcionales para que cada una tenga un solo atributo en el lado derecho

2. eliminar dependencias funcionales redundantes

3. eliminar atributos redundantes del lado izquierdo de las dependencias funcionales

### atributos primos

un atributo es primo si pertenece a alguna clave candidata de la relacion


### dependencias funcionales triviales

una dependencia funcional A -> B es trivial si B es un subconjunto de A

### dependencias funcionales transitivas

una dependencia funcional A -> C es transitiva si existe un conjunto de atributos B tal que A -> B y B -> C, y B no es un subconjunto de A ni de C

### dependencias funcionales parciales

una dependencia funcional A -> B es parcial si existe un subconjunto propio de A, digamos C, tal que C -> B

### dependencias funcionales completas

una dependencia funcional A -> B es completa si no es parcial, es decir, no existe un subconjunto propio de A que determine a B

## normalizacion

la normalizacion es el proceso de organizar los datos en una base de datos para reducir la redundancia y mejorar la integridad de los datos, se logra dividiendo una base de datos en tablas mas pequeñas y definiendo relaciones entre ellas, al normaliza buscamos preservar los datos(esto es escencial), evitar reduncacias y preservar las dependencias funcionales

### primera forma normal (1FN)

una relacion esta en 1FN si todos sus atributos son atomicos, es decir, no se permiten atributos multivaluado o compuestos

### segunda forma normal (2FN)

una relacion esta en 2FN si esta en 1FN y no tiene dependencias funcionales parciales, es decir, todos los atributos no primos deben depender completamente de la clave primaria

### tercera forma normal (3FN)

una relacion esta en 3FN si esta en 2FN y no tiene dependencias funcionales transitivas, es decir, todos los atributos no primos deben depender directamente de la clave primaria y no de otros atributos no primos

### forma normal de Boyce-Codd (BCNF)

una relacion esta en BCNF si para cada dependencia funcional A -> B, A es una superclave, es decir, no existen dependencias funcionales donde el lado izquierdo no sea una superclave

