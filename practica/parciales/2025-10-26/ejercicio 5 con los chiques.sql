CREATE SCHEMA hotel;

SET search_path  TO hotel;

CREATE TABLE Habitaciones(
    numero int primary key,
    tipo char(20) not null,
    capacidad int not null
);

CREATE TABLE Huespedes(
    dni int primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    fecha_nacimiento date
);

CREATE TABLE Reservas(
    numero_habitacion int,
    dni int,
    fecha_inicio_estadio date,
    cantidad_dias int not null,
    primary key (numero_habitacion, dni, fecha_inicio_estadio, cantidad_dias),
    foreign key (numero_habitacion) REFERENCES Habitaciones(numero),
    foreign key (dni) REFERENCES Huespedes(dni)
);

CREATE TABLE Servicios_Habitaciones (
    fecha_y_hora date,
    dni int,
    numero_habitacion int,
    descripcion VARCHAR(200) not null,
    primary key (fecha_y_hora, dni, numero_habitacion),
    foreign key (numero_habitacion) REFERENCES Habitaciones(numero),
    foreign key (dni) REFERENCES Huespedes(dni)
);

INSERT INTO Habitaciones (numero, tipo, capacidad) VALUES
(101, 'Single', 1),
(102, 'Doble', 2),
(103, 'Suite', 4),
(104, 'Triple', 3),
(105, 'Doble', 2);

INSERT INTO Huespedes (dni, nombre, apellido, fecha_nacimiento) VALUES
(30111222, 'Juan', 'Pérez', '1985-06-12'),
(29888111, 'Lucía', 'Gómez', '1990-09-03'),
(32555777, 'Carlos', 'López', '1978-02-22'),
(40111222, 'María', 'Fernández', '1995-11-10'),
(35666777, 'Sofía', 'Martínez', '1988-04-05'),
(35666778, 'Manuel', 'Pato', '2003-12-30');

INSERT INTO Reservas (numero_habitacion, dni, fecha_inicio_estadio, cantidad_dias) VALUES
(105, 35666777, '2025-11-04', 4),
(101, 35666777, '2025-11-03', 4),
(101, 35666777, '2025-11-02', 4);

INSERT INTO Servicios_Habitaciones (fecha_y_hora, dni, numero_habitacion, descripcion) VALUES
('2025-10-21', 30111222, 101, 'Servicio de desayuno a la habitación'),
('2025-10-22', 30111222, 101, 'Limpieza diaria'),
('2025-10-23', 30111222, 101, 'Cambio de sábanas'),
('2025-10-23', 29888111, 102, 'Servicio de lavandería'),
('2025-10-26', 32555777, 103, 'Reabastecimiento de minibar'),
('2025-10-27', 32555777, 103, 'Mantenimiento de jacuzzi'),
('2025-10-29', 40111222, 104, 'Desayuno continental'),
('2025-11-02', 35666777, 105, 'Limpieza y cambio de toallas'),
('2025-11-03', 35666777, 105, 'Servicio de masajes en habitación');


-- realizar un sql que obtenga el nombre y apellido de huespedes que nunca hayan pedido servicio a la habitacion
SELECT h.nombre, h.apellido
FROM Huespedes AS h
WHERE h.dni NOT IN (
    SELECT sh.dni
    FROM Servicios_Habitaciones AS sh
    );

SELECT h.nombre, h.apellido
FROM Huespedes AS h
LEFT JOIN Servicios_Habitaciones AS sh
ON sh.dni = h.dni
WHERE sh.dni IS NULL;


SELECT DISTINCT h.nombre, h.apellido
FROM Huespedes AS h
NATURAL JOIN Servicios_Habitaciones AS sh;

--realiza una consulta sql que obtenga las habitaciones con mayor cantidad total de dias reservados
WITH cantidad_de_dias_reservados_por_habitacion(nro_habitacion, cantidad_dias_reservados) AS (
    SELECT r.numero_habitacion, SUM(r.cantidad_dias)
    FROM Reservas AS r
    GROUP BY r.numero_habitacion
)SELECT nro_habitacion, cantidad_dias_reservados
 FROM cantidad_de_dias_reservados_por_habitacion;



-- obtengo la habitacion con la cantidad de dias reservados
WITH cantidad_de_dias_reservados_por_habitacion(nro_habitacion, cantidad_dias_reservados) AS (
    SELECT r.numero_habitacion, SUM(r.cantidad_dias)
    FROM Reservas AS r
    GROUP BY r.numero_habitacion
)SELECT nro_habitacion, cantidad_dias_reservados
 FROM cantidad_de_dias_reservados_por_habitacion;

--realiza una consulta sql que obtenga las habitaciones con mayor cantidad total de dias reservados

WITH cantidad_de_dias_reservados_por_habitacion(nro_habitacion, cantidad_dias_reservados) AS (
    SELECT r.numero_habitacion, SUM(r.cantidad_dias)
    FROM Reservas AS r
    GROUP BY r.numero_habitacion
)SELECT h.*
FROM Habitaciones AS  h
JOIN cantidad_de_dias_reservados_por_habitacion as ch
ON ch.nro_habitacion = h.numero
WHERE ch.cantidad_dias_reservados = (
SELECT MAX(ch2.cantidad_dias_reservados)
FROM cantidad_de_dias_reservados_por_habitacion AS ch2);





CREATE SCHEMA relojeria;

SET search_path TO relojeria;

CREATE TABLE Clientes (
    dni INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL
);

CREATE TABLE Ventas_Reparaciones (
    dni_cliente INT,
    marca_reloj VARCHAR(100),
    modelo_reloj VARCHAR(100),
    fecha_inicio DATE,
    fecha_entrega DATE,
    precio_reparacion DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (dni_cliente, marca_reloj, modelo_reloj, fecha_inicio),

    FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
);

CREATE TABLE Ventas_Relojes (
    dni_cliente INT,
    marca_reloj VARCHAR(100),
    modelo_reloj VARCHAR(100),
    fecha DATE,
    precio_reloj DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (dni_cliente, marca_reloj, modelo_reloj, fecha),

    FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
);

INSERT INTO Clientes (dni, nombre, apellido) VALUES
(11111111, 'Ana', 'García'),
(20900100, 'Luis', 'Martínez'),
(33333333, 'Sofía', 'Rodríguez');


INSERT INTO Ventas_Reparaciones (dni_cliente, marca_reloj, modelo_reloj, fecha_inicio, fecha_entrega, precio_reparacion) VALUES
(11111111, 'Rolex', 'Submariner', '2024-05-10', '2024-05-15', 350.00),
(20900100, 'Casio', 'G-Shock-700', '2024-06-01', '2024-06-05', 85.50),
(33333333, 'Omega', 'Seamaster', '2024-07-20', '2024-07-25', 180.00);


INSERT INTO Ventas_Reparaciones (dni_cliente, marca_reloj, modelo_reloj, fecha_inicio, fecha_entrega, precio_reparacion) VALUES


INSERT INTO Ventas_Relojes (dni_cliente, marca_reloj, modelo_reloj, fecha, precio_reloj) VALUES
(20900100, 'Tissot', 'PRX Automatic', '2024-08-01', 699.99),
(20900100, 'Casio', 'Digital F-91W', '2024-09-01', 25.00);

-- realizar una consulta sql que obtenga el nombre y el apellido de los clientes que compraron al menos unn reljo pero no reapararon nada

SELECT c.nombre, c.apellido
FROM Clientes AS c
WHERE c.dni NOT IN (SELECT vr.dni_cliente
FROM Ventas_Reparaciones AS vr) AND
c.dni IN (SELECT ver.dni_cliente
FROM Ventas_Relojes AS ver);

-- realizar una consulta sql que obtenga el monto total recaudado a partir de ventas de reljos y reparaciones hechas al cliente con dni = 11111111

WITH monto_relojes_por_cliente(dni, monto_por_relojes) AS (
    SELECT ver.dni_cliente, SUM(ver.precio_reloj)
    FROM Ventas_Relojes AS ver
    GROUP BY  ver.dni_cliente
)SELECT * FROM monto_relojes_por_cliente
WHERE dni = 20900100;

WITH montos_totales(dni, monto_totales) AS (
    SELECT ver.dni_cliente, ver.precio_reloj
    FROM Ventas_Relojes AS ver
    WHERE dni_cliente = 20900100
    UNION ALL
    SELECT vr.dni_cliente, vr.precio_reparacion
    FROM Ventas_Reparaciones as vr
    WHERE dni_cliente = 20900100
)SELECT dni, SUM(monto_totales) FROM montos_totales
GROUP BY dni;



WITH montos_totales(dni, monto_totales) AS (
    SELECT ver.dni_cliente, ver.precio_reloj
    FROM Ventas_Relojes AS ver

    UNION ALL
    SELECT vr.dni_cliente, vr.precio_reparacion
    FROM Ventas_Reparaciones as vr

)SELECT dni, SUM(monto_totales) FROM montos_totales
GROUP BY dni;