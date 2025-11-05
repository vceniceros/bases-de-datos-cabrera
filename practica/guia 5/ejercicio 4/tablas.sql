CREATE SCHEMA colectivos;
SET search_path TO colectivos;

CREATE TABLE Colectivos(
    numero_coche int PRIMARY KEY,
    marca_moto VARCHAR(50) NOT NULL,
    marca_chasis VARCHAR(50) NOT NULL,
    modelo int NOT NULL
);

CREATE TABLE Choferes(
    dni int PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    numero_coche int NOT NULL,
    FOREIGN KEY (numero_coche) REFERENCES Colectivos(numero_coche)
);

CREATE TABLE Asignaciones_turnos(
    dni_chofer int NOT NULL,
    dia DATE NOT NULL,
    turno VARCHAR(1) NOT NULL CHECK (turno IN ('M', 'T', 'N')),
    PRIMARY KEY (dni_chofer, dia, turno),
    FOREIGN KEY (dni_chofer) REFERENCES Choferes(dni)
);

INSERT INTO Colectivos (numero_coche, marca_moto, marca_chasis, modelo) VALUES
(1001, 'Mercedes-Benz', 'Volvo', 2020),
(1002, 'Scania', 'MAN', 2012),
(1003, 'Iveco', 'DAF', 2021),
(1004, 'Volvo', 'Mercedes-Benz', 2018),
(1005, 'MAN', 'Scania', 2010);

INSERT INTO Choferes (dni, nombre, apellido, numero_coche) VALUES
(12345678, 'Luis', 'Garcia', 1001),
(87654321, 'Sofia', 'Lopez', 1002),
(11223344, 'Miguel', 'Fernandez', 1003),
(44332211, 'Laura', 'Martinez', 1004),
(55667788, 'Diego', 'Sanchez', 1005);


INSERT INTO Asignaciones_turnos (dni_chofer, dia, turno) VALUES
(12345678, '2025-11-01', 'M'),
(12345678, '2025-11-01', 'T'),
(87654321, '2025-11-01', 'N'),
(11223344, '2025-11-02', 'M'),
(44332211, '2025-11-02', 'T'),
(55667788, '2025-11-02', 'N'),
(12345678, '2025-11-03', 'M'),
(87654321, '2025-11-03', 'T'),
(11223344, '2025-11-03', 'N');

SELECT COUNT(c.dni) AS cant_choferes, t.turno
FROM Choferes AS c
JOIN Asignaciones_turnos AS t
ON t.dni_chofer = c.dni
GROUP BY t.turno;