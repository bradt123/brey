EJEMPLO

CREATE OR REPLACE FUNCTION ejemplo_txt(integer, integer) RETURNS text AS $$
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