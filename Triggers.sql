USE centro_odontologico;
-- Creacion de tabla log, guarda los datos de contacto email del nuevo paciente ingresado
CREATE TABLE Tabla_Log_Pacientes_por_profesional (
ID_paciente		INT NOT NULL PRIMARY KEY,
Fecha_de_ig 	DATE,
Email_px		VARCHAR(50)
);

DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_pacientes_insert` 
AFTER INSERT ON `pacientes` 
FOR EACH ROW 
BEGIN
	INSERT INTO tabla_log_pacientes_por_profesional (Id_paciente, fecha_de_ig, email_px)
    VALUES(NEW.Id_paciente, NEW.fecha_de_ig, NEW.email_px);
END //

-- Creacion de tabla log, guarda el legajo y el email del profesional que es eliminado de la bd, a fin de tener un contacto posterior por cualquier eventualidad
CREATE TABLE Tabla_log_profesionales (
Legajo				INT NOT NULL PRIMARY KEY,
Tel_contacto 		VARCHAR(50),
email_pf			VARCHAR(50)
);

-- TRIGGER BEFORE eliminacion de legajo, pasa los datos de contacto del profesional a la tabla log
DELIMITER//
CREATE DEFINER=`root`@`localhost` TRIGGER `profesionales_BEFORE_DELETE` 
BEFORE DELETE ON `profesionales` 
FOR EACH ROW 
BEGIN
INSERT INTO tabla_log_profesionales(legajo, tel_contacto, email_pf)
VALUES(legajo, tel_contacto, email_pf);
END //