-- Obtener el número de socio, el nombre y el apellido de aquellos socios que no realizan ningún deporte.

SELECT s.numero_socio, s.nombre, s.apellido FROM socios AS s
LEFT JOIN socios_deportes sd ON s.numero_socio = sd.numero_socio WHERE sd.numero_socio IS NULL;

-- Obtener el número de socio, el nombre y el apellido de aquellos socios que realizan la máxima cantidad de deportes.

SELECT s.numero_socio, s.nombre, s.apellido, COUNT(sd.nombre_deporte) AS total_deporte FROM socios AS s
LEFT JOIN socios_deportes sd ON s.numero_socio = sd.numero_socio GROUP BY s.numero_socio, s.nombre, s.apellido ORDER BY total_deporte DESC