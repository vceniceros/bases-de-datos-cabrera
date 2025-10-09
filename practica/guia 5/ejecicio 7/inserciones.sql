INSERT INTO alumnos(padron, nombre, apellido) VALUES(100155, 'Maria','Lopez'),
(100156, 'Jose','Gonzalez'),
(100157, 'Ana','Martinez'),
(100158, 'Luis','Fernandez'),
(100159, 'Laura','Garcia');

INSERT INTO docentes(legajo, nombre, apellido, cargo) VALUES(2001, 'Carlos','Perez','Profesor'),
(2002, 'Sofia','Ramirez','Adjunto'),
(2003, 'Diego','Sanchez','JTP'),
(2004, 'Marta','Diaz','Profesor'),
(2005, 'Javier','Torres','Adjunto');

INSERT INTO materias(codigo, nombre) VALUES('MAT01', 'Matematica I'),
('FIS01', 'Fisica I'),
('BDD01', 'Bases de Datos'),
('ALG01', 'Algebra I'),
('CAL01', 'Calculo I');

INSERT INTO materias_docentes(codigo, legajo) VALUES('MAT01', 2001),
('FIS01', 2002),
('BDD01', 2003),
('ALG01', 2004),
('CAL01', 2005),
('MAT01', 2004),
('FIS01', 2001);

INSERT INTO notas(padron, codigo, nota, año, cuatrimestre) VALUES(100155, 'BDD01', 8.5, '2023-06-15', 'primer cuatrimestre'),
(100156, 'MAT01', 6.0, '2023-06-20', 'primer cuatrimestre'),
(100157, 'FIS01', 7.5, '2023-06-25', 'primer cuatrimestre'),
(100158, 'ALG01', 5.0, '2023-06-30', 'primer cuatrimestre'),
(100159, 'CAL01', 9.0, '2023-07-05', 'primer cuatrimestre'),
(100155, 'MAT01', 4.0, '2023-07-10', 'segundo cuatrimestre'),
(100156, 'FIS01', 3.5, '2023-07-15', 'segundo cuatrimestre'),
(100157, 'BDD01', 6.5, '2023-07-20', 'segundo cuatrimestre'),
(100158, 'CAL01', 7.0, '2023-07-25', 'segundo cuatrimestre'),
(100159, 'ALG01', 8.0, '2023-07-30', 'segundo cuatrimestre');