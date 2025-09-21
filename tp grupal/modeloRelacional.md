# modelo relacional


usuarios( <span style="text-decoration: underline">id_usuario</span>, username, email, fecha_de_alta, fecha_de_nacimiento,nombre, apellido, <span style="border-bottom: 1px dotted;">nombre_pais</span>, cantidad_de_ingresos)

publicaciones(<span style="text-decoration: underline">id_publicaciones</span>, contenido, <span style="border-bottom: 1px dotted;">id_grupo</span>, cantidad_comentarios, url, <span style="border-bottom: 1px dotted;">id_usuario</span>)

imagenes(<span style="text-decoration: underline">id_publicaciones</span>, contenido, <span style="border-bottom: 1px dotted;">id_grupo</span>, url, <span style="border-bottom: 1px dotted;">id_usuario</span>,foto)

videos(<span style="text-decoration: underline">id_publicaciones</span>, contenido, <span style="border-bottom: 1px dotted;">id_grupo</span>,  url, <span style="border-bottom: 1px dotted;">id_usuario</span>, duracion, calidad)

textos(<span style="text-decoration: underline">id_publicaciones</span>, contenido, <span style="border-bottom: 1px dotted;">id_grupo</span>, url, <span style="border-bottom: 1px dotted;">id_usuario</span>, texto)

grupos(<span style="text-decoration: underline">id_grupo</span>, nombre, descripcion, fecha_de_creacion)

UsuariosGrupos(<span style="text-decoration: underline">id_grupo</span>,<span style="text-decoration: underline"> id_usuario </span>, fecha_de_ingreso)

Comentarios(<span style="text-decoration: underline">id_comentario</span>, contenido, <span style="border-bottom: 1px dotted;">id_usuario</span>, <span style="border-bottom: 1px dotted;">id_publicacion</span>)


Amistades(<span style="text-decoration: underline">id_usuario1</span>, <span style="text-decoration: underline">id_usuario2</span>, fecha_de_inicio)

Notificaciones(<span style="text-decoration: underline">id_notificacion</span>, descripcion)

NotificacionesDeAmistad(<span style="text-decoration: underline">id_notificacion</span>, descripcion, estado)

NotificacionesDePublicacion(<span style="text-decoration: underline">id_notificacion</span>, descripcion)

NotificacionesDePublicacionGrupal(<span style="text-decoration: underline">id_notificacion</span>, descripcion)


notificacionesPublicaciones(<span style="text-decoration: underline">id_notificacion</span>, <span style="text-decoration: underline">id_publicacion></span>, fecha_de_notificacion)


notificacionesYUsuarios(<span style="text-decoration: underline">id_notificacion</span>, <span style="text-decoration: underline"> id_usuario</span>)

mensajes( <span style="text-decoration: underline"> id_mensaje</span>, estado, contenido, fecha_de_envio, <span style="border-bottom: 1px dotted;">id_emisor</span>, <span style="border-bottom: 1px dotted;">id_remitente</span>)

reacciones(<span style="text-decoration: underline"> id_usuario</span>, <span style="text-decoration: underline"> id_publicacion</span>, reaccion)

paises(<span style="text-decoration: underline"> nombre_pais </span>)