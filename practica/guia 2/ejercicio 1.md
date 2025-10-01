# ejercicio 1

Definir el modelo de datos(MR) definiendo Relaciones, atributos(con sus respectivos
dominios), PK, FK para el siguiente caso, especificando las suposiciones que se hagan.
Un supermercado vende distintos productos. Cada producto tiene un stock. Los productos
pertenecen a distintas familias. Se prevé que en el futuro se puedan agregar otras formas
de venta. En algunas familias los productos se venden por peso y en otras por unidad. Los
productos se almacenan en góndolas, que se ubican en pasillos. La empresa desea
manejar el stock.

 <span style="text-decoration: underline"></span>
 <span style="border-bottom: 1px dotted;"></span>

## resolucion 

productos
familias, algunas familias vende por peso y otras por unidad, productos por gondola, y gondolas por pasillo

Productos(<span style="text-decoration: underline">nombreProducto: cadena </span>, stock:int, <span style="border-bottom: 1px dotted;">nombreFamilia: cadena</span>)

Familias(<span style="text-decoration: underline">nombreFamilia: cadena</span>, tipoDeVenta:cadena)

tipoDeVenta(<span style="text-decoration: underline">nombreProducto:cadena, nombreDeFamila:cadena</span>)

VentaPorPeso(<span style="text-decoration: underline">nombreProducto:cadena, nombreDeFamila:cadena</span>, precioPorKilo:float)

ventaPorUnidad(<span style="text-decoration: underline">nombreProducto:cadena, nombreDeFamila:cadena</span>, precioPorUnidad:float)

gondola(<span style="text-decoration: underline">numeroGondola:int</span>)

productosPorGondola(<span style="text-decoration: underline">numeroGondola:int, nombreProducto:cadena</span>)

pasillos(<span style="text-decoration: underline">numeroPasillo:int</span>)

gondolasPorPasillo(<span style="text-decoration: underline">numeroGondola:int, numeroPasillo:Int</span>)