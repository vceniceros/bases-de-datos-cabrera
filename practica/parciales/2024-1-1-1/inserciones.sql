INSERT INTO equipos(cod_equipo, nombre, veces_campeon) VALUES(
    'MER',
    'Mercedez',
    7
),(
    'RED',
    'Red Bull Racing',
    4
);
 
 INSERT INTO pilotos(nro_piloto, cod_equipo, nombre, apellido, nacionalidad, carreras_ganadas) VALUES(
    44,
    'MER',
    'Lewis',
    'Hamilton',
    'Inglesa',
    103),(
        44,
        'RED',
        'Max',
        'Verstappen',
        'Holandesa',
        55);


INSERT INTO circuitos(id_circuito, nombre_circuito, pais, vueltas, longitud) VALUES(
    1,
    'Circuito de Mónaco',
    'Mónaco',
    78,
    3.337
),(
    2,
    'Circuito de Silverstone',
    'Reino Unido',
    52,
    5.891
);
INSERT INTO carreras(id_carrera, fecha, id_circuito, cod_equipo, nro_piloto, posicion, vueltas_finalizadas, ms_mejor_vuelta, puntos_ganados) VALUES(
    1,
    '2023-05-28',
    1,
    'RED',
    44,
    1,
    78,
    72.345,
    25
),(
    2,
    '2023-07-09',
    2,
    'MER',
    44,
    2,
    52,
    75.123,
    18
);

-- Agrego otro piloto en MER
INSERT INTO pilotos(nro_piloto, cod_equipo, nombre, apellido, nacionalidad, carreras_ganadas) VALUES
(77, 'MER', 'Valtteri', 'Bottas', 'Finlandesa', 10);

-- Agrego otro piloto en RED
INSERT INTO pilotos(nro_piloto, cod_equipo, nombre, apellido, nacionalidad, carreras_ganadas) VALUES
(33, 'RED', 'Sergio', 'Perez', 'Mexicana', 6);

-- Agrego más circuitos
INSERT INTO circuitos(id_circuito, nombre_circuito, pais, vueltas, longitud) VALUES
(3, 'Circuito de Monza', 'Italia', 53, 5.793),
(4, 'Circuito de Spa', 'Bélgica', 44, 7.004);

-- Carreras para Hamilton (MER), todas posición 1-3 y mejor vuelta > 60000 ms (sí cumple!)
INSERT INTO carreras(id_carrera, fecha, id_circuito, cod_equipo, nro_piloto, posicion, vueltas_finalizadas, ms_mejor_vuelta, puntos_ganados) VALUES
(3, '2023-09-03', 3, 'MER', 44, 1, 53, 61000, 25),
(4, '2023-08-27', 4, 'MER', 44, 3, 44, 62000, 15);

-- Carreras para Bottas (MER), una vez 4° y una vez mejor vuelta menor a 60000 ms (NO cumple)
INSERT INTO carreras(id_carrera, fecha, id_circuito, cod_equipo, nro_piloto, posicion, vueltas_finalizadas, ms_mejor_vuelta, puntos_ganados) VALUES
(5, '2023-09-03', 3, 'MER', 77, 4, 53, 61000, 12), -- posición no cumple
(6, '2023-08-27', 4, 'MER', 77, 2, 44, 59000, 18); -- mejor vuelta no cumple

-- Carreras para Verstappen (RED), una vez posición 2 pero mejor vuelta menor a 60000 ms (NO cumple)
INSERT INTO carreras(id_carrera, fecha, id_circuito, cod_equipo, nro_piloto, posicion, vueltas_finalizadas, ms_mejor_vuelta, puntos_ganados) VALUES
(7, '2023-09-03', 3, 'RED', 44, 2, 53, 58000, 18),
(8, '2023-08-27', 4, 'RED', 44, 1, 44, 65000, 25);

-- Carreras para Perez (RED), todas posición 2 o 3 y mejor vuelta > 60000 ms (sí cumple!)
INSERT INTO carreras(id_carrera, fecha, id_circuito, cod_equipo, nro_piloto, posicion, vueltas_finalizadas, ms_mejor_vuelta, puntos_ganados) VALUES
(9, '2023-09-03', 3, 'RED', 33, 2, 53, 67000, 18),
(10, '2023-08-27', 4, 'RED', 33, 3, 44, 68000, 15);

-- Ejemplo: Perez y Hamilton cumplen.


-- Insertar a Colapinto como piloto de Red Bull Racing
INSERT INTO pilotos(nro_piloto, cod_equipo, nombre, apellido, nacionalidad, carreras_ganadas) VALUES
(10, 'RED', 'Franco', 'Colapinto', 'Argentina', 2);

INSERT INTO carreras(id_carrera, fecha, id_circuito, cod_equipo, nro_piloto, posicion, vueltas_finalizadas, ms_mejor_vuelta, puntos_ganados) VALUES
(13, '2023-07-16', 1, 'RED', 10, 4, 78, 72000, 12);