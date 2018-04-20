/*CADA TIPO DE DATO TIENE SU PROPIO TIPO DE AREGLO COMPLEMENTARIO
POR EJEMPLO, integer => integer[], character => character[] etc..*/

CREATE TABLE table_name(
id_table_name serial primary key,
name varchar(100),
phones text[]
);

/*LA INSERCION SERIA DE LA SIGUIENTE MANERA*/
INSERT INTO table_name (name,phones) values
('John Doe', array['2134234','4324234']);

/*TAMBIEN SE PUEDE UTILZAR LLAVES DE LA SIGUIENTE MANERA*/
INSERT INTO table_name (name,phones) values
('Lily Bush','{"34543534"}'),
('William Gate', '{"(408)-589-5842","(408)-589-58423"}');

/*ACCEDEMOS A LOS ELEMENTOS DE LA MATRIZ USANDO EL SUBINDICE
ENTRE CORCHETES []
column_name [i]*/

SELECT name, phones[1] FROM table_name;

/*PODEMOS USAR UN ELEMENTO DE MATRIZ EN LA CLAUSULA WHERE COMO LA
CONDICION PARA FILTRAR LAS FILAS
por ejemplo, para saber quie tiene el numero de telefono
4343454 usamos la siguiente consulta*/

SELECT name,phones 
FROM table_name
WHERE phones [2] = '4343454';

SELECT name,phones[2]
FROM contacts
WHERE  id_table_name = numero_de_id_table_name;

/*PARA ACTUALIZAR LA TABLA*/
UPDATE table_name SET phones = '{"(408)-589-5843"}'
WHERE id_table_name = numero_de_id_table_name;

/*Buscar en la matriz PostgreSQL
Supongamos que queremos saber quién 
tiene el número de teléfono (408) -589-5555, 
independientemente de la posición del número 
de teléfono en la matriz de teléfonos, 
usamos la función ANY () de la siguiente manera:*/

SELECT name,phones 
FROM table_name
WHERE '(408)-589-5555' = ANY(phones);
order by 1Breydi8@
/*EXPADIR MATRICES
unnest() ES UNA //NIT//FUNCION PARA EXPANDIR UNA MATRIZ A UNA
LISTA DE FILAS.(en//breydi56P// este caso los numeros que tiene cada persona)*/

SELECT name,unnest(phones)
FROM table_name;
