-- Obtener todos los alumnos que aprobaron la materia “Base de Datos” (nota >= 4)

SELECT a.nombre, a.apellido, n.nota
FROM alumnos AS a
LEFT OUTER JOIN notas AS n
ON n.padron = a.padron
WHERE(n.nota  >= 4.0 and n.codigo = 'BDD01');


-- Obtener los alumnos con mejor promedio


