# ejercicio 8

Dado el siguiente Diagrama del Modelo Entidad Relación, realizar el pasaje a Modelo
Relacional indicando relaciones, atributos, claves primarias, y claves foráneas

![modelo relacional](image.png)


 <span style="text-decoration: underline"></span>
 <span style="border-bottom: 1px dotted;"></span>


PersonalesAcademicos( <span style="text-decoration: underline">legajo </span>)

Docentes(<span style="text-decoration: underline">legajo </span>, rol)

Cursos(<span style="text-decoration: underline">id_curso </span>, nombre, materia, <span style="border-bottom: 1px dotted;">legajoProfesor</span>)

NoDocentes(<span style="text-decoration: underline">legajo </span>, funciones)