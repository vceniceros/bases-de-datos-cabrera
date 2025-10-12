CREATE SCHEMA formula_1;

CREATE TABLE equipos(
    cod_equipo varchar(50) NOT NULL,
    nombre varchar(50),
    veces_campeon int,
    PRIMARY KEY(cod_equipo)
);

CREATE TABLE pilotos(
    nro_piloto int NOT NULL,
    cod_equipo varchar NOT NULL,
    nombre varchar(50),
    apellido varchar(50),
    nacionalidad varchar(50),
    carreras_ganadas int ,
    PRIMARY KEY(nro_piloto, cod_equipo),
    FOREIGN KEY(cod_equipo) REFERENCES equipos
);

CREATE TABLE circuitos(
    id_circuito int not NULL,
    nombre_circuito varchar(50),
    pais varchar(50),
    vueltas int,
    longitud float,
    PRIMARY KEY(id_circuito)
);

CREATE TABLE carreras(
    id_carrera int NOT NULL,
    fecha DATE,
    id_circuito int,
    cod_equipo varchar,
    nro_piloto int, 
    posicion int,
    vueltas_finalizadas int,
    ms_mejor_vuelta float, 
    puntos_ganados int,
    PRIMARY KEY(id_carrera),
    FOREIGN KEY(id_circuito) REFERENCES circuitos,
    FOREIGN KEY(nro_piloto, cod_equipo) REFERENCES pilotos 
);