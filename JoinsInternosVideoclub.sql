-- Active: 1744520612104@@127.0.0.1@3306@videoClub
use videoClub;

SELECT * FROM genero;
SELECT * FROM pelicula;

--1. Se quiere saber el nombre y año de las peliculas que son de terror y accion
SELECT a.titulo Nombre, a.anio "Año", b.descripcion Genero 
FROM pelicula a, genero b 
WHERE a.id_genero = b.id_genero
AND b.id_genero IN (1,5);

--2. Se necesita ver el nombre de la pelicula, fecha de prestamo y el consecutivo ejemplar
SELECT a.titulo Titulo, d.fecha "Fecha de prestamo", c.consecutivo Consecutivo
FROM pelicula a, ejemplar b, detalle_prestamo c, prestamo d
WHERE a.id_pelicula = c.id_pelicula
AND (b.id_pelicula = c.id_pelicula AND b.consecutivo = c.consecutivo)
AND d.id_prestamo = c.id_prestamo;
-- 3. Queremos que actores participan en cada pelicula
SELECT a.titulo, c.nombre_real, c.nombre_artistico 
FROM pelicula a, participa b, actor c
WHERE a.id_pelicula = b.id_pelicula
AND c.id_actor = b.id_actor;

-- 4. Queremos saber los directores de las peliculas de drama y comedia
SELECT a.titulo pelicula, b.nombre director, c.descripcion genero
FROM pelicula a, director b, genero c
WHERE a.id_director = b.id_director 
AND a.id_genero = c.id_genero
AND c.id_genero IN(3,2);

-- 5. Se necesita informacion de las no devoluciones como el
-- Prestamo
-- Socio: nombre, telefono
-- Pelicula: nombre
-- Genero: descripcion
-- Devolucion
SELECT a.id_prestamo, e.nombre, e.telefono, e.direccion, c.titulo AS pelicula, d.descripcion AS genero, DATEDIFF(a.`f_Prog_Dev`, a.fecha) as dias_transcurridos
FROM prestamo a, detalle_prestamo b, pelicula c, genero d , socio e
WHERE a.id_socio = e.id_socio
AND a.id_prestamo = b.id_prestamo
AND b.id_pelicula = c.id_pelicula
AND c.id_genero = d.id_genero
AND a.id_prestamo NOT IN (SELECT id_prestamo FROM devolucion);

-- 6. Crear un query donde muestre las películas junto con el género que no pertenece.
SELECT a.titulo, b.descripcion
FROM pelicula a, genero b
WHERE a.id_genero != b.id_genero;

