USE BACKUP_5;
-- Creacion de tabla log, guarda los datos de contacto email del nuevo paciente ingresado
CREATE TABLE Tabla_Log_Pacientes_por_profesional (
ID_paciente		INT NOT NULL PRIMARY KEY,
Fecha_de_ig 	DATE,
Email_px		VARCHAR(50)
);

-- TRIGGER AFTER. Se activa al insertar nuevos registros en la tabla 'pacientes', guardando en una tabla log los datos de contacto del mismo.
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_pacientes_insert` 
AFTER INSERT ON `pacientes` 
FOR EACH ROW 
BEGIN
	INSERT INTO tabla_log_pacientes_por_profesional (Id_paciente, fecha_de_ig, email_px)
    VALUES(NEW.Id_paciente, NEW.fecha_de_ig, NEW.email_px);
END //

-- Insertamos un nuevo paciente en la tabla pacientes para probar el correcto funcionamiento del trigger.
INSERT INTO pacientes 
(id_paciente, Nombre_px, Apellido_px, sexo_px, fecha_nac_px, Domicilio_px, Tel_contacto, email_px, fecha_de_ig, fecha_de_eg, pagos_px, Localidad, obrasocial) 
values (102, 'michael', 'jordan', 'M', '1980-10-31', '03810 siempreviva', '(356) 4210134', 'michael.jordan@tpsc.com', '2021-11-27', '2019-02-15', 15994.27, 1, 3); 

select * from tabla_log_pacientes_por_profesional;

-- Creacion de tabla log, guarda el legajo y el email del profesional que es eliminado de la bd, a fin de tener un contacto posterior por cualquier eventualidad
CREATE TABLE Tabla_log_profesionales (
Legajo				INT NOT NULL PRIMARY KEY,
Tel_contacto 		VARCHAR(50),
email_pf			VARCHAR(50)
);

-- TRIGGER BEFORE eliminacion de legajo, pasa los datos de contacto del profesional a la tabla log. Se activa al eliminar un registro de la tabla 'profesionales'.
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `profesionales_BEFORE_DELETE` 
BEFORE DELETE ON `profesionales` 
FOR EACH ROW 
BEGIN
INSERT INTO tabla_log_profesionales(legajo, tel_contacto, email_pf)
VALUES(legajo, tel_contacto, email_pf);
END //

-- creacion trigger before delete obra social, guardara en una tabla de control los id y las obras sociales eliminadas de la bd.
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `ooss_BEFORE_DELETE` BEFORE DELETE ON `ooss` FOR EACH ROW BEGIN
INSERT INTO tabla_log_ooss(Id_obra_social_eliminada,OS_Eliminada, usuario, fecha )
VALUES(old.id_ooss, old.Obra_Social, user(), now());
END //

DROP TRIGGER `ooss_BEFORE_DELETE`;

DELETE FROM ooss
WHERE id_ooss=3;

-- el trigger `ooss_BEFORE_DELETE` afecta a la tabla tabla_log_ooss 
SELECT * FROM tabla_log_ooss;


