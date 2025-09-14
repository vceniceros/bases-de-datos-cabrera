# bases de datos

## bibliografia

Recomendado: Fundamentos de Bases de Datos
(Elmasri/Navathe), Editorial Pearson.


Fundamentos de Bases de Datos
(Silberschatz/Korth/Sudarshan), Editorial
McGraw-Hill

## modelos de bases de datos

- modelo entidad relacion/ modelo entidad interrelacion
- modelo relacional
- modelo de objetos

porque hay sistemas de bases de datos:

por comodidad

porque es mas seguro

para tene una interfaz uniforme para distintas aplicaciones

## modelo entidad interrelacion

- conjunto de tipos de entidades: pueden ser fisicos o abstractos pero para ser un conjunto deben tener los mismos atributos

- atributos: los atributos poseen un dominio, segun el dominio del problema es que atributos tendre

- conjunto de relaciones: suelen ser los verbos que unen a las entidades

- dominio de un atributo: los limites de cada atributos, hasta donde llega el atributo 

- caso particular: valor null(desconocido)

### clasificacion de atributos

- simples o compuestos(simple: edad, compuesto: direccion)
- monovaluados o multivaluados(mono: dni, multi: materias aprobadas)(son dos elipses)
- almacenados o derivados(almacenados: se guardan directamente, derivados: se calculan)

**todo rectas**


### restricciones 

nomenclatura 

- de cardinalidades: el maximo
- de participacion:el minimo

participacion va a la izquierda, cardinalidades a la derecha

van cruzados, se leeria como alumnos va minimo 1 a la universidad, n como maximo, y un alumno va solo a una universidad

```
alumnos -(1,N)- <estudian>-(1,1)- universidad
```

### clave

identifican una identidades de todas la entidades iguales, es un atributo

- superclave: conjunto de atributos que identifican
- clave candidata: conjunto minimo, la menor cantidad posible de atributos
- clave primaria: es la que yo quiero usar como primaria, basicamente la que quiero usar de entre todas las claves candidatas 


### relaciones

- grado: binarias, ternariasI(el rombo tiene 3 entidades), unarias, cuaternarias(el rombo tiene 4)

tiene cardinalidad y participacion

- restricciones de unicidad: la clave con mayor cardinalidad es la clave de la relacion

## ejercicio 1

- entidades: computadoras, fabricantes, pais de fabrica

- computadora: sn,modelo,fabricante, precio clave sn
- fabricante: cuit,nombre, pais(cuit)
- pais: nombre(siglas)

computadora: lo fabrica fabricante (1,1) fabrica (1,n)computadora
fabricante: se radica pais (1,1) pais fabrica(1,n)


```
|computadora| -(1,n)- <la fabrica> -(1,1)-|fabricante|

|fabricante| -(1,n)- <radicado en>-(1,1) |pais|

computadora-(sn)


```

## ejercicio 2

municipalidad, empleados

```
|empleados|-(1,n)- <contrato> -(1,1)-|municipalidad|


 dni, cuit, nombre,  cuit emplado          cuit,partido, localidadS
 sueldo          

```


el rol en las unarias es el mas importante

## entidades fuertes o debiles

una entidad es debil cuando no cuenta con la cantidad suficientes atributos para formar una clave primaria,siempre da la participacion total en la relacion que formanx|


en las ternarias participacion debe ser de minimo 1

agregacion: consiste en meter una relacion intermedia para no tener el problema de que alguna de las entidades tenga clave nula 

aca tambien hay herencia, la entidad superior tiene la clave

union: son las instancias inferiores que tiene las claves