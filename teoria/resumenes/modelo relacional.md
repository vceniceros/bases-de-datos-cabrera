# modelo relacional

retomando modelo ansi spark sabemos que el modelo conceptual es la abstraccion de la base de datos en si misma, de ahi surge el modelo relacional, el modelo relacional entiende a la base de datos como un conjunto de relaciones

## dominio

es el conjunto de valores homogeneos que puede tomar un atributo en una relacion de acuerdo con su tipo de datos y restricciones, dichos valores atomicos (no son divisibles), definiciones logicas son aquellas restricciones que les ponemos a un atributo segundo el modelo especifico, ejemplo: dni tiene 8 digitos enteros sin contar al 0, una nota  va del 1 al 10

## producto cartesiano

es el conjunto de todas las posibles combinaciones de valores que puede tomar un atributo

dom(A1)×dom(A2)×⋯×dom(An)

si |D| es la cardinalidad del dominio entonces 

∣dom(A1)∣×∣dom(A2)∣×⋯×∣dom(An) ∣

## esquema

relacion + atributo, se nota R(A1,A2,...An) 

donde 

- r es la relacion
- a son los atributos
- cada Ai tiene su dom(Ai)

## tupla

cada valor de tupla corresponde a un atributo del esquema de relacion, ejemplo cliente(cuit, apellido, direccion)

tiene como tuplas

```
cuit, apellido, direccion

101111, jorgito, cuaranta 2304
102239, pablo,   garrafa sanchez 398
```


## relacion

relacion = cabecera (atributo, dominio) +  cuerpo(atributo, valor), las relaciones van en plural

### cabecera

Cliente(Cuit(entero) , RazonSocial(cadena), Dirección (cadena), Telefono (Entero))

### cuerpo

(11-11111111-1, “Este”, “Av Santa Fe 1000”, 1195467834)

### cardinalidad

cantidad de tuplas (es f(t))


## restricciones de dominio

son todos los valores que puede tomar un atributo 

## unicidad

una tupla no puede repetir valores

## base de datos

restricciones de integridad + conjunto de esquema

## restriccion de integridad de relacion

la clave primaria (primary key) no puede ser nula, garantiza la identidad unica de cada tupla(registro)

## restriccion de confianza preferencial 

un subconjunto de atributos (fk)  de una relacion A referencia a otra relacion R, cada valor de fk debe 

- existir como valor de pk en r
- ser nula (si la fk lo admite)

FK puede referirse incluso a la misma relacion (auto referencial)

## cuatro restricciones

- dominio del atributo
- clave no repetida
- integridad de entidad (la clave no puede ser nula)
- intergirdad refencial (la foreing key deben existir en otras relaciones)

## operaciones

### insert

se encarga de agregar una nueva tupla en la relacion, puede romper cualquiera de las 4 restricciones

### delete

elimina una tupla de la relacion, solo puede violar la restriccion de integridad referencial

### update/modify

permite modificar una tupla pasandole una clave de una relacion

### consultar

busca una tupla mediante un atributo de la relacion

