-- Se necesita un informe por cada año y producto que refleje: el año, el nombre del
-- producto y el promedio de hectáreas utilizadas por cada producto en ese año. El informe debe
--abarcar desde el año 2010 hasta el año 2020 y se deben omitir los herbicidas.

SELECT DATE_PART('YEAR', v.fecha_venta) AS ANIO, p.nombre, AVG(c.area_hectareas) AS HECTAREAS
FROM ventas AS v
JOIN Inventario AS i
ON v.id_inventario = i.id
JOIN Productos AS p 
ON i.id_producto = p.id 
JOIN Cultivos AS c 
ON c.id_producto = p.id
WHERE p.tipo <> 'Herbicida'
GROUP BY DATE_PART('YEAR', v.fecha_venta), p.nombre
HAVING DATE_PART('YEAR', v.fecha_venta) >= 2015 AND DATE_PART('YEAR', v.fecha_venta) <= 2020
ORDER BY AVG(c.area_hectareas) DESC;


-- 1.2 (SQL) Se necesita saber el rendimiento de los empleados (no supervisores u otro puesto). 
-- Se pide obtener los 10  "empleados" con la menor cantidad de productos vendidos en el último año. Pero 
-- se requiere que se muestren sólo los empleados que tienen menos de 3 años en la empresa.

SELECT e.nombre, e.apellido, COUNT(v.id_empleado) AS cantidad_ventas
FROM Empleados AS e
JOIN Ventas AS v
ON v.id_empleado = e.id
GROUP BY e.id, e.nombre, e.apellido, e.fecha_contratacion
HAVING DATE_PART('YEAR', CURRENT_DATE) - DATE_PART('YEAR', e.fecha_contratacion) <= 3
ORDER BY cantidad_ventas ASC
LIMIT 10;