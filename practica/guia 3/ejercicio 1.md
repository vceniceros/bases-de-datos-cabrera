# ejercicio 1

Clientes: { CodigoCliente, Cuit, RazonSocial, Direccion }
Productos: {CodigoProducto, Descripcion, CodigoTipo }
TiposProducto: {CodigoTipo, Descripcion }
Compras: {CodigoCliente, CodigoProducto, Fecha, Cantidad }


En clientes se tiene una tupla por cliente, en producto una tupla por producto, en tipos de
producto una tupla por tipo de producto. En Compras una tupla por compra, cada cliente
hace una sola compra de cada producto por fecha

- Obtener la dirección de todos los clientes.
- Obtener la razón social de todos los clientes que compraron productos de tipo "X".
- Obtener los Códigos de cliente que compraron el producto "Y".
- Obtener los clientes que compraron 2 unidades del producto "H" en la fecha "F".
- Obtener los clientes que compraron todos los productos.

## obtener la direccion de todos los clientes

```SQL
πCLientes(direccion)
```

##  Obtener la razón social de todos los clientes que compraron productos de tipo "X".

```SQL

ClientesCompradoresDelProducto ← Clientes ⨝ Compras(CodigoProducto)

πClientesCompradoresDelProducto(RazonSocial)
```