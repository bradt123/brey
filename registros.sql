 group BY USO 

 select editorial, count(*)
  from libros
  group by editorial;

para uso de HAVING SELECCIONAR O RECHAZAR GRUPO DE REGISTROS
Si queremos saber la cantidad de libros agrupados por
 editorial pero considerando sólo algunos grupos, 
 por ejemplo, los que devuelvan un valor mayor a 2,
  usamos la siguiente instrucción:

 select editorial, count(*) from libros
  group by editorial
  having count(*)>2;

  Queremos el promedio de los precios de los libros
   agrupados por editorial, pero solamente de aquellos
    grupos cuyo promedio supere los 25 pesos:

 select editorial, avg(precio) from libros
  group by editorial
  having avg(precio)>25;

TRABAJO CON DOS O MAS TABLAS

 Hay tres tipos de combinaciones:

combinaciones internas (inner join o join),
combinaciones externas y
combinaciones cruzadas.

Ejemplo

 select CAMPOS
  from TABLA1
  join TABLA2
  on CONDICIONdeCOMBINACION;
Ejemplo:

 select * from libros
  join editoriales
  on codigoeditorial=editoriales.codigo;

  /*ON hace coincidir los codigos de hambas tablas*/
  Para simplificar la sentencia podemos usar un alias para cada tabla:

 select l.codigo,titulo,autor,nombre
  from libros as l
  join editoriales as e
  on l.codigoeditorial=e.codigo;


ejemplo


 create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
 );

 create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha date
 );

 Muestre el nombre, el deporte y las fechas de inasistencias, ordenado por nombre y deporte.
Note que la condición es compuesta porque para identificar los registros de la tabla "inasistencias"
necesitamos ambos campos.
solucion

select nombre,insc.deporte,ina.fecha
  from inscriptos as insc
  join inasistencias as ina
  on insc.documento=ina.documento and
  insc.deporte=ina.deporte
  order by nombre, insc.deporte;


--INTO ES PARA ASIGNAR LA CAPTURA EN ESA VARIABLE
--EN ESTE CASO X 
  select min(price) INTO X FROM "TABLA"