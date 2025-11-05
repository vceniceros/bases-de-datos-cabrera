SELECT p.nombre, p.nacionalidad, e.nombre, ci.nombre_circuito, count(c.id_carrera) AS cant_carreras
FROM pilotos AS p
 JOIN equipos AS e
 ON e.cod_equipo = p.cod_equipo
 JOIN carreras AS c
ON c.nro_piloto = p.nro_piloto
JOIN circuitos AS ci
ON ci.id_circuito = c.id_circuito 
WHERE c.posicion <= 3 and c.ms_mejor_vuelta >= 60000
GROUP BY p.nombre, p.nacionalidad, e.nombre, ci.nombre_circuito;


 WITH top_3_promedio_puntos (nombre_piloto, promedio_puntos) AS (
 SELECT p.nombre, AVG(c.puntos_ganados)
 FROM pilotos AS p
 NATURAL JOIN carreras AS c
 WHERE c.puntos_ganados >= 10
 GROUP BY p.nombre
 ORDER BY AVG(c.puntos_ganados) DESC
LIMIT 3)
 SELECT nombre_piloto, promedio_puntos
 FROM top_3_promedio_puntos;