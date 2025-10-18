CREATE SCHEMA agroFiuba;

SET search_path TO agroFiuba;

CREATE TABLE Productos (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  tipo VARCHAR(50),
  unidad VARCHAR(20)
);

INSERT INTO Productos (id, nombre, tipo, unidad) VALUES
(1, 'Maíz', 'Grano', 'tn'),
(2, 'Trigo', 'Grano', 'tn'),
(3, 'Soja', 'Grano', 'tn'),
(4, 'Glifosato', 'Herbicida', 'litros');

CREATE TABLE Cultivos (
  id INT PRIMARY KEY,
  id_producto INT,
  fecha_siembra DATE,
  fecha_cosecha DATE,
  area_hectareas DECIMAL(10,2),
  FOREIGN KEY (id_producto) REFERENCES Productos(id)
);


INSERT INTO Cultivos (id, id_producto, fecha_siembra, fecha_cosecha, area_hectareas) VALUES
(10, 1, '2010-08-15', '2011-02-20', 520.23),
(11, 1, '2019-09-12', '2020-03-05', 220.42),
(12, 1, '2020-09-10', '2021-03-20', 240.32),
(13, 2, '2020-07-01', '2020-12-30', 300.67),
(14, 3, '2018-10-10', '2019-04-12', 180.10),
(15, 3, '2019-11-05', '2020-05-10', 210.55);


CREATE TABLE Empleados (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  fecha_contratacion DATE,
  puesto VARCHAR(50),
  salario DECIMAL(12,2)
);

INSERT INTO Empleados (id, nombre, apellido, fecha_contratacion, puesto, salario) VALUES
(1, 'Cosme', 'Fulanito', '2023-01-10', 'Supervisor', 800000),
(2, 'Eleanor', 'Abernathy', '2023-02-10', 'Empleado', 500000),
(3, 'Rodolfo', 'Langostino', '2022-05-11', 'Empleado', 480000),
(4, 'Marge', 'Simpson', '2022-07-19', 'Empleado', 520000),
(5, 'Lenny', 'Leonard', '2023-03-10', 'Empleado', 490000),
(6, 'Carl', 'Carlson', '2023-04-15', 'Empleado', 495000),
(7, 'Apu', 'Nahasapeemapetilon', '2022-08-01', 'Empleado', 510000),
(8, 'Barney', 'Gumble', '2023-01-09', 'Empleado', 470000),
(9, 'Moe', 'Szyslak', '2022-09-05', 'Empleado', 460000),
(10, 'Edna', 'Krabappel', '2023-02-22', 'Empleado', 505000);


CREATE TABLE Inventario (
  id INT PRIMARY KEY,
  id_producto INT,
  cantidad DECIMAL(10,2),
  precio_unitario DECIMAL(10,2),
  FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

INSERT INTO Inventario (id, id_producto, cantidad, precio_unitario) VALUES
(101, 1, 10000, 220),
(102, 2, 5000, 180),
(103, 3, 8000, 200),
(104, 4, 20000, 310);

CREATE TABLE Ventas (
  id INT PRIMARY KEY,
  id_inventario INT,
  cantidad_vendida DECIMAL(10,2),
  fecha_venta DATE,
  id_empleado INT,
  FOREIGN KEY (id_inventario) REFERENCES Inventario(id),
  FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
);

INSERT INTO Ventas (id, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES
(290, 101, 200, '2010-09-15', 2),
(291, 103, 150, '2011-08-11', 3),
(292, 101, 180, '2014-07-05', 4),
(293, 102, 300, '2015-07-15', 5),
(294, 103, 100, '2016-08-01', 6),
(295, 103, 80, '2016-09-20', 7),
(296, 104, 500, '2016-09-22', 1), 
(297, 101, 250, '2018-10-10', 8),
(298, 102, 50, '2018-07-30', 9),
(299, 101, 75, '2020-06-10', 10);