-- Obtener las ventas totales de funciones y combos (mostrar campos dni_cliente, y precios).

SELECT dni_cliente, precio,SUM(precio) AS ventas_totales
FROM ventas_funciones
GROUP BY dni_cliente, precio;

SELECT vf.dni_cliente, vf.precio, vc.dni_cliente, vc.precio, SUM(vf.precio) AS ventas_totales_funciones, SUM(vc.precio) AS ventas_totales_combos
FROM ventas_funciones AS vf
JOIN ventas_combos AS vc
ON vf.dni_cliente = vc.dni_cliente
GROUP BY vf.dni_cliente, vf.precio, vc.dni_cliente, vc.precio;

-- Obtener los clientes (dni_cliente, nombre, apellido) que más entradas de cine compraron.


-- obtengo la cantidad de compras por cliente
SELECT vf.dni_cliente, count(vf.dni_cliente) AS cantidad_compras
FROM ventas_funciones AS vf
GROUP BY vf.dni_cliente
ORDER BY COUNT(vf.dni_cliente) DESC; 

-- obtengo los clientes que compraron en si

SELECT vf.dni_cliente, c.nombre, c.apellido
FROM ventas_funciones AS vf
JOIN clientes_vip AS c
ON vf.dni_cliente = c.dni
GROUP BY vf.dni_cliente, c.nombre, c.apellido
ORDER BY COUNT(vf.dni_cliente) DESC
LIMIT 2;

-- Obtener los clientes (dni_cliente, nombre, apellido) que más combos compraron.

SELECT vc.dni_cliente, c.nombre, c.apellido, COUNT(vc.dni_cliente) AS combos_comprados
FROM ventas_combos AS vc
JOIN clientes_vip AS c
ON vc.dni_cliente = c.dni
GROUP BY vc.dni_cliente, c.nombre, c.apellido
ORDER BY COUNT(vc.dni_cliente) DESC
LIMIT 2;

-- Obtener los clientes (dni_cliente, nombre, apellido) que compraron entradas de cine y combos.

SELECT vc.dni_cliente, c.nombre, c.apellido, COUNT(vf.dni_cliente) AS compra_funciones, COUNT(vc.dni_cliente) AS compras_combos
FROM ventas_combos AS vc
JOIN ventas_funciones AS vf
ON vc.dni_cliente = vf.dni_cliente
JOIN clientes_vip AS c
ON vc.dni_cliente = c.dni
GROUP BY vc.dni_cliente, c.nombre, c.apellido, vf.dni_cliente
ORDER BY COUNT(vc.dni_cliente), COUNT(vf.dni_cliente) DESC;

-- Obtener los días y horarios de las funciones con menor precio.

SELECT f.dia, f.hora, MIN(precio) AS PRECIO_MAS_BAJO
FROM funciones AS f
GROUP BY f.dia, f.hora
ORDER BY MIN(precio) ASC
LIMIT 5;

-- Obtener un listado con la cantidad de películas por género, ordenada de manera descendente.

SELECT p.genero, COUNT(p.genero) AS pelicula_del_genero
FROM peliculas AS p
GROUP BY p.genero
ORDER BY COUNT(p.genero) DESC;

-- Obtener los actores que más participaron en películas.

SELECT a.nombre_actor, COUNT(DISTINCT a.nombre_pelicula) AS cantidad_peliculas
FROM actores AS a
GROUP BY a.nombre_actor
ORDER BY COUNT(DISTINCT a.nombre_pelicula) DESC;