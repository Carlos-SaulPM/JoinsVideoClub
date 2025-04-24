-- Active: 1744520612104@@127.0.0.1@3306@videoClub
use videoClub;

SELECT * FROM genero;
SELECT * FROM pelicula;

SELECT a.titulo Nombre, a.anio "Año", b.descripcion Genero 
FROM pelicula a, genero b 
WHERE a.id_genero = b.id_genero
AND b.id_genero IN (1,5);

SELECT a.titulo Titulo, d.fecha "Fecha de prestamo", c.consecutivo Consecutivo
FROM pelicula a, ejemplar b, detalle_prestamo c, prestamo d
WHERE a.id_pelicula = c.id_pelicula
AND (b.id_pelicula = c.id_pelicula AND b.consecutivo = c.consecutivo)
AND d.id_prestamo = c.id_prestamo;

SELECT a.titulo, c.nombre_real, c.nombre_artistico 
FROM pelicula a, participa b, actor c
WHERE a.id_pelicula = b.id_pelicula
AND c.id_actor = b.id_actor;

-- 3 y 2
SELECT a.titulo pelicula, b.nombre director, c.descripcion genero
FROM pelicula a, director b, genero c
WHERE a.id_director = b.id_director 
AND a.id_genero = c.id_genero
AND c.id_genero IN(3,2);

SELECT a.id_prestamo, e.nombre, e.telefono, c.titulo pelicula, d.descripcion genero
FROM prestamo a, detalle_prestamo b, pelicula c, genero d , socio e, devolucion f
WHERE a.id_socio = e.id_socio
AND a.id_prestamo = b.id_prestamo
AND b.id_pelicula = c.id_pelicula
AND a.id_prestamo NOT IN (SELECT devolucion.id_devolucion FROM devolucion);