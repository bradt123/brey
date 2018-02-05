postgreSQL

--para crear usuario

CREATE USER snicoper WITH PASSWORD '123456' NOCREATEDB NOCREATEUSER;

--para resetear el password del usuario 

ALTER USER usertochange WITH password 'new_passwd';

--para cambiar de nombre a columna

alter table books rename column cod to code;

--para agregar columna

alter table books add column code serial not null primary key; o 
alter table books add column name varchar(20);

--para modificar la columna y que no acepte datos nulos

alter table nombre_table alter column nombre_columna set not null

--Modificar el tipo de dato a una columna

alter table nombre_table alter column nombre_columna type smallint;

--agregar una foreign-key

alter table nombre_table add foreign key(nombre_columna) references nomina(nombre_columna)

--eliminar el valor que tiene por default una columna

alter table nombre_table alter column nombre_columna drop default;

--Agregar un valor por default a una columna

alter table nombre_table alter column nombre_columna set default 125;

--para eliminar columna

alter table books drop column code;

--para actualizar o modifcar datos

update books set name = 'nuevo valor' where code = 'condicion';

--para eliminar datos

delete from peliculas where duracion=120;

--Elimine todos los registros o datos (pero si ingresamos otros datos continua los codigos)

delete from medicines;

--para vaciar la tabla con truncate table (opcion para eliminar todo y restablecer el codigo a 0)

truncate table medicines;

--para eliminar la tabla

drop table medicines;

--para duplicar table con todo sus restricciones

create table la_nueva(like la_otra including defaults INCLUDING CONSTRAINTS
including INDEXES);

--para insertar los datos de la tabla a la nueva tabla

insert into la_nueva select * from la_otra;


--para concatenar la salida de datos(||)

select name || ',' || description
from article;


--para descuento
select title,author,price, price * 0.1 as descuento, 
price -(price * 0.1) as precio_final 
from books
where editorial ='Emece';

--par que los datos de salida esten en MASYUSCULA(uso de funcion 'upper()')

select document,upper(lastname),upper(name),home
from client;

lower(string): Retorna el texto convertido a minúsculas

--para mostrar el primer caracter de los datos de una columna (uso de la funcion 'substr')

select document,lastname,substr(name,1,1),home,telephone
from client;

--funcion 'ceil()' para redondeo

select ceil(credito) from client;

char_length(string): Retorna la longitud del texto. 

position(string in string): Retorna la posición de un string dentro de otro. 
Si no está contenido retorna un 0 ejemplo

select position('Mundo' in 'Hola Mundo');
retorna 6.


substring(string [from int] [for int]): Retorna un substring, le indicamos la posición inicial y la cantidad de caracteres a extraer desde dicha posición. Ejemplo:

select substring('Hola Mundo' from 1 for 2);
retorna 'Ho'.

lpad(text,int,text): Rellena de caracteres por la izquierda. El tamaño total de campo es indicado por el segundo parámetro y el texto a insertar se indica en el tercero. Ejemplo:

select lpad('Hola Mundo',20,'-');
retorna '----------Hola Mundo'.

rpad(text,int,text): Rellena de caracteres por la derecha. El tamaño total de campo es indicado por el segundo parámetro y el texto a insertar se indica en el tercero. Ejemplo:

select rpad('Hola Mundo',20,'-');
retorna 'Hola Mundo----------'.


--funciones matematicas 

abs(x): retorna el valor absoluto del argumento "x". Ejemplo:

 select abs(-20);
 retorna 20.


cbrt(x): retorna la raíz cúbica del argumento "x". Ejemplo:

 select cbrt(27);
retorna 3.

floor(x): redondea hacia abajo el argumento "x". Ejemplo:

 select floor(12.34);
retorna 12.

power(x,y): retorna el valor de "x" elevado a la "y" potencia. Ejemplo:

 select power(2,3);
retorna 8.

round(numero): retorna un número redondeado al valor más próximo. Ejemplo:

 select round(10.4);
retorna "10".

sqrt(x): devuelve la raíz cuadrada del valor enviado como argumento. Ejemplo:

 select sqrt(9);
retorna "3".


mod(x,y): devuelve el resto de dividir x con respecto a y. Ejemplo:

 select mod(11,2);
retorna "1".

sign(x): si el argumento es un valor positivo devuelve 1;-1 si es negativo y si es 0, 0. Ejemplo:

 select sign(-23.4);
retorna "-1".

pi(): devuelve el valor de pi. Ejemplo:

 select pi();
retorna "3.14159265358979".


random(): devuelve un valor aleatorio entre 0 y 1 (sin incluirlos). Ejemplo:

 select random();
retorna por ejemplo "0.895562474101578".


trunc(x): Retorna la parte entera del parámetro. Ejemplo:

 select trunc(34.7);
retorna "34".


trunc(x,decimales): Retorna la parte entera del parámetro y la parte decimal truncando hasta el valor indicado en el segundo parámetro. Ejemplo:

 select trunc(34.7777,2);
retorna "34.77".

sin(x): Retorna el valor del seno en radianes. Ejemplo:

 select sin(0);
retorna "0".


cos(x): Retorna el valor del coseno en radianes. Ejemplo:

 select cos(0);
retorna "1".


tan(x): Retorna el valor de la tangente en radianes. Ejemplo:

 select tan(0);
retorna "0".

--funciones para fecha

- current_date: retorna la fecha actual. Ejemplo:

 select current_date;
Retorna por ejemplo '2009-05-20'


- current_time: retorna la hora actual con la zona horaria. Ejemplo:

 select current_time;
Retorna por ejemplo '18:33:06.074493+00'


- current_timestamp: retorna la fecha y la hora actual con la zona horaria. Ejemplo:

 select current_timestamp;
Retorna por ejemplo '2009-05-20 18:34:16.63131+00'



-- para mostrar el anio

 select nombre,mail,
  extract(month from column_fecha) as mes,
  extract(day from column_fecha) as dia,
  extract(hour from column_fecha) as hora
  from visitas
  
--ORDER BY para ordenar en forma acendente(asc) o descendente(desc)
  
select *
from visitor
ORDER BY DAY desc;

-- personas que visitaron en octubre(el 2=country)

select mail,country
from visitor
where EXTRACT(month from day) = 10
order by 2;
  
--tipo de dato para que la fecha te muestre completa('2006-10-10 10:10')

  TIMESTAMP
1) date: almacena una fecha en el rango de 4713 antes de crísto hasta 32767 después de cristo.

2) time: Almacena la hora del día.

3) timestamp: Almacena la fecha y la hora del día.

Las fechas se ingresan entre comillas simples.

PostgreSQL permite configurar el formato de ingreso de la fecha seteando la variable de entorno llamada DATESTYLE:

SET DATESTYLE TO 'European';

--Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100

select * from medicamentos
  where laboratorio='Bayer' and
  not cantidad=100;


SENTENCIA HAVING

