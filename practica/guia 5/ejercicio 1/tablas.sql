CREATE TABLE barrio(
    nombre varchar(50),
    PRIMARY KEY(nombre)
);

CREATE TABLE sucursales(
    nombre_sucursal varchar(50),
    nombre varchar(50),
    PRIMARY KEY(nombre_sucursal),
    FOREIGN KEY(nombre) REFERENCES barrio
);



CREATE TABLE empleados(
    dni int CHECK (dni > 0 and dni < 99999999),
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    nombre_sucursal varchar(50),
    PRIMARY KEY(dni),
    FOREIGN KEY(nombre_sucursal) REFERENCES sucursales
);

CREATE TABLE combos(
    numero_combo int,
    descripcion varchar(300),
    precio float,
    PRIMARY KEY(numero_combo)
);