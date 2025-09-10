
# ejercicio de clase

σ 1 = 1(Peliculas)

σ año_de_lanzamiento < 1984(Peliculas)

σ id = 79846 (Peliculas)

σ nombre = "Pulp Fiction" (Peliculas)

# proyeccion 

proyectar lo nombres y apellidos de los actores


π nombre,apellido (Actores)

# diferencia

actores que no son directores

π nombre(actores) - π nombre(directores)

# proyecciones

(actores) X (peliculas)


# renombramiento

ρ      (actors)
actores 

ρ      (apellido)(actors)
 actores 


# interseccion

π nombre,apellido(actores) ∩ π nombre,apellido(directores)

# junta

directores ⨝                                          directores_genero
             (directores_genero probabilidad_de_genero > 0.5) 


directores * generos_de_directores

# division

π   (genero_directores)  ÷   π (genero_pelicula) 
       director, genero                      genero            


# asignacion


directores ←  directores * genero_directores

