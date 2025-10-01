SELECT COUNT(*) FROM empleados;
SELECT * FROM empleados ORDER BY nombre ASC;

SELECT s.nombre_sucursal 
FROM sucursales s 
LEFT OUTER JOIN barrio b
ON s.nombre = b.nombre
WHERE b.nombre LIKE 'la boca';

SELECT s.nombre_sucursal 
FROM sucursales s 
RIGHT OUTER JOIN barrio b
ON s.nombre = b.nombre
WHERE b.nombre LIKE 'la boca';


SELECT b.nombre
FROM barrio b
JOIN sucursales s 
ON s.nombre = b.nombre
WHERE s.nombre LIKE 'pepito de la boca';

SELECT b.nombre
FROM barrio AS b
LEFT JOIN sucursales AS s 
ON b.nombre = s.nombre
WHERE s.nombre_sucursal IS NULL;

SELECT
    B.nombre AS barrio,
    COUNT(S.nombre_sucursal) AS total_sucursales
FROM
    barrio AS B
JOIN
    sucursales AS S ON B.nombre = S.nombre
GROUP BY
    B.nombre
ORDER BY
    total_sucursales DESC;

SELECT *
FROM combos
WHERE precio IN (
    SELECT precio
    FROM combos
    GROUP BY precio
    HAVING COUNT(*) > 1
);