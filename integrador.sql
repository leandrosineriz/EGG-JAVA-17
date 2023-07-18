/*CANDADO A = 2
Posición: El candado A está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Teniendo el máximo de asistencias por partido, muestre cuantas veces se logró dicho máximo.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/
select count(*) from estadisticas
where Asistencias_por_partido = (
select max(Asistencias_por_partido) from estadisticas);

#CLAVE = 14043
/*Clave: La clave del candado A estará con formada por la/s siguientes consulta/s a la base de
datos:
Muestre la suma total del peso de los jugadores, donde la conferencia sea Este y la posición sea
centro o esté comprendida en otras posiciones*/
select sum(j.Peso) from jugadores j
join equipos e on j.Nombre_equipo = e.Nombre
where e.Conferencia='east'
AND j.Posicion LIKE '%c%';

#CLAVE B = 3
/*CANDADO B
Posición: El candado B está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Muestre la cantidad de jugadores que poseen más asistencias por partidos, que el numero de
jugadores que tiene el equipo Heat.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/
select * from estadisticas;
select count(*) from jugadores j
join estadisticas e on j.codigo = e.jugador
where Asistencias_por_partido>(
select count(*) from jugadores
where Nombre_equipo like "Heat"
);

#CLAVE = 1740
/*Clave: La clave del candado B estará con formada por la/s siguientes consulta/s a la base de
datos:
La clave será igual al conteo de partidos jugados durante las temporadas del año 1999*/
select count(*) from partidos
where temporada LIKE '99%';



/*CANDADO C = 1
Posición: El candado C está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
La posición del código será igual a la cantidad de jugadores que proceden de Michigan y forman
parte de equipos de la conferencia oeste.
Al resultado obtenido lo dividiremos por la cantidad de jugadores cuyo peso es mayor o igual a
195, y a eso le vamos a sumar 0.9945.
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/
select count(*)/(
select count(*) from jugadores j2
where j2.Peso>=195)+0.9945 from jugadores j
join equipos e on j.Nombre_equipo = e.Nombre
where e.Conferencia='west'
AND j.Procedencia LIKE 'Michigan';

#Clave C = 630
/*Para obtener el siguiente código deberás redondear hacia abajo el resultado que se devuelve de
sumar: el promedio de puntos por partido, el conteo de asistencias por partido, y la suma de
tapones por partido. Además, este resultado debe ser, donde la división sea central.*/

select floor(AVG(e.Puntos_por_partido)+COUNT(e.Asistencias_por_partido)+SUM(e.Tapones_por_partido)) from estadisticas e
join jugadores j on e.jugador = j.codigo
join equipos eq on j.Nombre_equipo = eq.Nombre
where eq.Division = 'central';

SELECT 
  FLOOR(AVG(Puntos_por_partido)) +
  FLOOR(COUNT(Asistencias_por_partido)) +
  FLOOR(SUM(Tapones_por_partido))
FROM 
  estadisticas AS e
INNER JOIN 
  jugadores AS j ON e.jugador = j.codigo
INNER JOIN 
  equipos AS eq ON j.Nombre_equipo = eq.Nombre
WHERE 
  eq.Division = 'Central';
  
/*CANDADO D = 4
Posición: El candado D está ubicado en la posición calculada a partir del número obtenido en la/s
siguiente/s consulta/s:
Muestre los tapones por partido del jugador Corey Maggette durante la temporada 00/01. Este
resultado debe ser redondeado. Nota: el resultado debe estar redondeado
Este resultado nos dará la posición del candado (1, 2, 3 o 4)*/

select round(Tapones_por_partido)  from jugadores j
join estadisticas e on j.codigo = e.jugador
where nombre = "Corey Maggette" 
AND temporada="00/01";

#Clave 191
/*Clave: La clave del candado D estará con formada por la/s siguientes consulta/s a la base de
datos:
Para obtener el siguiente código deberás redondear hacia abajo, la suma de puntos por partido
de todos los jugadores de procedencia argentina*/
select floor(sum(Puntos_por_partido)) from estadisticas e
join jugadores j on e.jugador = j.codigo
where Procedencia='argentina';