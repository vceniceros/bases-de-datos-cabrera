
INSERT INTO peliculas (nombre_pelicula, año, genero) VALUES('Inception', '2010-07-16', 'Sci-Fi');
INSERT INTO peliculas (nombre_pelicula, año, genero) VALUES('The Dark Knight', '2008-07-18', 'Action');
INSERT INTO peliculas (nombre_pelicula, año, genero) VALUES('Interstellar', '2014-11-07', 'Sci-Fi');
INSERT INTO peliculas (nombre_pelicula, año, genero) VALUES('Pulp Fiction', '1994-10-14', 'Crime');

INSERT INTO actores (nombre_actor, apellido_actor, nombre_personaje, apellido_personaje, nombre_pelicula) VALUES('Leonardo', 'DiCaprio', 'Dom', 'Cobb', 'Inception');
INSERT INTO actores (nombre_actor, apellido_actor, nombre_personaje, apellido_personaje, nombre_pelicula) VALUES('Joseph', 'Gordon-Levitt', 'Arthur', '', 'Inception');
INSERT INTO actores (nombre_actor, apellido_actor, nombre_personaje, apellido_personaje, nombre_pelicula) VALUES('Christian', 'Bale', 'Bruce', 'Wayne', 'The Dark Knight');
INSERT INTO actores (nombre_actor, apellido_actor, nombre_personaje, apellido_personaje, nombre_pelicula) VALUES('Heath', 'Ledger', 'Joker', '', 'The Dark Knight');
INSERT INTO actores (nombre_actor, apellido_actor, nombre_personaje, apellido_personaje, nombre_pelicula) VALUES('Matthew', 'McConaughey', 'Cooper', '', 'Interstellar');
INSERT INTO actores (nombre_actor, apellido_actor, nombre_personaje, apellido_personaje, nombre_pelicula) VALUES('John', 'Travolta', 'Vincent', 'Vega', 'Pulp Fiction');
INSERT INTO actores (nombre_actor, apellido_actor, nombre_personaje, apellido_personaje, nombre_pelicula) VALUES('Samuel', 'Jackson', 'Jules', 'Winnfield', 'Pulp Fiction');

INSERT INTO funciones (dia, hora, sala, nombre_pelicula, precio) VALUES('2023-10-01', '18:00:00', 'Sala 1', 'Inception', 12.50);
INSERT INTO funciones (dia, hora, sala, nombre_pelicula, precio) VALUES('2023-10-01', '21:00:00', 'Sala 1', 'Inception', 12.50);
INSERT INTO funciones (dia, hora, sala, nombre_pelicula, precio) VALUES('2023-10-02', '19:00:00', 'Sala 2', 'The Dark Knight', 10.00);
INSERT INTO funciones (dia, hora, sala, nombre_pelicula, precio) VALUES('2023-10-02', '22:00:00', 'Sala 2', 'The Dark Knight', 10.00);
INSERT INTO funciones (dia, hora, sala, nombre_pelicula, precio) VALUES('2023-10-03', '20:00:00', 'Sala 3', 'Interstellar', 15.00);
INSERT INTO funciones (dia, hora, sala, nombre_pelicula, precio) VALUES('2023-10-03', '23:00:00', 'Sala 3', 'Interstellar', 15.00);
INSERT INTO funciones (dia, hora, sala, nombre_pelicula, precio) VALUES('2023-10-04', '18:30:00', 'Sala 4', 'Pulp Fiction', 8.00);
INSERT INTO funciones (dia, hora, sala, nombre_pelicula, precio) VALUES('2023-10-04', '21:30:00', 'Sala 4', 'Pulp Fiction', 8.00);


INSERT INTO clientes_vip (dni, nombre, apellido, plan, descuento) VALUES(12345678, 'Carlos', 'Lopez', 'Gold', 0.15);
INSERT INTO clientes_vip (dni, nombre, apellido, plan, descuento) VALUES(87654321, 'Maria', 'Gonzalez', 'Silver', 0.10);
INSERT INTO clientes_vip (dni, nombre, apellido, plan, descuento) VALUES(11223344, 'Ana', 'Martinez', 'Bronze', 0.05);
INSERT INTO clientes_vip (dni, nombre, apellido, plan, descuento) VALUES(44332211, 'Luis', 'Rodriguez', 'Gold', 0.15);      

INSERT INTO combos (numero_combo, descripcion, precio) VALUES(1, 'Combo 1: Pochoclos + Soda', 8.00);
INSERT INTO combos (numero_combo, descripcion, precio) VALUES(2, 'Combo 2: Nachos + Soda', 7.50);
INSERT INTO combos (numero_combo, descripcion, precio) VALUES(3, 'Combo 3: Pancho + Soda', 6.00);

INSERT INTO ventas_funciones (dni_cliente, dia, hora, sala, nombre_pelicula, precio) VALUES(12345678, '2023-10-01', '18:00:00', 'Sala 1', 'Inception', 12.50);
INSERT INTO ventas_funciones (dni_cliente, dia, hora, sala, nombre_pelicula, precio) VALUES(87654321, '2023-10-02', '19:00:00', 'Sala 2', 'The Dark Knight', 10.00);
INSERT INTO ventas_funciones (dni_cliente, dia, hora, sala, nombre_pelicula, precio) VALUES(11223344, '2023-10-03', '20:00:00', 'Sala 3', 'Interstellar', 15.00);
INSERT INTO ventas_funciones (dni_cliente, dia, hora, sala, nombre_pelicula, precio) VALUES(44332211, '2023-10-04', '18:30:00', 'Sala 4', 'Pulp Fiction', 8.00);    
INSERT INTO ventas_funciones (dni_cliente, dia, hora, sala, nombre_pelicula, precio) VALUES(12345678, '2023-10-01', '21:00:00', 'Sala 1', 'Inception', 12.50);
INSERT INTO ventas_funciones (dni_cliente, dia, hora, sala, nombre_pelicula, precio) VALUES(87654321, '2023-10-02', '22:00:00', 'Sala 2', 'The Dark Knight', 10.00);
INSERT INTO ventas_funciones (dni_cliente, dia, hora, sala, nombre_pelicula, precio) VALUES(11223344, '2023-10-03', '23:00:00', 'Sala 3', 'Interstellar', 15.00);
INSERT INTO ventas_funciones (dni_cliente, dia, hora, sala, nombre_pelicula, precio) VALUES(44332211, '2023-10-04', '21:30:00', 'Sala 4', 'Pulp Fiction', 8.00);    
INSERT INTO ventas_funciones (dni_cliente, dia, hora, sala, nombre_pelicula, precio) VALUES(12345678, '2023-10-01', '21:00:00', 'Sala 1', 'Inception', 12.50);  

INSERT INTO ventas_combos (dni_cliente, numero_combo, precio) VALUES(12345678, 1, 8.00);
INSERT INTO ventas_combos (dni_cliente, numero_combo, precio) VALUES(87654321, 2, 7.50);
INSERT INTO ventas_combos (dni_cliente, numero_combo, precio) VALUES(11223344, 3, 6.00);
INSERT INTO ventas_combos (dni_cliente, numero_combo, precio) VALUES(44332211, 1, 8.00);
INSERT INTO ventas_combos (dni_cliente, numero_combo, precio) VALUES(12345678, 2, 7.50);
INSERT INTO ventas_combos (dni_cliente, numero_combo, precio) VALUES(87654321, 3, 6.00);
INSERT INTO ventas_combos (dni_cliente, numero_combo, precio) VALUES(11223344, 1, 8.00);