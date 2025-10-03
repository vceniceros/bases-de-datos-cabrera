-- Obtener el número de socio, el nombre y el apellido de aquellos socios que no realizan ningún deporte.

SELECT s.numero_socio, s.nombre, s.apellido FROM socios AS s
LEFT JOIN socios_deportes sd ON s.numero_socio = sd.numero_socio WHERE sd.numero_socio IS NULL;

-- Obtener el número de socio, el nombre y el apellido de aquellos socios que realizan la máxima cantidad de deportes.

SELECT s.numero_socio, s.nombre, s.apellido, COUNT(sd.nombre_deporte) AS total_deporte FROM socios AS s
LEFT JOIN socios_deportes sd ON s.numero_socio = sd.numero_socio GROUP BY s.numero_socio, s.nombre, s.apellido ORDER BY total_deporte DESC

SELECT sd.numero_socio 
FROM socios_deportes AS sd 
GROUP BY sd.numero_socio 
HAVING COUNT(sd.nombre_deporte) = (
   SELECT COUNT(nombre_deporte)
    FROM socios_deportes
    GROUP BY numero_socio
    ORDER BY COUNT(nombre_deporte) DESC
    LIMIT 1
);


SELECT s.numero_socio, s.nombre, s.apellido
FROM socios AS s
JOIN socios_deportes AS sd ON s.numero_socio = sd.numero_socio
GROUP BY s.numero_socio, s.nombre, s.apellido
HAVING COUNT(sd.nombre_deporte) = (
    SELECT COUNT(nombre_deporte)
    FROM socios_deportes
    GROUP BY numero_socio
    ORDER BY COUNT(nombre_deporte) DESC
    LIMIT 1
);

-- Obtener la cantidad de deportes que se realizan en el club

SELECT COUNT(*) FROM deportes;

-- Obtener los deportes que poseen la mayor cantidad de jugadores por equip

SELECT MAX(cantidad_de_jugadores_por_equipo) FROM deportes;


SELECT * FROM deportes
WHERE cantidad_de_jugadores_por_equipo = (
    SELECT MAX(cantidad_de_jugadores_por_equipo) FROM deportes
);

-- Obtener el número promedio de jugadores por equipo de los deportes

SELECT AVG(cantidad_de_jugadores_por_equipo) FROM deportes;

-- Contar la cantidad de socios que realizan al menos dos deportes

SELECT COUNT(*) FROM (
    SELECT numero_socio FROM socios_deportes
    GROUP BY numero_socio
    HAVING COUNT(nombre_deporte) >= 2
) AS subconsulta;