# ejercicio 1 

## Enunciado

1. (SQL) AgroFiuba una empresa agraria que se dedica a la venta y comercialización de
productos agropecuarios. Cuenta con la siguiente base de datos:

Productos(id, nombre, tipo, unidad)
(1, 'Maíz', 'Grano', 'tn')
(2, 'Glifosato', 'Herbicida', 'litros')

Cultivos(id, id_producto fecha_siembra, fecha_cosecha, area_hectareas)
(42, 1, '2023-09-15', '2024-03-20', 50.5)
(44, 3, '2023-10-18', '2024-05-03', 110)

Empleados(id, nombre, apellido, fecha_contratacion, puesto, salario)
(1, 'Cosme', 'Fulanito', '2023-01-10', 'Supervisor', 800000)
(2, 'Eleanor', 'Abernathy', '2023-01-10', 'Empleado', 500000)

Inventario(id, id_producto, cantidad, precio_unitario)
(101, 1, 1000, 220)
(102, 3, 20000, 310)

Ventas(id, id_inventario, cantidad_vendida, fecha_venta, id_empleado)
(340, 102, 3000, '2024-08-29', 2)

Se necesita un informe por cada año y producto que refleje: el año, el nombre del
producto y el promedio de hectáreas utilizadas por cada producto en ese año. El informe debe
abarcar desde el año 2010 hasta el año 2020 y se deben omitir los herbicidas.

1. obtener el promedio de hectareas utilizadas por cada producto en ese año
```sql

```
2. 

