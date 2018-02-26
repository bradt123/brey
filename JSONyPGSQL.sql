CREATE TABLE orders(
id serial not null primary key,
info json not null);

--insertar varias filas al mismo tiempo
insert into orders (info) values
	('{"customer":"brey", "items":{"product":"Beer","qty":6}}'),
	('{"customer":"Juan Perez", "items":{"product":"Diaper","qty":24}}'),
	('{"customer":"Lily Bush", "items":{"product":"Toy Car","qty":1}}'),
	('{"customer":"Mary Clark","items":{"product":"Toy Train","qty":2}}');

/* PostgreSQL proporciona dos operadores nativos 
-> Y ->>  para ayudar a consultar datos JSON.
EL operador ->  devuelve el campo de objeto en JSON por clave.
El operador ->> devuelve el campo de objeto JSON  por texto.
*/

/*La siguiente consulta usa 
operador -> para obtener todos los 
clientes en forma de JSON:
*/
SELECT info -> 'customer' as customer
FROM  orders;

/* siguiente consulta usa 
operador ->> para obtener todos 
los clientes en forma de texto:
*/
SELECT info ->> 'customer' as customer
FROM orders;

/*Como -> el operador devuelve un objeto JSON, 
puede encadenarlo con el operador ->> para recuperar un nodo específico. 
Por ejemplo, la siguiente declaración devuelve todos 
los productos vendidos*/

SELECT info -> 'items' ->> 'product' as product
FROM  orders
ORDER BY product;

/*USANDO EL OPERADOR WHERE CON JSON
podemo usarlo para filtrar las filas que vuelven.
por ejemplo quien compro un tipo especifico de
producto. utilizamos la siguiente consulta*/

SELECT info ->> 'customer' as customer
FROM orders
WHERE info ->'items' ->> 'product' = 'Diaper';

/*Para saber quién compró 2 productos
 a la vez, utilizamos la siguiente consulta:
 Tenga en cuenta que usamos el tipo (CAST) de conversión
 para convertir el campo de cantidad en INTEGER y 
 lo comparamos con 2.
 */
SELECT 
info -> 'customer' as customer,
info -> 'items' ->> 'product' as product
FROM orders
WHERE
CAST(
	info -> 'items' ->> 'qty' as integer
) = 2;

/*Podemos aplicar funciones agregadas como 
MIN, MAX, AVERAGE, SUM, etc. a datos JSON. 
Por ejemplo, la siguiente declaración arroja 
la cantidad mínima, la cantidad máxima, 
la cantidad promedio y la cantidad total de productos vendidos.
*/
SELECT
 MIN (
 CAST (
 info -> 'items' ->> 'qty' AS INTEGER
 )
 ),
 MAX (
 CAST (
 info -> 'items' ->> 'qty' AS INTEGER
 )
 ),
 SUM (
 CAST (
 info -> 'items' ->> 'qty' AS INTEGER
 )
 ),
 AVG (
 CAST (
 info -> 'items' ->> 'qty' AS INTEGER
 )
 )
FROM
 orders;

/*Funciones PostgreSQL JSON
PostgreSQL nos proporciona algunas funciones 
para ayudarlo a procesar datos JSON.

Función json_each
La función json_each () nos permite expandir
el objeto JSON externo a un conjunto de pares clave-valor.
Ver la siguiente declaración:
json_each_text() para texto,
json_each_key() funccion para obtener conjunto de claves
en el objeto.
json_typeof() funcion para saber que tipo de valor JSON 
externo.
*/

SELECT json_each(info)
FROM orders;

SELECT
 json_typeof (info->'items')
FROM
 orders;
--OBJECT

SELECT
 json_typeof (info->'items'->'qty')
FROM
 orders;
--NUMBER



