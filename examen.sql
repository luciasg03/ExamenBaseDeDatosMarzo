-- SE DEBE EDITAR ESTE FICHERO Y AÑADIR LAS CONSULTAS SQL QUE RESUELVAN LA PREGUNTA
-- <= Estos guiones son comentarios en el fichero, para que se pueda ejecutar directamente
-- tambien se usan para que los editores de texto como sublimeText reconozcan la sintaxis SQL


-- Se debe poner tambien el resultado que devuelva la consulta (usar los guiones para no estropear el fichero)
-- En caso que sea un listado, vale con el primer resultado y el numero de elementos que devuelve la consulta

-- EJEMPLO

-- ¿Cuantos capitulos hay?
SELECT COUNT(*) FROM capitulos;
-- 6


-- CONSULTAS DEL EXAMEN:

-- 1.- ID de los personajes que hayan estado en el lugar 'Taberna 7ºCielo'

-- SELECT p.nombre from personaje p, lugares l, persona pe, anecdotas a, mn_lugares_anecdota la
--where p.id_persona=pe.id
--and pe.id=a.id_persona
--and a.id=la.id_anecdota
--and la.id_lugar=l.id
--and l.nombre='Taberna 7ºCielo';



-- 2.- ID, y Nombre de las personas con personajes que tuvieran la habilidad 'Bola de Fuego'

--CONSULTA
--SELECT p.id, p.nombre from personaje p, mn_habilidad_personaje hp, habilidades h
--where p.id=hp.id_personaje 
--and hp.id_habilidad=h.id
--and h.nombre='Bola de Fuego';

--RESPUESTA
--1  Chorvitta
--9  Sr. Mani
--13 Shadow
--15 MOBO



-- 3.- ¿Que habilidades tienen los personajes casados?

--CONSULTA
--SELECT DISTINCT h.nombre
--from tipo_relacion tr, relacion r, personaje p, mn_habilidad_personaje hp, habilidades h
--where tr.id=r.id_tipo_relacion
--and r.id_personaje=p.id
--and p.id=hp.id_personaje
--and hp.id_habilidad=h.id
--and tr.nombre='casado';

--RESPUESTA
--Bola de Fuego
--Rayo de Hielo
--Arco Recargable
--Ballesta Virotes
--Anillo Invocación
--Rayo de Luz
--Infravisión
--Resistente Magica
--Agil 



-- 4.- ¿Que personaje tiene la fuerza más baja y quien lo interpreta?

--CONSULTA
--SELECT min(cr.fuerza), pe.nombre
--from persona pe, personaje p, caracteristicas_rol cr
--where pe.id=p.id_persona
--and p.id_rol=cr.id;

--RESPUESTA
--157 Nacho



-- 5.- Capitulos con más de una anecdota relacionada

--CONSULTA
--SELECT c.titulo
--from capitulos c, mn_anecdota_capitulo ac, anecdotas a, mn_anecdotas_relacionadas ar
--where ac.id_capitulo=c.id
--and ac.id_anecdota=a.id
--and a.id=ar.id_anecdota
--and ar.id_relacionada>1;



-- 6.- Todas las relaciones de los personajes del capitulo 1

--CONSULTA
--SELECT tr.nombre
--from tipo_relacion tr, relacion r, personaje p, mn_personaje_capitulo pc, capitulos c
--where tr.id=r.id_tipo_relacion
--and r.id_personaje=p.id
--and p.id=pc.id_personaje
--and pc.id_capitulo=c.id
--and c.titulo = 'Cap 01';

--RESPUESTA
--Pareja
--Madre
--Tio
--Enemigo
--Nieto
--Abuelo
--Padre
--Sobrino
--Hijo
--Casado
--Amigo



-- 7.- ¿Cual es la media de carisma de los Humanos?

--CONSULTA
--select AVG(cr.carisma)
--from raza r, personaje p, caracteristicas_rol cr
--where r.id=p.id_raza
--and p.id_rol=cr.id
--and r.nombre = 'humano';

--RESPUESTA
--816.5000

-- 8.- ¿Cual es la media de los personajes de una persona?

--CONSULTA
--SELECT AVG(p.id)
--from personaje p, persona pe
--where p.id_persona = pe.id;

--RESPUESTA
--10.6471



-- 9.- ¿Cual es la raza habitual de 'Pablo Rodriguez'?

--CONSULTA
--SELECT r.nombre
--from raza r, personaje p, persona pe
--where r.id=p.id_raza
--and p.id_persona=pe.id
--and pe.nombre='Pablo'
--and pe.apellidos='Rodriguez';

--RESPUESTA

--Enano



-- 10.- Habilidades que no estuvieran en ninguna anecdota

 

-- 11.- ¿Cuantos personajes hubo en cada anecdota?

--CONSULTA
--SELECT count(DISTINCT p.id), a.id
--from personaje p,  mn_personaje_anectdota pa, anecdotas a
--where p.id=pa.id_personaje
--and pa.id_anecdota=a.id;

-- 12.- Listado de Personajes de cada capitulo

-- 13.- Lugares más repetidos en las anecdotas

-- 14.- ¿Que raza tiene la constitución más baja?

--CONSULTA
--select min(cr.constitucion), r.nombre
--from caracteristicas_rol cr, personaje p, raza r
--where r.id=p.id_raza
--and p.id_rol=cr.constitucion;

--RESPUESTA
--387 Elfo

-- 15.- ¿Que raza de personaje es más bajo de media?

--CONSULTA
--SELECT cf.altura, r.nombre
--from raza r, personaje p, carasteristicas_fisicas cf
--where r.id=p.id_raza
--and p.id_fisicas=cf.id
--ORDER by cf.altura asc
--limit 1;

--RESPUESTA
--NULL Elfo Silvano

