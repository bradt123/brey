ESTRUCTURA DE FUNCION
CREATE OR REPLACE FUNCTION nombrefuncion(parametros)
RETURNS tipo AS $$
DECLARE
[Declaraciones de variables];
BEGIN
[Codigo Executable];
END
$$
LANGUAGE 'plpgsql'

/***************************/
EJEMPLO

CREATE OR REPLACE FUNCTION ejemplo_txt(integer, integer) 
RETURNS text AS $$
DECLARE
 numero1 ALIAS FOR $1;
 numero2 ALIAS FOR $2;

 constante CONSTANT integer := 100;
 resultado INTEGER;

 resultado_txt TEXT DEFAULT 'El resultado es 104'; 

BEGIN
 resultado := (numero1 * numero2) + constante;

 IF resultado <> 104 THEN
    resultado_txt :=  'El resultado NO es 104';
 END IF;

 RETURN resultado_txt;
END;
$$ LANGUAGE plpgsql;

/*MODO DE LLAMADA A LA FUNCION */

select ejemplo_txt(3,3);

/*ejemplo sobre tabla (aunque no es plpgsql si non sql*/
 create or replace function medicaro() 
 returns medicine
 as
 'select * 
 from medicine
 where price=(select max(price) from medicine);'
 language sql;
 
 select medicaro();
/***************************/
otro ejemplo sencillo

 create or replace function cli(x integer)
RETURNS bigint as 

 'select count(price)
 from medicine
 where quantity <= x;'
 
 LANGUAGE 'sql';
 
select cli(150);


/***************************/
create or replace function hello(varchar)
returns varchar as
$$
begin 
return $1; --retorna el primer parametro ingresado
end;
$$
LANGUAGE 'plpgsql'

/***************************/
create or replace function op(num1 numeric,num2 numeric)
returns varchar as 
$$
declare 	
	res numeric := 0; --declarar e inicializar una variable
    ale numeric := random();
begin
	res := (num1 + num2) + 0.5 * TRUNC(ale,3); --TRUNC() para sacar los decimales que queramos
    return concat('el resultado de la operacion (',num1,'+',num2,') + ',0.5,' * ',TRUNC(ale,3),' es: ',TRUNC(res,3)); --concatenar varias cadenas,numeros,variables
end;
$$
LANGUAGE 'plpgsql';

/***************************/
/*WHILE*/
create or replace function wil(n int4)
returns int4 as 
$$
declare
	cont int4;
    res int4;
begin
	cont :=1;
    res :=0;
    WHILE(cont <= n)
    LOOP
    	res := res + cont;
        cont := cont + 1;
    end loop;
    return res;
end;
$$
LANGUAGE 'plpgsql'
/***************************/
/*FOR*/
CREATE OR REPLACE FUNCTION adicion(n int4)
returns int4 as
$$
declare
	cont int4;
    res int4;
begin
	res := 0;
    FOR cont IN 1 .. n
    	LOOP
        	res := res + cont;
        END LOOP;
    RETURN res;
end;
$$
LANGUAGE 'plpgsql';

/***************************/

/*uso con tablas
SETOF "nombre de la tabla"
setof devuelve los datos que consultamos de la tabla*/
--RETORNA TODA UNA TABLA 
create or replace function tabla()
returns SETOF employees AS
$$
BEGIN
	RETURN QUERY SELECT * FROM employees;
END;
$$
LANGUAGE 'plpgsql';

select tabla();
/*o mejor*/
SELECT * FROM tabla();

/***************************/
IMPORTANTE
/*RETORNAR CAMPOS ESPECIFICOS DE UNA TABLA CON 
PARAMETROS*/


CREATE OR REPLACE FUNCTION retorna(
IN op VARCHAR, OUT code int4, OUT nom VARCHAR, OUT price numeric)
-- IN es para parametros de ingreso
-- OUT es para parametros de salida
RETURNS SETOF RECORD AS 
--SETOF RECORD datos que salen o con multitablas
$$
BEGIN
	IF(lower(op) = 'p') THEN
    	RETURN QUERY select id,name,basicsalary
        	FROM employees
            where mod(basicsalary,2) = 0; --mod() para hallar el reciduo
	ELSIF (lower(op) = 'i')THEN
    	RETURN QUERY select id,name,basicsalary
        		FROM employees
                where mod(basicsalary,2)<>0;
    ELSE
    	RAISE EXCEPTION 'Error:  El parametro ingresado no es compatible: %',op;
    END IF;
END;
$$
LANGUAGE 'plpgsql';

select * from retorna('i');