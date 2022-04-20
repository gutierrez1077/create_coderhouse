USE centro_odontologico;

SELECT * FROM pacientes;
-- creacion vista pacientes de la capital
CREATE OR REPLACE VIEW pacientes_capital
AS
SELECT id_paciente,Nombre_Px,Apellido_Px,Domicilio_Px,ObraSocial FROM pacientes
WHERE Localidad = 1;

-- creacion vista pacientes del interior de la provincia
CREATE VIEW pacientes_fuera_de_capital
AS SELECT id_paciente,Nombre_Px,Apellido_Px,Domicilio_Px,ObraSocial
FROM pacientes
WHERE Localidad <> 1;

-- Creacion vista profesionales especializados en Odontopediatria
CREATE VIEW medicos_ninos 
AS
SELECT Legajo,Nombre_PF,Apellido_PF FROM profesionales
WHERE Especialidad = 2 ;

-- Creacion de vista obra social de mayor uso
CREATE VIEW ooss_mas_usada
AS
SELECT ObraSocial, COUNT(ObraSocial) FROM pacientes
WHERE ObraSocial BETWEEN 1 and 10
;

-- creacion de vista pacientes nacidos luego del año 2000

CREATE OR REPLACE VIEW pacientes_nacidos_despues_2000
as
SELECT * FROM pacientes
WHERE Fecha_Nac_Px > '2000-01-01';

SELECT * FROM pacientes_nacidos_despues_2000;