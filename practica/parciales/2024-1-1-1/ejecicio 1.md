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