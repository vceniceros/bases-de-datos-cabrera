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
WHERE v.fecha = '2025-10-04'
GROUP BY c.dni_cliente, c.nombre, c.apellido
ORDER BY importe_hoy DESC;

-- Obtener los artículos más caros de cada fabricante.

SELECT a.nombre, f.razon_social, a.precio
FROM articulos AS a
LEFT OUTER JOIN fabricantes AS f
ON a.codigo_fabricante = f.codigo_fabricante
WHERE a.precio = (
    SELECT MAX(a2.precio) FROM articulos AS a2
        WHERE a2.codigo_fabricante = a.codigo_fabricante 
    );

-- Obtener los clientes que compraron los artículos con nombre “tornillos”, o “clavos”.

SELECT c.nombre
FROM clientes AS c
LEFT OUTER JOIN venta AS v
ON c.dni_cliente = v.dni_cliente
WHERE(v.codigo_articulo IN (
    SELECT a1.codigo_articulo FROM articulos AS a1
    WHERE(a1.nombre LIKE '%Tornillos%' OR a1.nombre LIKE '%Clavos%')
));

-- Obtener un reporte de ventas, con los siguientes campos:
-- ◦ Fecha de venta.
-- ◦ Nombre y apellido del cliente.
--◦ Nombre del artículo.
--◦ Cantidad comprada.
--◦ Precio del artículo.
--◦ Razón social del fabricante del artículo.

SELECT v.fecha, c.nombre, c.apellido, a.nombre, v.cantidad, a.precio, f.razon_social
FROM venta AS v
JOIN clientes AS c ON v.dni_cliente = c.dni_cliente
JOIN articulos AS a ON v.codigo_articulo = a.codigo_articulo
JOIN fabricantes AS f ON a.codigo_fabricante = f.codigo_fabricante      
ORDER BY v.fecha DESC, c.apellido, c.nombre;