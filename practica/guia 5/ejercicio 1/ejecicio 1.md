# ejercicio 1

## enunciado

Una cadena que vende hamburguesas en una ciudad, utiliza un sistema de gestión de base
de datos, para obtener información relevante y tomar decisiones. Dados los siguientes
esquemas de relaciones:

Sucursales: { nombre_sucursal, barrio }
Combos: { numero_combo, descripcion, precio }
Empleados: { dni, nombre, apellido, nombre_sucursal }
Barrios: { nombre }

### realizar las siguientes consultas en SQL:

1. Crear todas las tablas, indicando claves primarias, claves foráneas, y restricciones.
2. Obtener la cantidad de empleados por sucursal, y ordenar de mayor a menor.
3. Obtener los barrios donde no hay sucursales de la cadena.
4. Obtener los barrios donde hay más sucursales, y mostrar dicha cantidad.
5. Obtener los combos que poseen igual precio, mostrando los campos “numero_combo”,
“descripción”, y “precio”