USE centro_odontologico;

SELECT * FROM facturas
WHERE id_facturas=20;

START TRANSACTION;
UPDATE facturas
SET Legajo_PF=6 WHERE id_facturas=20;
COMMIT;

-- Sentencia ROLLBACK. Accidentalmente se eliminan todas las facturas de la sucursal 1. Gracias al rollback podemos deshacer dicho error.

START TRANSACTION;
DELETE FROM facturas
WHERE sucursal=1;
ROLLBACK;
SELECT * FROM facturas;
COMMIT;

-- Sentencia COMMIT. Guarda de forma permanente la informacion luego de deshacer el posible error.

SELECT * FROM profesionales;
SELECT * FROM especialidades;

START TRANSACTION;
SAVEPOINT insercion_profesionales;
insert into profesionales (Legajo, Nombre_PF, Apellido_PF, Fecha_Nac, Domicilio_PF, Tel_Contacto, Email_PF, Localidad_PF, Especialidad) values (16, 'Izak', 'Clinning', '1963-07-25', '2556 Hazelcrest Court', '(516) 3929215', 'iclinning0@disqus.com', 2, 3);
insert into profesionales (Legajo, Nombre_PF, Apellido_PF, Fecha_Nac, Domicilio_PF, Tel_Contacto, Email_PF, Localidad_PF, Especialidad) values (17, 'Carlye', 'Meadmore', '1997-07-02', '85 Monument Terrace', '(518) 1915279', 'cmeadmore1@usgs.gov', 2, 11);
insert into profesionales (Legajo, Nombre_PF, Apellido_PF, Fecha_Nac, Domicilio_PF, Tel_Contacto, Email_PF, Localidad_PF, Especialidad) values (18, 'Kettie', 'Howson', '1978-03-25', '94820 Grim Court', '(284) 8381810', 'khowson2@1und1.de', 1, 11);
insert into profesionales (Legajo, Nombre_PF, Apellido_PF, Fecha_Nac, Domicilio_PF, Tel_Contacto, Email_PF, Localidad_PF, Especialidad) values (19, 'Avigdor', 'Tindall', '1955-05-05', '0 Fremont Parkway', '(347) 6795559', 'atindall3@w3.org', 3, 1);
SAVEPOINT primer_camada;
insert into profesionales (Legajo, Nombre_PF, Apellido_PF, Fecha_Nac, Domicilio_PF, Tel_Contacto, Email_PF, Localidad_PF, Especialidad) values (20, 'Alberik', 'Hodgin', '1955-05-24', '405 Arizona Street', '(619) 2097537', 'ahodgin4@php.net', 1, 5);
insert into profesionales (Legajo, Nombre_PF, Apellido_PF, Fecha_Nac, Domicilio_PF, Tel_Contacto, Email_PF, Localidad_PF, Especialidad) values (21, 'Aubine', 'Ingley', '1950-06-17', '57004 Dixon Road', '(876) 7362327', 'aingley5@webeden.co.uk', 3, 4);
insert into profesionales (Legajo, Nombre_PF, Apellido_PF, Fecha_Nac, Domicilio_PF, Tel_Contacto, Email_PF, Localidad_PF, Especialidad) values (22, 'Renault', 'Disbrey', '1980-05-12', '1 Sunbrook Terrace', '(420) 5837901', 'rdisbrey6@wsj.com', 3, 11);
insert into profesionales (Legajo, Nombre_PF, Apellido_PF, Fecha_Nac, Domicilio_PF, Tel_Contacto, Email_PF, Localidad_PF, Especialidad) values (23, 'Yolane', 'Sallter', '1999-06-08', '383 Melody Court', '(314) 2322521', 'ysallter7@xing.com', 1, 5);
SAVEPOINT segunda_camada;
ROLLBACK TO primer_camada;
COMMIT;

-- Eliminamos el savepoint de la segunda camada
RELEASE SAVEPOINT segunda_camada;

