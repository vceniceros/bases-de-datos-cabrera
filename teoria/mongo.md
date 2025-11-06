# mongo db (base de datos no relacionales)

no sql es no solo sql (no solo lenguaje estructurado de consultas), mas valido decir no es, son bases de datos no relacionales, la diferencia principal es la flexibilidad, no es tan estructurada como sql lo cual permite mejoras en rendimiento.

- los SGDM No SQL son sistemas distribuidos (se pueden tener muchos nodos para una base de datos por lo que va a responder el que este libre)
- el almacenamiento es desestructurado(en post de cumplir las restricciones siempre se pierde el tiempo en validarlas, los sistemas no relacionales son mas agiles al no estar validando eso datos)
- poseen alta disponibilidad(cuanto mas distribuidos son los sistemas mas seguro y mas dispobilidad tendra de responde consultas)
- poseen un gran desempeño 

## porque se crearon?

- eran muy lentas las maquinas anteriores
- hoy en dia se manejan mas datos, la laxedad de los datos permite ocupar menos espacios
- evitar restricciones del modelo relacion(sql valida muchas cosas en cualquiera de sus consultas)

### ejemplos

- redes sociales
- aplicaciones de navegacion
- aplicaciones de mensajeria

## caracteristicas 

### escalabilidad

vertical vs horizontal: no debe detenerse al escalar

vertical: hacer mas poderosa la maquina que hostea el SGBD 
horizontal: aumentar la cantidad de nodos que se encargan de proveer servicio de la base de datos

### disponibilidad

hipoteticamente siempre vas a tener un nodo disponible

### replicacion y concistencia eventual

mayor velocida de lectura, peor velocidad de escritura, la concistencia va a ser eventual, se replica maestro esclavo

### fragmentacion de archivos

se parten los archivos en diferentes nodos

### alto rendimiento

hashing vs particionamiento de datos, acceso rapido a datos

### no hay esquema

las filas sql en mongo son documentos, no se puede esquematizar, normalmente se maneja en modo API, buscas, insertas, modificas, eliminas

## tipos de motores no sql

- basados en documentos(mongodb)
- en diccionarios
- columnas
- grafos
- hibridas (combinan mas de una)

## teorema de cap 

son 3 caracteristicas de una BDD no SQL, nunca vas a poder cumplir las 3 al mismo tiempo

- CA
- CP
- AP

### *C*oncistencia

todos los nodos tienen lo mismo

### *D*isponibilidad

siempre va a responder el SGDB

### *P*articiones

tolerancia a los fallos de particion(particion seria que en un determinado  momento uno o mas nodos se desconecten del resto)

de preferencia es ideal tener D

## Mongo db: modelo de datos

- se guarda en documentos(json binary: se ve como json, mongo lo escribe con binarios)
- se agrupan en colecciones
- no se requiere un sistema estructurado de documentos
- los documentos pueden ser indexados
- dos documentos pueden tener distintos datos
- los documentos se crean con una clave subrogada autogenerada(_id)
- las colecciones pueden no tener un sistema estructurado de datos
- aca no hace falta normalizar datos

## operaciones de mongo(CRUD)

alta, baja, modificacion o busqueda

- db.collection.InsertOne(atributos y valores del documento)
- db.collection.InsertMany(atributos y valores del documento)

ejemplo 

```mongodb

db.peliculas.InsertOne({titulo: "rambo", año: 1987})
db.peliculas.InsertMany({titulo: "rambo", año: 1987}, {titulo: "rocky", año: 1987})

```

- db.collection.remove(condicion)

```mongodb

db.peliculas.remove({titulo: 'volver al futuro'})
```

- db.collection.UpdateOne(filter, update, opciones)
- db.collection.UpdateMany(filter, update, opciones)


- db.colletion.find(condicion)

## distribuido

- garantiza distribucion y atomicidad
- posee replicacion, la ventaja es que cualquier nodo puede tener cualquier cantidad de datos
- leer es mas rapido que insertar 