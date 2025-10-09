INSERT INTO fabricantes (codigo_fabricante, razon_social) VALUES
(101, 'Aceros Fuerte S.A.'),
(102, 'Químicos del Sur Ltda.'),
(103, 'Maderas Unidas'),
(104, 'Distribuidora Sin Uso'); 

INSERT INTO clientes (dni_cliente, nombre, apellido) VALUES
(1000001, 'Pedro', 'García'),
(2000002, 'Laura', 'Méndez'),
(3000003, 'Raúl', 'Castro'),
(4000004, 'Diana', 'Rojas'),
(5000005, 'Felipe', 'Vargas'),
(6000006, 'Elena', 'Núñez'),
(7000007, 'Sebastián', 'Torres'),
(8000008, 'Isabel', 'Flores');

INSERT INTO articulos (codigo_articulo, nombre, descripcion, codigo_fabricante, precio) VALUES
(1, 'Clavos 2 Pulgadas', 'Caja de 500 unidades', 101, 0.25),
(2, 'Martillo Carpintero', 'Mango de fibra de vidrio', 101, 18.50),
(3, 'Tornillos Madera (Caja)', 'Caja de 200 unidades', 101, 7.99),
(4, 'Silicona Multiuso', 'Cartucho 300ml', 102, 4.50),
(5, 'Pintura Blanca 1 Galón', 'Esmalte sintético', 102, 25.00),
(6, 'Pincel No. 3', 'Cerdas naturales', 102, 1.99),
(7, 'Tabla Pino 2x4', '3 metros de largo', 103, 12.00),
(8, 'Cinta Métrica 5m', 'Caja de acero', 103, 5.50),
(9, 'Lija Grano 100', 'Para madera y metal', 103, 0.80),
(10, 'Guantes de Trabajo', 'Talla L', 104, 3.50),
(11, 'Candado Pequeño', 'Cuerpo de bronce', 104, 6.00), 
(12, 'Escalera Plegable 3m', 'Aluminio reforzado', 104, 45.00);


INSERT INTO venta (fecha, dni_cliente, codigo_articulo, cantidad) VALUES
('2025-10-01', 1000001, 1, 200),
('2025-10-01', 2000002, 5, 1),
('2025-10-02', 3000003, 7, 4),
('2025-10-02', 4000004, 3, 2),
('2025-10-02', 1000001, 4, 5),
('2025-10-03', 5000005, 2, 1),
('2025-10-03', 6000006, 8, 1),
('2025-10-03', 7000007, 6, 3),
('2025-10-03', 8000008, 9, 10),
('2025-10-04', 2000002, 1, 100),
('2025-10-04', 3000003, 5, 2),
('2025-10-04', 4000004, 7, 1),
('2025-10-04', 5000005, 3, 1),
('2025-10-04', 1000001, 2, 1),
('2025-10-04', 8000008, 4, 2);