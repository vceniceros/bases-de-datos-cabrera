CREATE SCHEMA agroFiuba;

SET search_path TO agroFiuba;

CREATE TABLE productos(
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    unidad VARCHAR(20) NOT NULL
);

CREATE TABLE cultivos(
    id INT PRIMARY KEY,
    id_producto INT NOT NULL,
    fecha_siembra DATE NOT NULL,
    fecha_cosecha DATE,
    area_hectareas DECIMAL(100,2) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

CREATE TABLE empleados(
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    puesto VARCHAR(50) NOT NULL
    salario DECIMAL(100,2) NOT NULL
);

CREATE TABLE inventario(
    id INT PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(100,2) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

CREATE TABLE ventas(
    id INT PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad_vendida INT NOT NULL,
    fecha_venta DATE NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id)
);



-- obtener primero el promedio de hectareas de un producto durante un año

--WITH promedio_hectareas_por_anio(año, nombre_producto, promedio_hectareas)(

--)--

SELECT c.id_producto, DATE_PART('YEAR', c.fecha_siembra) AS AÑO, AVG(c.area_hectareas) AS promedio_hectareas
FROM cultivos AS c
WHERE DATE_PART('YEAR', c.fecha_siembra) <= 2020 AND DATE_PART('YEAR', c.fecha_siembra) >= 2010
GROUP BY c.id_producto,c.fecha_siembra;


WITH promedio_hectareas_por_anio(año, nombre_producto, promedio_hectareas) AS (
    SELECT DATE_PART('YEAR', c.fecha_siembra), p.nombre, AVG(c.area_hectareas)
    FROM cultivos AS c
    JOIN productos AS p
    on p.id = c.id_producto
    WHERE DATE_PART('YEAR', c.fecha_siembra) <= 2020 AND DATE_PART('YEAR', c.fecha_siembra) >= 2010 and p.nombre != 'herbicidas'
    GROUP BY p.nombre, c.fecha_siembra
)
SELECT año, nombre_producto, promedio_hectareas FROM promedio_hectareas_por_anio;


--obtener la menor cantidad de productos vendidos

SELECT MIN(i.cantidad), v.id_empleado 
FROM ventas AS v
JOIN inventario AS i
ON i.id = v.id_inventario
WHERE DATE_PART('YEAR', v.fecha_venta) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY v.id_empleado;