CREATE SCHEMA CINE;

SET search_path TO CINE;

CREATE TABLE peliculas(
    nombre_pelicula varchar(100),
    año date,
    genero varchar(50),
    PRIMARY KEY (nombre_pelicula)
);

CREATE TABLE actores(
    nombre_actor varchar(100),
    apellido_actor varchar(100),
    nombre_personaje varchar(100),
    apellido_personaje varchar(100),
    nombre_pelicula varchar(100),
    PRIMARY KEY (nombre_actor, apellido_actor),
    FOREIGN KEY (nombre_pelicula) REFERENCES peliculas
);

CREATE TABLE funciones(
  dia date,
  hora time,
  sala varchar(50),
  nombre_pelicula varchar(100),
  precio float,
  PRIMARY KEY(nombre_pelicula, dia, hora),
  FOREIGN KEY(nombre_pelicula) REFERENCES peliculas
);

CREATE TABLE clientes_vip(
    dni int,
    nombre varchar(100),
    apellido varchar(100),
    plan varchar(100),
    descuento float,
    PRIMARY KEY(dni)
);

CREATE TABLE combos(
    numero_combo int,
    descripcion varchar(100),
    precio float,
    PRIMARY KEY(numero_combo)
);

CREATE TABLE ventas_funciones(
    dni_cliente int,
     dia date,
  hora time,
  sala varchar(50),
  nombre_pelicula varchar(100),
  precio float,
  PRIMARY KEY(dni_cliente, dia, hora, sala, nombre_pelicula),
  FOREIGN KEY(dni_cliente)REFERENCES clientes_vip(dni),
  FOREIGN KEY(dia, hora, nombre_pelicula) REFERENCES funciones(dia, hora, nombre_pelicula)
);

CREATE TABLE ventas_combos(
    dni_cliente int,
    numero_combo int,
    precio float,
    PRIMARY KEY(dni_cliente, numero_combo, precio),
    FOREIGN KEY(dni_cliente) REFERENCES clientes_vip(dni),
    FOREIGN KEY(numero_combo) REFERENCES combos(numero_combo)
);
