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
/*on codigoeditorial=e.codigo funciona tambien*/

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
/****************************************/
--cross join para combinaciones entre tablas
--tabla 1 (4filas) tabla 2(2filas)
--cross join multiplica tabla1 X tabla2
--4 por 2 develve 8 filas
select campos
from tabla1
cross join tabla2;

--ejemplo
create table comidas(
  codigo serial primary key,
  nombre varchar(30),
  precio decimal(4,2)
);
create table postres(
codigo serial primary key,
nombre varchar(30),
precio decimal(4,2)
);
--consulta
select c.nombre as platoprincipal,
p.nombre as postres,
c.precio + p.precio as total
from comidas as c
cross join postres as p;

/****************************************/
--AUTOCOMBINACIONES O LLAMDA RECURSIVIDAD DE TABLA
--parece mejor para combinaciones
create table comidas(
codigo serial,
nombre varchar(30),
precio decimal(4,2),
rubro char(6), --'plato' =plato principal','postre'=postre)
primary key(codigo)
);
--USAMOS REGLA WHERE EN LA CONSULTA PARA NO VER REPETIDOS

select c1.nombre as platoprincipal,
c2.nombre as postre,
c1.precio + c2.precio as total
from comidas as c1
cross join comidas c2
where c1.rubro = 'plato' and c2.rubro = 'postre';

/****************************************/
--CONBINACION DE MAS DE 2 TABLAS
--ejemplo
select titulo,a.nombre,e.nombre
from autores as a 
join libros as l
on codigoautor =a.codigo
join editorial as e
on codigoeditorial=e.codigo;


/******************************/
--SUBCONSULTAS CTE
select campos
from tabla
where campo operador(SUBCONSULTA);

ooooooo

select campo operador(SUBCONSULTA)
from tabla;

--EJEMPLO
select titulo,autor,precio
--,precio - (select max(precio) from libros) as diferencia
from libros 
--where titulo ='uno';
where precio = (select max(precio) from libros);
--CUANDO UNA SUBCONSULTA DEVUELVE UNA LISTA USAMOS
--WHERE CAMPO IN (SUBCONSULTA) oo WHERE CAMPO NOT IN (SUBCONSULTA)
 select nombre
  from editoriales
  where codigo in
   (select codigoeditorial
     from libros
     where autor='Richard Bach');


--VISTA (ALTERNATIVA PARA MOSTRAR DATOS DE VARIAS TABLAS)
--ES COMO UNA TABLA VIRTUAL QUE ALMACENA UNA CONSULTA;
create view "nombre_vista" as 
  sentencia select
  from tabla;

--LLAMADA
select * from "nombre_vista";
--EJEMPLO

 create view vista_empleados as
  select (apellido||' '||e.nombre) as nombre,sexo,
   s.nombre as seccion, cantidadhijos
   from empleados as e
   join secciones as s
   on codigo=seccion;
--para eliminar vista DROP VIEW "nombre_vista";