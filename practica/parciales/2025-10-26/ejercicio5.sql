CREATE SCHEMA hotel;

SET search_path TO hotel;

CREATE TABLE Habitacion(
    numero INT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL
);

CREATE TABLE Huespedes(
    dni int PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE Reservas(
    numero_habitacion INT NOT NULL,
    dni_huesped INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    cantidad_noches INT NOT NULL,
    PRIMARY KEY (numero_habitacion, dni_huesped, fecha_inicio),
    FOREIGN KEY (numero_habitacion) REFERENCES Habitacion(numero),
    FOREIGN KEY (dni_huesped) REFERENCES Huespedes(dni)
);

CREATE TABLE Servicios_habitacion(
    fecha_y_hora TIMESTAMP NOT NULL,
    numero_habitacion INT NOT NULL,
    dni_huesped INT NOT NULL,
    descripcion_servicio VARCHAR(255) NOT NULL,
    PRIMARY KEY (fecha_y_hora, numero_habitacion, dni_huesped),
    FOREIGN KEY (numero_habitacion) REFERENCES Habitacion(numero),
    FOREIGN KEY (dni_huesped) REFERENCES Huespedes(dni)
);

INSERT INTO Habitacion (numero, tipo, capacidad) VALUES
(101, 'Individual', 1),
(102, 'Doble', 2),
(201, 'Suite', 4);

INSERT INTO Huespedes (dni, nombre, apellido, fecha_nacimiento) VALUES
(12345678, 'Juan', 'Perez', '1985-05-15'),
(87654321, 'Maria', 'Gomez', '1990-08-22'),
(11223344, 'Carlos', 'Lopez', '1978-12-03'),
(44332211, 'Ana', 'Martinez', '1995-03-30');

INSERT INTO Reservas (numero_habitacion, dni_huesped, fecha_inicio, cantidad_noches) VALUES
(101, 12345678, '2025-11-01', 3),
(102, 87654321, '2025-11-05', 2),
(201, 11223344, '2025-11-10', 5);

INSERT INTO Servicios_habitacion (fecha_y_hora, numero_habitacion, dni_huesped, descripcion_servicio) VALUES
('2025-11-01 10:00:00', 101, 12345678, 'Limpieza diaria'),
('2025-11-02 14:00:00', 101, 12345678, 'Servicio de desayuno en la habitación'),
('2025-11-05 09:00:00', 102, 87654321, 'Limpieza diaria'),
('2025-11-10 18:00:00', 201, 11223344, 'Servicio de spa en la habitación');

SELECT h.nombre, h.apellido
FROM Huespedes AS h
LEFT OUTER JOIN Servicios_habitacion AS sh 
ON sh.dni_huesped = h.dni
WHERE sh.dni_huesped IS NULL
GROUP BY h.nombre, h.apellido;

SELECT h.nombre, h.apellido
FROM Huespedes AS h
WHERE h.dni NOT IN (
    SELECT sh.dni_huesped
    FROM Servicios_habitacion AS sh
);

WITH habitaciones_mas_reservadas(numero_habitacion, total_reservas) AS (
    SELECT r.numero_habitacion, r.cantidad_noches
    FROM Reservas AS r
    WHERE r.cantidad_noches = (
        SELECT MAX(r2.cantidad_noches)
        FROM Reservas AS r2
    )
)
SELECT numero_habitacion, total_reservas
FROM habitaciones_mas_reservadas;
