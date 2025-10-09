CREATE SCHEMA facultad; 


CREATE TABLE alumnos(
    padron int CHECK(padron > 0) NOT NULL,
    nombre varchar(50),
    apellido varchar(50),
    PRIMARY KEY(padron)
);

CREATE TABLE docentes(
    legajo int CHECK(legajo > 0) NOT NULL,
    nombre varchar(50),
    apellido varchar(50),
    cargo varchar(50),
    PRIMARY KEY(legajo)
);

CREATE TABLE materias(
    codigo varchar(5) NOT NULL,
    nombre varchar(50),
    PRIMARY KEY(codigo)
);

CREATE TABLE materias_docentes(
    codigo varchar(5) NOT NULL,
    legajo int NOT NULL,
    PRIMARY KEY(codigo, legajo),
    FOREIGN KEY(codigo) REFERENCES materias,
    FOREIGN KEY(legajo) REFERENCES docentes
);

CREATE TABLE notas(
    padron int NOT NULL,
    codigo varchar(5),
    nota float CHECK(nota > 0 and nota <= 10.0),
    año DATE,
    cuatrimestre varchar(50) CHECK(cuatrimestre LIKE 'primer cuatrimestre' OR cuatrimestre LIKE 'segundo cuatrimestre'),
    PRIMARY KEY(padron,codigo),
    FOREIGN KEY(padron) REFERENCES alumnos,
    FOREIGN KEY(codigo) REFERENCES materias
);

