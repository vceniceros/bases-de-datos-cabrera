CREATE SCHEMA ferreteria;

CREATE TABLE clientes(
    dni_cliente int NOT NULL CHECK(dni_cliente > 0 and dni_cliente < 10000000),
    nombre varchar(50),
    apellido varchar(50),
    PRIMARY KEY(dni_cliente)
);

CREATE TABLE articulos(
    codigo_articulo int NOT NULL,
    nombre varchar(50),
    descripcion varchar(250),
    codigo_fabricante int NOT NULL,
    precio float,
    PRIMARY KEY(codigo_articulo),
    FOREIGN KEY(codigo_fabricante) REFERENCES fabricantes
);

CREATE TABLE fabricantes(
    codigo_fabricante int NOT NULL,
    razon_social varchar(50),
    PRIMARY KEY(codigo_fabricante)
);


CREATE TABLE venta(
    fecha DATE,
    dni_cliente int,
    codigo_articulo int,
    cantidad int,
    PRIMARY KEY(dni_cliente, codigo_articulo),
    FOREIGN KEY(dni_cliente) REFERENCES clientes,
    FOREIGN KEY(codigo_articulo) REFERENCES articulos
);