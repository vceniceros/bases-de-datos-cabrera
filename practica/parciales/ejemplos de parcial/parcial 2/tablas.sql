CREATE SCHEMA agrofiuba;
SET search_path TO agrofiuba;

CREATE TABLE productos(
    id_producto int NOT NULL,
    nombre varchar(50) NOT NULL,
    tipo varchar(20) NOT NULL,
    unidad varchar(20) NOT NULL,
    PRIMARY KEY (id_producto)    
);


CREATE TABLE cultivos(
    id_cultivo int NOT NULL,
    id_producto int NOT NULL,
    fecha_siembra date NOT NULL,
    fecha_cosecha date NOT NULL,
    area_hectareas float NOT NULL,
    PRIMARY KEY (id_cultivo),
    FOREIGN KEY (id_producto) REFERENCES productos
);

CREATE TABLE empleados(
    id_empleado int NOT NULL,
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
    fecha_contratacion date NOT NULL,
    puesto varchar(50) NOT NULL,
    salario float NOT NULL,
    PRIMARY KEY (id_empleado)
);

CREATE TABLE inventario(
    id_inventario int NOT NULL,
    id_producto int NOT NULL,
    cantidad int NOT NULL,
    precio_unitario float NOT NULL,
    PRIMARY KEY (id_inventario),
    FOREIGN KEY (id_producto) REFERENCES productos
);

CREATE TABLE ventas(
    id_venta int NOT NULL,
    id_inventario int NOT NULL,
    cantidad_vendida int NOT NULL,
    fecha_venta date NOT NULL,
    id_empleado int NOT NULL,
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_inventario) REFERENCES inventario,
    FOREIGN KEY (id_empleado) REFERENCES empleados
);