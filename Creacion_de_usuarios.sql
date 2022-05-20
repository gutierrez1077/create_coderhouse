USE centro_odontologico;

SELECT * FROM sys.sys_config;

SELECT * FROM version;

USE mysql;
SHOW TABLES;

SELECT * FROM user;

-- CREACION DE UN USUARIO PARA LA BD DEL CENTRO ODONTOLOGICO
CREATE USER 'user_solo_lectura'@'localhost' IDENTIFIED BY '1234';

select host, user, authentication_string
from user;

SHOW GRANTS FOR 'user_solo_lectura'@'localhost';

-- Asignacion de permisos de lectura para el usuario
GRANT SELECT 
ON centro_odontologico.*
TO 'user_solo_lectura'@'localhost';

-- CREACION DE USUARIO 2 PARA LA BD DEL CENTRO ODONTOLOGICO
CREATE USER 'user_admin'@'localhost' identified BY '13579';

-- Asignacion de permisos de lectura, escritura e insercion de datos para el usuario_admin

GRANT SELECT, UPDATE, insert
ON centro_odontologico.*
TO 'user_admin'@'localhost';