CREATE SCHEMA club_de_barrio

SET search_path TO club_de_barrio;    


CREATE TABLE socios(
    numero_socio int NOT NULL,
    nombre varchar(50),
    apellido varchar(50),
    fecha_nacimiento DATE, 
    PRIMARY KEY(numero_socio)
);

CREATE TABLE deportes(
    nombre_deporte varchar(50) NOT NULL,
    cantidad_de_jugadores_por_equipo int CHECK(cantidad_de_jugadores_por_equipo >= 1),
    PRIMARY KEY(nombre_deporte)
);

CREATE TABLE socios_deportes(
    numero_socio int NOT NULL,
    nombre_deporte varchar(50) NOT NULL,
    PRIMARY KEY(numero_socio, nombre_deporte),
    FOREIGN KEY(numero_socio) REFERENCES socios,
    FOREIGN KEY(nombre_deporte) REFERENCES deportes
);

