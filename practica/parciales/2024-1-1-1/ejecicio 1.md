# ejecicio 1

Escriba una unica consulta SQL que de cumplimiento al siguiente requerimiento.
Encontrar todos los pilotos que finalizaron todas sus carreras en la posicion 1 2 o
3 y que el tiempo de su mejor vuelta es mayor a un minuto en todas sus carreras
(ms mejor vuelta: en milisegundos). Mostrando el nombre del piloto, la nacionalidad,
nombre de equipo, nombre del circuito, y la cantidad de carreras que cumplen la condicion.

## relaciones


EQUIPOS(cod equipo, nombre, veces campeon)
PILOTOS(cod equipo, nro piloto, nombre, apellido, nacionalidad, carreras ganadas)
CIRCUITOS(id circuito, nombre circuito, pais, vueltas, longitud km)
CARRERAS(id carrera, fecha, id circuito, cod equipo, nro piloto, posicion,
vueltas finalizadas, ms mejor vuelta, puntos ganados)

## divido en partes

1. encontrar todos los pilotos que finalizaron su carreras en la posicion 1,2 3
   
```sql
SELECT DISTINCT c.nro_piloto, c.cod_equipo 
FROM carreras AS c
WHERE(c.posicion <= 3);

```

2. de esos encontrar los que su mejor vuelta sea mayor a un minutos (las vueltas estan ms o sea, 1000 ms son 1 seg 60 seg son 1 minuto o sea 1 minuto son 60000 ms)

```sql
SELECT DISTINCT c.nro_piloto, c.cod_equipo 
FROM carreras AS c
WHERE(c.posicion <= 3 and c.ms_mejor_vuelta >= 60000);
```


3. de esos mostrar el nombre, nacionalidad, nombre de equpo, nombre de circuito cantidad de carreras que cumplen eso

```sql
SELECT DISTINCT p.nombre, p.nacionalidad, e.nombre, ci.nombre_circuito, count(*) AS cantidad_carreras
FROM pilotos AS p
JOIN equipos AS e
ON p.cod_equipo = e.cod_equipo
JOIN carreras AS c
ON p.nro_piloto = c.nro_piloto
JOIN circuitos AS ci
ON c.id_circuito = ci.id_circuito
GROUP BY p.nombre, p.nacionalidad, e.nombre, ci.nombre_circuito 
HAVING 
    MIN(c.posicion) >= 1 and MAX(c.posicion) <= 3
    AND MIN(c.ms_mejor_vuelta) >= 60000;

```


## enunciado 2



 Dadas las tablas de PILOTOS y de CARRERAS ilustradas a continuaci´on, se quiere armar una  tabla 
 como  la  Tabla  3,  ‘top 3 promedio de puntos‘  en  donde  se  muestran  los  3 pilotos con mayor 
promedio de puntos, ordenados de forma descendente y cuyo promedio de puntos sea mayor o igual 10 
puntos. Mostrando el nombre completo del piloto y su promedio de puntos.
Escriba una u´nica consulta SQL que devuelva los datos de la Tabla 3 en base a los de las tablas de 
PILOTOS y de CARRERAS.
Nota: los datos son aproximados, para dar una idea de la informaci´on contenida en cada tabla

parte 1: buscar el promedio de puntos por piloto


```sql
SELECT AVG(c.puntos_ganados) 
FROM carreras as c;


SELECT c.nro_piloto, AVG(c.puntos_ganados)
FROM carreras AS c
GROUP BY c.nro_piloto;
```

parte 2: de esos promedios agarrar los 3 mejores

```SQL
SELECT c.nro_piloto, AVG(c.puntos_ganados) as promedio_de_puntos
FROM carreras AS c
GROUP BY c.nro_piloto
HAVING AVG(c.puntos_ganados) >= 10
ORDER BY promedio_de_puntos DESC
LIMIT 3;



```

parte 3: mostrar el nombre completo del piloto y su promedio de puntos

```sql
SELECT p.nombre ,p.apellido ,AVG(c.puntos_ganados) AS promedio_de_puntos
FROM carreras AS c
JOIN pilotos AS p
ON c.nro_piloto = p.nro_piloto
GROUP BY c.nro_piloto, p.nombre, p.apellido
HAVING AVG(c.puntos_ganados) >= 10
ORDER BY promedio_de_puntos DESC
LIMIT 3;

```

## enunciado 1 bis

Escriba una unica consulta SQL que de cumplimiento al siguiente requerimiento.
Se necesita encontrar para cada circuito, el piloto que tiene la vuelta mas rapida en
milisegundos. Asumiendo que hay un solo piloto por carrera con la vuelta mas rapida.
Se pide mostrar el nombre del circuito, nombre del piloto, la nacionalidad, nombre de
equipo, y el tiempo en milisegundos.

1. buscar el piloto con la vuelta mas rapida

```sql
SELECT c.nro_piloto, MIN(c.ms_mejor_vuelta) AS vuelta_mas_rapida, cir.nombre_circuito, p.nombre, p.nacionalidad, e.nombre
FROM carreras AS c
JOIN circuitos AS cir
ON c.id_circuito = cir.id_circuito
JOIN pilotos AS p
ON c.nro_piloto = p.nro_piloto
JOIN equipos AS e
ON e.cod_equipo = c.cod_equipo
GROUP BY c.nro_piloto, c.ms_mejor_vuelta, cir.nombre_circuito,p.nombre, p.nacionalidad, e.nombre 
ORDER BY c.ms_mejor_vuelta ASC
LIMIT 1;
```

## enunciado 2 bis

Dadas las tablas de PILOTOS y de CIRCUITOS ilustradas a continuación, se quiere armar
una tabla como la Tabla 3, km por pilotos, en donde se muestra la cantidad total de km
de cada piloto (vueltas finalizadas X longitud km), mostrando solo los que recorrieron
mas de 500.000 km.
Escriba una unica consulta SQL que devuelva los datos de la Tabla 3 en base a los de
las tablas de CARRERAS y de CIRCUITOS.

1. encontrar los kilometros recorrido de un piloto

```sql
SELECT c.cod_equipo, c.nro_piloto, cir.longitud * c.vueltas_finalizadas AS kilometros_recorridos
FROM carreras AS c
JOIN circuitos AS cir
ON c.id_circuito = cir.id_circuito
GROUP BY c.cod_equipo, c.nro_piloto, cir.longitud, c.vueltas_finalizadas
HAVING (cir.longitud * c.vueltas_finalizadas >= 500000)
ORDER BY cir.longitud * c.vueltas_finalizadas DESC
LIMIT 3;
```
