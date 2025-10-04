INSERT INTO fabricantes (codigo_fabricante, razon_social) VALUES
(101, 'TechSolutions Inc.'),
(102, 'ElectroWorld S.A.'),
(103, 'HomeEssentials Ltda.'),
(104,'CookTronicos SRL. ');

INSERT INTO clientes (dni_cliente, nombre, apellido) VALUES
(1234567, 'Ana', 'Gómez'),
(9876543, 'Juan', 'Pérez'),
(4567890, 'María', 'López'),
(1122334, 'Carlos', 'Rodríguez'),
(5566778, 'Sofía', 'Martínez');

INSERT INTO articulos (codigo_articulo, nombre, descripcion, codigo_fabricante, precio) VALUES
(1, 'Mouse Óptico', 'Mouse ergonómico USB, 1200 DPI', 101, 15.50),
(2, 'Teclado Mecánico', 'Teclado retroiluminado con switches azules', 101, 65.99),
(3, 'Monitor LED 24', 'Pantalla Full HD, 75Hz', 102, 120.00),
(4, 'Aspiradora Robot', 'Robot de limpieza automática con mapeo', 103, 299.90),
(5, 'Cable HDMI 2m', 'Cable de alta velocidad 4K', 101, 8.75),
(6, 'Cafetera Programable', 'Capacidad para 12 tazas, filtro permanente', 103, 45.00),
(7, 'Disco SSD 500GB', 'Unidad de estado sólido SATA III', 102, 55.50),
(8, 'Auriculares Bluetooth', 'Cancelación de ruido, 20 horas de batería', 101, 90.00),
(9, 'Smart TV 50', 'Televisor inteligente 4K UHD', 102, 450.00),
(10, 'Licuadora Portátil', 'Ideal para batidos, recargable USB', 103, 25.00),
(11, 'Microondas', 'Caliente en 30 seg', 104, 15.00),
(12, 'AIR Frier', 'Salud y fritura todo en 1', 104, 20.00);


INSERT INTO venta (fecha, dni_cliente, codigo_articulo, cantidad) VALUES
('2025-01-10', 1234567, 1, 2), -- Ana compra Mouse y Cable HDMI
('2025-01-10', 1234567, 5, 1),
('2025-01-15', 9876543, 3, 1), -- Juan compra Monitor
('2025-01-20', 4567890, 4, 1), -- María compra Aspiradora Robot
('2025-01-25', 1122334, 2, 1), -- Carlos compra Teclado
('2025-02-01', 5566778, 6, 1), -- Sofía compra Cafetera
('2025-02-05', 9876543, 7, 2), -- Juan compra 2 SSDs
('2025-02-10', 1234567, 8, 1), -- Ana compra Auriculares
('2025-02-15', 4567890, 1, 3), -- María compra 3 Mouses
('2025-02-20', 1122334, 10, 1), -- Carlos compra Licuadora
('2025-03-01', 5566778, 9, 1), -- Sofía compra Smart TV
('2025-03-05', 9876543, 2, 1), -- Juan compra Teclado
('2025-03-10', 1234567, 3, 1), -- Ana compra Monitor
('2025-03-15', 4567890, 5, 4), -- María compra 4 Cables HDMI
('2025-03-20', 5566778, 7, 1); -- Sofía compra SSD