create table curso(
	id_curso serial not null,
	nivel varchar(50) not null,
	nombre varchar(50) not null,
	primary key(id_curso)
);

create table alumno(
	id_alumno serial,
	rut varchar(10) not null,
	nombre varchar(100) not null,
	edad int not null,
	sexo char(1) check(sexo in ('M','f')),
	id_curso int not null,
	primary key(rut),
	foreign key(id_curso) references curso(id_curso)
);


create table profesor(
	id_profesor serial,
	rut varchar(10) not null,
	nombre varchar(100) not null,
	sexo char(1) check(sexo in('M','F')),
	primary key(rut)
);

create table asignatura(
	id_asignatura serial not null,
	nombre varchar(100) not null,
	primary key(id_asignatura)
);

create table profesor_curso(
	id_profesor_curso serial not null,
	rut_profesor varchar(10) not null,
	id_curso int not null,
	primary key(id_profesor_curso),
	foreign key(rut_profesor) references profesor(rut),
	foreign key(id_curso) references curso(id_curso)
);

create table alumno_asignatura(
	id_alumno_asignatura serial not null,
	rut_alumno varchar(10) not null,
	id_asignatura int not null,
	id_curso int not null,
	--alumno varchar(40),
	notacumulada int,
	notaexamen int,
	total int,
	primary key(id_alumno_asignatura),
	foreign key(id_curso) references curso(id_curso),
	foreign key(rut_alumno) references alumno(rut),
	foreign key(id_asignatura) references asignatura(id_asignatura)
);

create table profesor_asignatura(
	id_profesor_asignatura serial not null,
	rut_profesor varchar(10) not null,
	id_asignatura int not null,
	primary key(id_profesor_asignatura),
	foreign key(rut_profesor) references profesor(rut),
	foreign key(id_asignatura) references asignatura(id_asignatura)
);


/*PARA LLAMAR AL NIVEL DE CURSO Y NOMBRE DE PROFESOR
DE LA TABLA PROFESOR_CURSO*/
select c1.nivel,c2.nombre
from profesor_curso   p
inner join curso c1
on p.id_curso = c1.id_curso 
inner join profesor  c2
on p.rut_profesor = c2.rut;

/*PARA LLAMAR AL NOMBRE DE PROFESRO Y NOMBRE DE LA ASIGNATURA
QUE DA
DE LA TABLA PROFESOR_ASIGNATURA*/
select c1.nombre,c2.nombre
from profesor_asignatura pro
inner join profesor c1 on pro.rut_profesor=c1.rut
inner join asignatura c2 on pro.id_asignatura=c2.id_asignatura;



/*PARA LLAMAR NOMBRE ALUMNO,NOMBRE ASIGNATURA,NOMBRE DE NIVEL
DE CURSO, Y NOTA DE ALUMNO_ASIGNATURA*/
--DE LA TABLA ALUMNO_ASIGNATURA
select c1.nombre,c2.nombre,c3.nivel,a.total as notafinal
from alumno_asignatura a 
inner join alumno c1 on a.rut_alumno=c1.rut
inner join asignatura c2 on a.id_asignatura=c2.id_asignatura
inner join curso c3 on a.id_curso = c3.id_curso;