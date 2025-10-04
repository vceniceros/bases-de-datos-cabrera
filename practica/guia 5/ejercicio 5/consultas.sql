-- Obtener los datos de los clientes, ordenados por apellido

SELECT * FROM clientes ORDER BY apellido ASC;

-- Obtener los fabricantes tales que la ferretería no vendió ninguno de sus artículos

SELECT f.razon_social 
FROM fabricantes AS f
JOIN articulos AS a 
ON f.codigo_fabricante = a.codigo_fabricante
LEFT OUTER JOIN venta AS v
ON v.codigo_articulo = a.codigo_articulo
WHERE v.codigo_articulo IS NULL
GROUP BY f.razon_social;

-- Obtener el importe total de ventas agrupado por cliente, para el día de hoy

SELECT c.dni_cliente,c.nombre, c.apellido, 
SUM(v.cantidad * a.precio) AS importe_hoy
FROM venta AS v
JOIN clientes AS c
on v.dni_cliente = c.dni_cliente
JOIN articulos AS a
ON v.codigo_articulo = a.codigo_articulo
WHERE v.fecha = '2025-01-10'
GROUP BY c.dni_cliente, c.nombre, c.apellido
ORDER BY importe_hoy DESC;

-- Obtener los artículos más caros de cada fabricante.

SELECT a.nombre, f.razon_social
FROM articulos AS a 

