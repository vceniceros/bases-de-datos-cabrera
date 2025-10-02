# algebra relacional

## intro

los lenguajes de consulta permiten extraer info de la base de datos DML(data manipulation language), estos lenguajes son teoricos

### procedurales

indica las operaciones para buscar datos, el algebra relacional es formal, se dice como buscar

### declarativos

el usuario describe la informacion que requiere sin decir como obtenerla


### formal/ practico

uno es teorico el otro es practico


## algebra relacional

es formal y procedural, entran 2 o mas relaciones, sale una, esta compuesto por operaciones cuyos operandos son las relaciones


## operaciones

- seleccion
- proyeccion
- union
- diferencia de conjuntos
- producto carteciano

## seleccion σ

es unaria, recibe una relacion como argumento, selecciona todas las tuplas que cumplan una condicion, incondicional es 1 = 1, las condiciones son pueden ser las tipicas logicas y el and(^), or(^inverso) y not (¬), tambien estan los tipicos: = != <= => < > , comparan atributo con atributo o atributo con constantes

```
ejemplo 

σpadron= 1111 (alumno)

saldra una relacion con el alumno de ese padron
```

## proyeccion 

es unaria, devuelve los atributos elegidos de la relacion argumento, elimina las duplicadas, selecciona los atributo "L" de todas las tuplas de la relacion eliminando repetidos, entra una relacion, sale otra relacion de solo el atributo

```
cpadron,nombre(alumnos) 

saldra otra relacion con todos los padrones y nombre
```

## union ∪

es binaria, devuelve la union de dos relaciones, *para hacer una union se debe cumplir que R y S deben tener la misma aridad y los dominios deben ser compatibles(que tengan el mismo tipo de dato y que tenga sentido)*, es decir misma cantidad de atributos, en la union tampoco se repiten las relaciones (como en proyeccion)

```
πnombre(profesores_ajuntos) ∪ πnombre(alumnos)

devolvera una relacion con los nombres de todos los alumnos y profes
```

## diferencia de conjuntos -

es binaria y hace lo contrario a union, de 2 relaciones te devuelve todo lo que no sea igual entre los atributos seleccionados, *mismo requisitos de union*

```
πnombre(profesores_ajuntos) - πnombre(alumnos)

devolvera una relacion con los nombres de todos los alumnos que no son profesores(el orden importa por que nombre ira primero)
```
## producto cartesiano X

binario, devolvera todas las convinaciones de todos los atributos seleccionados de cada tupla

```
πnombre(profesores_ajuntos) X πnombre(alumnos)

devolvera una relacion con todas las combinaciones posibles
```


## renombrar ρ

unaria, permite renombrar ya sea relaciones o atributos, se pueden 

```
ρ estudiantes(padron_estudiante, nombre_estudiante)(alumnos)

devolvera una relacion estudiantes con todos los datos de alumno pero los atributos cambiados de nombre (los atributos likean con posicion)
```

## operaciones complejas

- interseccion
- junta
- division
- asignacion


## interseccion ∩

la inversa de union, devuelve solo los atributos que esten dentro de una relacion y la otra, mismos requisitos que union y diferencia 

```
πnombre(profesores_ajuntos) ∩ πnombre(alumnos)

devolvera una solo con los alumnos que sean profesores(el orden importa por que nombre ira primero)
```

## junta ⨝

es producto cartesiano + seleccion, se elige una condicion de una para comparar en la otra relacion devolviendo todas las tuplas que cumplan esa condicion

```
R ⨝ S(c)

alumnos ⨝ (cursos) materia

devolveria todos los alumnos de un curso de una materia (se podria hacer con un producto cartesiano y luego una seleccion) sin repetir atributos(incluyendo la condicion)
```

junta natural(x join) se hace cuando los campos tiene el mismo nombre (no lleva condicion, se pone un *) al poner el * une en base a atributos del mismo nombre 

## division ÷

obtener todas las filas de r que esten relacionadas a todas las filas de s


## asignacion ← (solo va en un sentido)

unaria, permite asignar una expresion a una relacion temporal (se le puede ver como una variable de un programa)

```
ejemplo

alumnos_actuales ← σpadron(alumnos)

guardara en alumnos_actuales todos lo  alumnos de con ese criterio


```

herramienta Relax 