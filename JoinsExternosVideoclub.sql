-- Active: 1744520612104@@127.0.0.1@3306@videoClub
use videoClub;

SELECT * FROM genero;
SELECT * FROM pelicula;

--1. Se quiere saber el nombre y año de las peliculas que son de terror y accion
SELECT a.titulo Nombre, a.anio "Año", b.descripcion Genero 
FROM pelicula a INNER JOIN genero b
WHERE a.id_genero = b.id_genero
AND b.id_genero IN (1,5); 

--2. Se necesita ver el nombre de la pelicula, fecha de prestamo y el consecutivo ejemplar
SELECT a.titulo AS Titulo, d.fecha AS "Fecha de prestamo", c.consecutivo AS Consecutivo
FROM pelicula a
INNER JOIN detalle_prestamo c ON a.id_pelicula = c.id_pelicula
INNER JOIN ejemplar b ON b.id_pelicula = c.id_pelicula AND b.consecutivo = c.consecutivo
INNER JOIN prestamo d ON d.id_prestamo = c.id_prestamo;

-- 3. Queremos que actores participan en cada pelicula
SELECT a.titulo nombre, c.nombre_real, c.nombre_artistico
FROM pelicula a 
INNER JOIN participa b ON a.id_pelicula = b.id_pelicula
INNER JOIN actor c ON b.id_actor = c.id_actor;

-- 4. Queremos saber los directores de las peliculas de drama y comedia
SELECT a.titulo AS nombre, b.nombre AS director, c.descripcion AS genero
FROM pelicula a
INNER JOIN director b ON a.id_director = b.id_director
INNER JOIN genero c ON a.id_genero = c.id_genero
WHERE c.id_genero IN (3, 2);

-- 5. Se necesita informacion de las no devoluciones como el
-- Prestamo
-- Socio: nombre, telefono
-- Pelicula: nombre
-- Genero: descripcion
-- Devolucion
SELECT a.id_prestamo, e.nombre, e.telefono, e.direccion, c.titulo AS pelicula, d.descripcion AS genero, DATEDIFF(a.`f_Prog_Dev`, a.fecha) as dias_transcurridos
FROM prestamo a
INNER JOIN socio e ON a.id_socio = e.id_socio
INNER JOIN detalle_prestamo b ON a.id_prestamo = b.id_prestamo
INNER JOIN pelicula c ON b.id_pelicula = c.id_pelicula
INNER JOIN genero d ON c.id_genero = d.id_genero
LEFT JOIN devolucion f ON a.id_prestamo = f.id_prestamo
WHERE f.id_devolucion IS NULL;

-- 6. Crear un query donde muestre las películas junto con el género que no pertenece.

SELECT a.titulo, b.descripcion
FROM pelicula a INNER JOIN genero b
ON a.id_genero != b.id_genero;