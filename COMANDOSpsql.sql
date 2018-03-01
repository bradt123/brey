/*para conectarce a base de datos bajo usuario especifico*/
psql -d database -U user -W
/*para conectarce a base de datos remoto(otro)*/
psql -h host -d database -U user -W
/*en caso de conectarce usando SSL*/
psql -U user -h host "dbname=db sslmode=require"

/*****/
\l
\dt 
\d table_name
\df --para ver funciones
\dn --para ver eschemas
\dv --para ver vistas
\du --para ver lista de usuarios
\g  --para ver la version de postgresql
\s  --para ver el historial de comandos usados
\h  name_comando --para ver la funcion de cualquier comando /*update-alter-select-etc
\timing --(para aviliarlo)para ver el tiempo que toma resolver la consulta
\timing --(para desabiliartlo)
\e --par usar un editor externo muy util
\ef [function name] --para editar funciones o plantilla basica

/*PARA EXPORTAR LOS DATOS DE TABLA (en este caso a excel*/
COPY table_name TO 'RUTA\nombre_archivo' DELIMITER
'operador de separacion' CSV HEADER;

COPY person TO 'C:\tmp\person_db.csv' DELIMITER ',' CSV HEADER;

/*PARA EXPORTAR COLUMNAS DEFINIDAS*/
COPY persons(first_name,last_name,email) 
TO 'C:\tmp\persons_partial_db.csv' DELIMITER ',' CSV HEADER;

/*SIN NO SE DESEA EXPORTAR EL ENCABEZADO SE USA*/

COPY persons(email) 
TO 'C:\tmp\persons_email_db.csv' DELIMITER ',' CSV;

/*
Exportar datos de la tabla al archivo CSV con el comando \ copy
En caso de que tenga acceso a un servidor de base de datos 
remoto de PostgreSQL*/

\copy (SELECT * FROM persons) to 'C:\tmp\persons_client.csv' with csv