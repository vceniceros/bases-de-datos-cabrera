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

SELECT c.dni, c.nombre, c.apellido, count(v.dni_cliente) AS total_entradas
FROM clientes_vip AS c
JOIN ventas_funciones AS v
ON v.dni_cliente = c.dni
GROUP BY c.dni, c.nombre, c.apellido
HAVING total_entradas = (
    SELECT MAX(total_entradas)
    FROM (
        SELECT count(v2.dni_cliente) AS total_entradas
        FROM clientes_vip AS c2
        JOIN ventas_funciones AS v2
        ON v2.dni_cliente = c2.dni
        GROUP BY c2.dni
    )AS subquery 
);
