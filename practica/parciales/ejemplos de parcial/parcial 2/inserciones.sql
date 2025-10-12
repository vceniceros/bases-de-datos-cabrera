INSERT INTO productos (id_producto, nombre, tipo, unidad) VALUES(1, 'soja', 'grano', 'toneladas');
INSERT INTO productos (id_producto, nombre, tipo, unidad) VALUES(2, 'maiz', 'grano', 'toneladas');
INSERT INTO productos (id_producto, nombre, tipo, unidad) VALUES(3, 'Glifosato', 'herbicida', 'litros');
INSERT INTO productos (id_producto, nombre, tipo, unidad) VALUES(4, 'Tractor', 'maquinaria', 'unidades');
INSERT INTO productos (id_producto, nombre, tipo, unidad) VALUES(5, 'Combine', 'maquinaria', 'unidades');
INSERT INTO productos (id_producto, nombre, tipo, unidad) VALUES(6, 'Fertilizante', 'fertilizante', 'kilogramos');  


INSERT INTO cultivos (id_cultivo, id_producto, fecha_siembra, fecha_cosecha, area_hectareas) VALUES(1, 1, '2023-04-15', '2023-11-20', 150.5);
INSERT INTO cultivos (id_cultivo, id_producto, fecha_siembra, fecha_cosecha, area_hectareas) VALUES(2, 2, '2023-05-10', '2023-12-15', 200.0);
INSERT INTO cultivos (id_cultivo, id_producto, fecha_siembra, fecha_cosecha, area_hectareas) VALUES(3, 1, '2024-04-20', '2024-11-25', 180.0);   
INSERT INTO cultivos (id_cultivo, id_producto, fecha_siembra, fecha_cosecha, area_hectareas) VALUES(4, 2, '2024-05-15', '2024-12-20', 220.0);

INSERT INTO empleados (id_empleado, nombre, apellido, fecha_contratacion, puesto, salario) VALUES(1, 'Juan', 'Perez', '2022-03-01', 'vendedor', 75000);
INSERT INTO empleados (id_empleado, nombre, apellido, fecha_contratacion, puesto, salario) VALUES(2, 'Ana', 'Gomez', '2021-07-15', 'administrativo', 85000);    
INSERT INTO empleados (id_empleado, nombre, apellido, fecha_contratacion, puesto, salario) VALUES(3, 'Luis', 'Martinez', '2023-01-20', 'vendedor', 72000);
INSERT INTO empleados (id_empleado, nombre, apellido, fecha_contratacion, puesto, salario) VALUES(4, 'Marta', 'Lopez', '2020-11-30', 'supervisor', 95000);    

INSERT INTO inventario (id_inventario, id_producto, cantidad, precio_unitario) VALUES(1, 1, 500, 300);
INSERT INTO inventario (id_inventario, id_producto, cantidad, precio_unitario) VALUES(2, 2, 400, 250);    
INSERT INTO inventario (id_inventario, id_producto, cantidad, precio_unitario) VALUES(3, 3, 1000, 15);
INSERT INTO inventario (id_inventario, id_producto, cantidad, precio_unitario) VALUES(4, 4, 10, 50000);
INSERT INTO inventario (id_inventario, id_producto, cantidad, precio_unitario) VALUES(5, 5, 5, 150000);
INSERT INTO inventario (id_inventario, id_producto, cantidad, precio_unitario) VALUES(6, 6, 2000, 20);

INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(1, 1, 100, '2023-09-01', 1);
INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(2, 2, 150, '2023-09-05', 3);    
INSERT INTO ventas (id_venta, id_inventario , cantidad_vendida, fecha_venta, id_empleado) VALUES(3, 3, 200, '2023-09-10', 1);
INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(4, 6, 300, '2023-09-12', 4);
INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(5, 1, 50, '2023-09-15', 3);
INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(6, 2, 100, '2023-09-18', 1);



INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(7, 1, 100, '2020-09-01', 1);
INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(8, 2, 150, '2015-09-05', 3);    
INSERT INTO ventas (id_venta, id_inventario , cantidad_vendida, fecha_venta, id_empleado) VALUES(9, 3, 200, '2013-09-10', 1);
INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(10, 6, 300, '2003-09-12', 4);
INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(11, 1, 50, '2017-09-15', 3);
INSERT INTO ventas (id_venta, id_inventario, cantidad_vendida, fecha_venta, id_empleado) VALUES(12, 2, 100, '2018-09-18', 1);