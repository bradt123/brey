/**************************************/
--RELACION UNO A MUCHO: UNA EMPRESA TIENE MUCHOS EMPLEADOS
--UN EMPLEADO PERTENECE SOLO A UN AEMPRESA

create table empresa(
id_empresa serial primary key,
nombre varchar (30),
id_empleado INTEGER);

ALTER TABLE empresa add constraint fk_id_empleado FOREIGN KEY(id_empleado) 
REFERENCES empleado(id_empleado);

ALTER TABLE empresa add constraint UQ_id_empleado UNIQUE(id_empleado);

--unique(id_empleado) hace que se la relacion uno a muchos


create table empleado(
id_empleado serial primary key,
nombre varchar(30));


