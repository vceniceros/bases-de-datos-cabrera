# bases de datos no sql

### sharding (horizontal partitioning)

distribuye las relaciones en subrelaciones más pequeñas llamadas shards. cada shard se almacena en un servidor diferente, lo que permite distribuir la carga de trabajo y mejorar el rendimiento.

### replicación (vertical partitioning)


## disponibilidad

es lo mas importante en las bases de datos nosql. se refiere a la capacidad del sistema para estar operativo y accesible en todo momento, incluso en caso de fallos o interrupciones.

## confiabilidad

es la probabilidad de que un sistema funcione correctamente durante un periodo de tiempo determinado. en las bases de datos nosql, la confiabilidad se logra mediante la replicación de datos y la tolerancia a fallos.

## fallo 

es la desviacion del comportamiento esperado.

## error

es el conjunto de estados en que queda un sistema luego de un fallo.

## escalabilidad

antes se hacian mejoras al servidor pricipal (escalado vertical) pero tiene un limite fisico. ahora se agregan mas servidores al sistema (escalado horizontal).

## tolerancia a particiones

si hay fallos red puede pasar que un grupo de nodos queden aislados del resto. la tolerancia a particiones es la capacidad del sistema para seguir funcionando correctamente a pesar de estas particiones.

## autonomia

indica que tan independienes son los nodos del resto del sistema. 

- autonomia de diseño
- de comunicacion
- de ejecucion

## ventajas de las bases de datos nosql

- las lecturas son mas rapidas 
- mayor escalabilidad
- mayor desempeño
- flexibilidad en aplicaciones distribuidas

## particiones (shardings / fragmentacion)

- fragmentacion horizontal (sharding): cada fragmento contiene un subconjunto de tuplas de la tabla original.

- fragmentacion vertical: es un subconjunto de atributos de la tabla original. cada fragmento contiene un subconjunto de columnas de la tabla original.

- fragmentacion hibrida: combina la fragmentacion horizontal y vertical.

- un esquema de asignacion de fragmentos a sitios es una funcion que asigna cada fragmento a un sitio de la red.

## replicacion

- mejora la disponibilidad de los datos.
- un caso extremo es la replicacion completa, donde cada sitio tiene una copia completa de la base de datos (no es comun en bases de datos grandes).
- tiene como desventaja el costo de actualizar/insertar datos en multiples sitios.
- se complejiza el control de concurrencia.
- si no hay replicacion los fragmentos son disjuntos.
- tambien puede haber replicacion parcial, donde algunos fragmentos son replicados en varios sitios y otros no.

