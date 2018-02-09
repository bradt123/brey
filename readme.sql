create or replace function mami(op integer)
	returns varchar as 
	$$
	declare
	BEGIN
	  for  in 1 .. op
	   loop
	    return op
	   end loop;
	END;
	$$
	LANGUAGE 'plpgsql';
/**************************************************/
create or replace function po_ne(n int4)
returns boolean as 
$$
declare 
	res boolean:= false;
BEGIN
	if(n >= 0)then
	 	res := true;
	end if;
	return res;
END;
$$
LANGUAGE 'plpgsql';
/**************************************************/
create or replace function whil(n int4)
	returns int4 as $$
	declare
		cont int4;
		res int4;
	BEGIN
	 cont := 1;
	 res := 0;
	 WHILE (cont <= n)
	  loop
	   res := res + cont;
	   cont:= cont +1;
	  end loop;
	 return res;
	END;
$$
LANGUAGE 'plpgsql';

/**************************************************/
create or replace function fo(n int4)
	returns int4 as $$
	declare 
	cont int4;
	res  int4;
BEGIN
	res := 0;
	FOR cont IN 1 .. n
	loop
		res := res + cont;
	end loop;
	return res;
END;
$$
LANGUAGE 'plpgsql';

/**************************************************/
create or replace function con()
	returns int4 as $$
	declare
		total int4;
	BEGIN
		total := 0;
		select into total sum(precio) from libros;
		return total;
	END;
$$
LANGUAGE 'plpgsql';

/**************************************************/

create or replace function consulta(edi varchar(50))
	returns varchar as 
	$$
	declare 
	n int8;
	BEGIN 
	 n := 0;
	 select into n precio from libros
	 where editorial = edi;
	 return n;
	END;
	$$
	LANGUAGE 'plpgsql';
/***************************************************/
create or replace function sentencia(a int4)
	returns int4 as 
$$
BEGIN
	IF (a < 10) THEN
		return 1;
	ELSE 
		return 0;
	END IF;
END;
$$
LANGUAGE 'plpgsql';
/*******************************************/
/*para controlar los puntos de partido de boleiboll*/
create or replace function puntos(e char(3))
	returns char as
$$
declare
	puntuacion_total int4;
	puntos int4;
BEGIN
	puntuacion_total := 0;
	 -- Partidos que el equipo e ha jugado en casa
	select count(*)*3 into puntos 
	from partidos
	where eq_local = e and set_local=3 
	and (set_visitante = 0 or set_visitante =1);
	puntuacion_total = puntuacion_total + puntos;

	select count(*)*2 into puntos 
	from partidos
	where eq_local = e and set_local = 3
	and set_visitante = 2;
	puntuacion_total = puntuacion_total + puntos;

	select count(*)*1 into puntos
	from partidos 
	where eq_local = e and set_local = 2
	and set_visitante = 3;
	puntuacion_total = puntuacion_total + puntos;
	 -- Partidos que el equipo e ha jugado fuera
    SELECT count(*)*3 into puntos 
    FROM partidos
    WHERE eq_visitante=e AND (set_local=0 OR set_local=1) AND set_visitante=3;
    puntuacion_total=puntuacion_total+puntos;
    SELECT count(*)*2 into puntos 
    FROM partidos 
    WHERE eq_visitante=e AND set_local=2 AND set_visitante=3;
    puntuacion_total=puntuacion_total+puntos;
    SELECT count(*)*1 into puntos 
    FROM partidos 
    WHERE eq_visitante=e AND set_local=3 AND set_visitante=2;
    puntuacion_total=puntuacion_total+puntos;
	return puntuacion_total;
END;
$$
LANGUAGE 'plpgsql';

/***********************************************************/
select c1.nombre || ' + '||c2.nombre as combinacion,
c1.precio + c2.precio as total
from snack as c1
cross join snack c2
where c1.tipo = 'cafe' and c2.tipo ='masita';

/***********************************************************/



