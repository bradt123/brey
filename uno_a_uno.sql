/*UNA PERSONA EN LA EMPRESA SOLO PUEDE TENER UN CORREO*/
create table persona(
id_persona serial not null,
nombre varchar(30),
apellido varchar(30),
primary key(id_persona)
);

create table email(
id_email serial not null,
email varchar(20) not null,
id_persona integer references persona(id_persona),  --PARA AGREGAR LLAVE FORANEA
primary key (id_email)
);

ALTER TABLE email add constraint UQ_email_unico UNIQUE(email,id_persona);

--unique(email,id_persona) para que no se repitan los datos relacion
--unique me permite relizar la relacion uno a uno IMPORTANTE


/*********************/
otro seria un empleado tien un solo sueldo;
