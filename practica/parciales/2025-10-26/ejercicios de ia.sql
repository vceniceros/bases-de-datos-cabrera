-- Una editorial utiliza una base de datos para gestionar sus libros, autores y ventas.
-- Se tienen los siguientes esquemas:

-- Libros:
-- { isbn, titulo, año_publicacion,dni }

-- Autores:
-- {dni, nombre, apellido }

-- Ventas:
-- { isbn, fecha_venta, cantidad }

CREATE SCHEMA libreria;

SET search_path TO libreria;

CREATE TABLE Autores (
    dni INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

CREATE TABLE Libros (
    isbn VARCHAR(20) PRIMARY KEY,
    titulo VARCHAR(100),
    año_publicacion INT,
    dni_autores INT REFERENCES Autores(dni)
);

CREATE TABLE Ventas (
    isbn VARCHAR(20) REFERENCES Libros(isbn),
    fecha_venta DATE,
    cantidad INT
);

INSERT INTO Autores VALUES
(11111111, 'Laura', 'Gómez'),
(22222222, 'Julián', 'Pérez'),
(33333333, 'Marina', 'Suárez'),
(44444444, 'Carlos', 'Martínez'),
(55555555, 'Ana', 'Rodríguez');

INSERT INTO Libros VALUES
('978-1', 'El viaje de los mares', 2010, 11111111),
('978-2', 'Sombras del viento', 2015, 11111111),
('978-3', 'Inteligencia Urbana', 2020, 22222222),
('978-4', 'Caminos de la memoria', 2018, 33333333),
('978-5', 'Historias perdidas', 2022, 44444444);

INSERT INTO Ventas VALUES
('978-1', '2024-01-10', 5),
('978-1', '2024-02-20', 3),
('978-2', '2024-03-15', 10),
('978-3', '2024-02-11', 4),
('978-3', '2024-04-01', 6),
('978-4', '2024-05-19', 2);


--a) Escribir una consulta SQL que obtenga los
-- nombres y apellidos de los autores cuyos libros nunca fueron vendidos.
SELECT a.nombre, a.apellido
FROM Autores as a
JOIN Libros as l
ON a.dni = l.dni_autores
WHERE L.isbn NOT IN(
    SELECT v.isbn
    FROM Ventas as v
);

SELECT a.nombre, a.apellido
FROM Autores as a
JOIN Libros as l
ON a.dni = l.dni_autores
LEFT JOIN Ventas AS v
ON v.isbn = l.isbn
WHERE v.isbn IS NULL;

--b) Escribir una consulta SQL que obtenga el libro con mayor cantidad total de ejemplares vendidos.
WITH best_seller(isbn, cantidad_vendida) AS(
    SELECT v.isbn, SUM(v.cantidad)
    FROM Ventas AS v
    GROUP BY v.isbn
)SELECT isbn, cantidad_vendida FROM best_seller;

WITH best_seller(isbn, cantidad_vendida) AS(
    SELECT v.isbn, SUM(v.cantidad)
    FROM Ventas AS v
    GROUP BY v.isbn
)SELECT l.*
FROM Libros AS l
JOIN best_seller AS bs
ON bs.isbn = l.isbn
WHERE bs.cantidad_vendida = (
    SELECT MAX(cantidad_vendida)
    FROM best_seller
    );


CREATE SCHEMA streaming;

SET search_path TO streaming;


CREATE TABLE Series (
    id_serie INT PRIMARY KEY,
    titulo VARCHAR(100),
    año_estreno INT
);

CREATE TABLE Capitulos (
    id_capitulo INT PRIMARY KEY,
    id_serie INT,
    numero INT,
    titulo VARCHAR(100),
    FOREIGN KEY (id_serie) REFERENCES Series(id_serie)
);

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

CREATE TABLE Reproducciones (
    id_usuario INT,
    id_capitulo INT,
    fecha DATE,
    minutos_vistos INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_capitulo) REFERENCES Capitulos(id_capitulo)
);


INSERT INTO Series VALUES
(1, 'The Last Kingdom', 2015),
(2, 'Dark', 2017),
(3, 'Breaking Bad', 2008),
(4, 'Arcane', 2021),
(5, 'Sherlock', 2010);

INSERT INTO Capitulos VALUES
-- The Last Kingdom
(101, 1, 1, 'Episode 1'),
(102, 1, 2, 'Episode 2'),
(103, 1, 3, 'Episode 3'),

-- Dark
(201, 2, 1, 'Secrets'),
(202, 2, 2, 'Lies'),

-- Breaking Bad
(301, 3, 1, 'Pilot'),
(302, 3, 2, 'Cat''s in the Bag'),

-- Arcane
(401, 4, 1, 'Welcome to the Playground'),

-- Sherlock
(501, 5, 1, 'A Study in Pink');

INSERT INTO Usuarios VALUES
(10, 'Juan', 'Martinez'),
(11, 'Lucia', 'Gomez'),
(12, 'Martina', 'Perez'),
(13, 'Santiago', 'Rios');


INSERT INTO Reproducciones VALUES
-- Juan vio 3 series distintas (TLK, Dark, Arcane)
(10, 101, '2025-01-01', 45),
(10, 102, '2025-01-02', 48),
(10, 201, '2025-01-03', 50),
(10, 401, '2025-01-05', 41),

-- Lucia vio solo 1 serie (Breaking Bad)
(11, 301, '2025-02-01', 55),
(11, 302, '2025-02-02', 52),

-- Martina vio Sherlock y TLK (2 series)
(12, 501, '2025-03-01', 88),
(12, 101, '2025-03-02', 40),

-- Santiago vio Dark pero muy poco
(13, 201, '2025-04-01', 15);


-- a) Obtener el nombre y apellido de los usuarios que vieron capítulos de al menos 3 series distintas.

WITH series_por_usuario(id_usuario, id_serie) AS (
    SELECT u.id_usuario, s.id_serie
    FROM usuarios AS u
    JOIN reproducciones AS r
    ON r.id_usuario = u.id_usuario
    JOIN capitulos as c
    ON c.id_capitulo = r.id_capitulo
    JOIN Series S
    on c.id_serie = S.id_serie
)SELECT * FROM series_por_usuario;

WITH series_por_usuario(id_usuario, id_serie) AS (
    SELECT u.id_usuario, s.id_serie
    FROM usuarios AS u
    JOIN reproducciones AS r
    ON r.id_usuario = u.id_usuario
    JOIN capitulos as c
    ON c.id_capitulo = r.id_capitulo
    JOIN Series S
    on c.id_serie = S.id_serie
)SELECT u.*, count(DISTINCT su.id_serie) AS cantidad_series
FROM usuarios AS u
JOIN series_por_usuario as su
ON u.id_usuario = su.id_usuario
GROUP BY u.id_usuario
HAVING count(distinct su.id_serie) >= 3;


SELECT u.id_usuario, u.nombre, u.apellido,
       COUNT(DISTINCT c.id_serie) AS cantidad_series
FROM Usuarios u
JOIN Reproducciones r ON r.id_usuario = u.id_usuario
JOIN Capitulos c ON c.id_capitulo = r.id_capitulo
GROUP BY u.id_usuario
HAVING COUNT(DISTINCT c.id_serie) >= 3;

--Obtener el título de la serie cuyo promedio de minutos vistos por reproducción es el mayor.
WITH minutos_visto_por_serie(nombre_serie, minutos_vistos) AS (
    SELECT s.titulo, AVG(r.minutos_vistos)
    FROM series AS s
    JOIN Capitulos c
on s.id_serie = c.id_serie
    JOIN reproducciones r
    ON r.id_capitulo = c.id_capitulo
    GROUP BY s.titulo
    )SELECT * FROM minutos_visto_por_serie;


WITH minutos_visto_por_serie(nombre_serie, minutos_vistos) AS (
    SELECT s.titulo, AVG(r.minutos_vistos)
    FROM series AS s
    JOIN Capitulos c
on s.id_serie = c.id_serie
    JOIN reproducciones r
    ON r.id_capitulo = c.id_capitulo
    GROUP BY s.titulo
    )SELECT nombre_serie, minutos_vistos
    FROM minutos_visto_por_serie
    WHERE minutos_vistos = (SELECT MAX(minutos_vistos) FROM minutos_visto_por_serie );

-- Obtener los usuarios que nunca vieron una serie estrenada antes de 2010.
SELECT DISTINCT u.*, s.titulo
FROM usuarios as u
JOIN Reproducciones as r
ON u.id_usuario = r.id_usuario
JOIN Capitulos C on r.id_capitulo = C.id_capitulo
LEFT JOIN series s
ON s.id_serie = c.id_serie
WHERE s.año_estreno > 2010;

WITH series_estrenadas_pre_2010(titulo) AS(
    SELECT s.titulo
    FROM series as s
    WHERE s.año_estreno <= 2010
)SELECT DISTINCT u.*, s.titulo
FROM usuarios as u
JOIN Reproducciones as r
ON u.id_usuario = r.id_usuario
JOIN Capitulos C on r.id_capitulo = C.id_capitulo
LEFT JOIN series s
ON s.id_serie = c.id_serie
WHERE s.titulo not in (select titulo FROM series_estrenadas_pre_2010);

WITH series_por_usuario(id_usuario, titulo, año_estreno) AS (
    SELECT u.id_usuario, s.titulo, s.año_estreno
    FROM usuarios AS u
    JOIN reproducciones AS r
    ON r.id_usuario = u.id_usuario
    JOIN capitulos as c
    ON c.id_capitulo = r.id_capitulo
    JOIN Series S
    on c.id_serie = S.id_serie
)SELECT u.*, su.titulo, su.año_estreno
FROM usuarios as u
JOIN series_por_usuario AS su
ON u.id_usuario = su.id_usuario
WHERE año_estreno <= 2010;

SELECT u.id_usuario, u.nombre, u.apellido
FROM Usuarios u
WHERE u.id_usuario NOT IN (
    SELECT r.id_usuario
    FROM Reproducciones r
    JOIN Capitulos c ON c.id_capitulo = r.id_capitulo
    JOIN Series s ON s.id_serie = c.id_serie
    WHERE s.año_estreno < 2010
);


CREATE SCHEMA teatro;
SET search_path  TO teatro;


CREATE TABLE Obras (
    nombre_obra VARCHAR(100) PRIMARY KEY,
    genero VARCHAR(50)
);

CREATE TABLE Salas (
    nombre_sala VARCHAR(100) PRIMARY KEY,
    capacidad INT NOT NULL
);

CREATE TABLE Funciones (
    id_funcion int PRIMARY KEY,
    nombre_obra VARCHAR(100) REFERENCES Obras(nombre_obra),
    nombre_sala VARCHAR(100) REFERENCES Salas(nombre_sala),
    dia DATE,
    hora TIME
);

CREATE TABLE Entradas (
    dni_espectador int,
    id_funcion INT REFERENCES Funciones(id_funcion),
    precio NUMERIC(10,2),
    PRIMARY KEY (dni_espectador, id_funcion)
);

INSERT INTO Obras (nombre_obra, genero) VALUES
('Hamlet', 'Drama'),
('La Casa de Bernarda Alba', 'Drama'),
('El Avaro', 'Comedia'),
('Sueño de una Noche de Verano', 'Comedia');

INSERT INTO Salas (nombre_sala, capacidad) VALUES
('Sala Principal', 300),
('Sala Azul', 150),
('Sala Roja', 200);


INSERT INTO Funciones (id_funcion, nombre_obra, nombre_sala, dia, hora) VALUES
-- Hamlet (3 funciones)
(1,'Hamlet', 'Sala Principal', '2025-05-01', '20:00'),
(2,'Hamlet', 'Sala Azul',      '2025-05-03', '21:00'),
(3,'Hamlet', 'Sala Roja',      '2025-05-05', '19:00'),

-- Bernarda Alba (2 funciones)
(4,'La Casa de Bernarda Alba', 'Sala Azul', '2025-04-15', '20:00'),
(5,'La Casa de Bernarda Alba', 'Sala Azul', '2025-04-20', '20:00'),

-- El Avaro (3 funciones)
(6,'El Avaro', 'Sala Roja', '2025-03-10', '20:00'),
(7,'El Avaro', 'Sala Roja', '2025-03-12', '20:00'),
(8,'El Avaro', 'Sala Azul', '2025-03-15', '21:00'),

-- Sueño (1 función)
(9,'Sueño de una Noche de Verano', 'Sala Principal', '2025-06-01', '20:00');

INSERT INTO Entradas (dni_espectador, id_funcion, precio)
SELECT 'H'||generate_series(1,260), 1, 500;

INSERT INTO Entradas (dni_espectador, id_funcion, precio)
SELECT 'H'||generate_series(261,400), 2, 500;

INSERT INTO Entradas (dni_espectador, id_funcion, precio)
SELECT 'H'||generate_series(401,580), 3, 500;

INSERT INTO Entradas (dni_espectador, id_funcion, precio)
SELECT 'N4_' || generate_series(1,75), 4, 500;

INSERT INTO Entradas (dni_espectador, id_funcion, precio)
SELECT 'N5_' || generate_series(1,50), 5, 500;

-- Realizar una consulta SQL que obtenga las obras que tuvieron en todas sus funciones una
-- asistencia mayor al 80% respecto a la capacidad de las salas donde tuvieron funciones.

SELECT f.id_funcion, ((COUNT(e.id_funcion) * 1.0 / s.capacidad) * 100) AS porcentaje_asistencia
FROM Funciones as f
JOIN Entradas as e
on f.id_funcion = e.id_funcion
join salas as s
ON s.nombre_sala = f.nombre_sala
GROUP BY f.id_funcion, s.nombre_sala;

WITH porcentaje_de_asistencia(id_funcion, porcentaje) AS (
    SELECT f.id_funcion, ((COUNT(e.id_funcion) * 1.0 / s.capacidad) * 100) AS porcentaje_asistencia
FROM Funciones as f
JOIN Entradas as e
on f.id_funcion = e.id_funcion
join salas as s
ON s.nombre_sala = f.nombre_sala
GROUP BY f.id_funcion, s.nombre_sala
)SELECT o.*
 FROM obras AS o
JOIN Funciones as f
on o.nombre_obra = f.nombre_obra
JOIN porcentaje_de_asistencia as p
ON p.id_funcion = f.id_funcion
WHERE p.porcentaje >= 80.0;

WITH porcentaje_de_asistencia(id_funcion, porcentaje) AS (
    SELECT f.id_funcion, ((COUNT(e.id_funcion) * 1.0 / s.capacidad) * 100) AS porcentaje_asistencia
FROM Funciones as f
JOIN Entradas as e
on f.id_funcion = e.id_funcion
join salas as s
ON s.nombre_sala = f.nombre_sala
GROUP BY f.id_funcion, s.nombre_sala
)SELECT o.nombre_obra
 FROM obras AS o
WHERE o.nombre_obra in (
    SELECT o2.nombre_obra
    FROM obras as o2
    JOIN Funciones as f
on o2.nombre_obra = f.nombre_obra
JOIN porcentaje_de_asistencia as p
ON p.id_funcion = f.id_funcion
    where porcentaje >= 80
    );

WITH porcentaje_por_funcion AS (
    SELECT
        f.id_funcion,
        f.nombre_obra,
        COUNT(e.id_funcion) * 1.0 / s.capacidad AS porcentaje
    FROM Funciones f
    JOIN Salas s ON s.nombre_sala = f.nombre_sala
    LEFT JOIN Entradas e ON e.id_funcion = f.id_funcion
    GROUP BY
        f.id_funcion,
        f.nombre_obra,
        s.capacidad
)SELECT nombre_obra
FROM porcentaje_por_funcion
GROUP BY nombre_obra
HAVING MIN(porcentaje) > 0.8;