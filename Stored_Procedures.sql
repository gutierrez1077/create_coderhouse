USE centro_odontologico;

CALL sp_nombres_odontologos ();


DELIMITER //
CREATE PROCEDURE sp_pacientes_masculinos()
BEGIN
-- Listar informacion de los pacientes del sexo masculino
SELECT * FROM pacientes
WHERE Sexo_px = 'M';
END //

CALL sp_pacientes_masculinos();

DELIMITER //
CREATE PROCEDURE sp_listar_pacientes_segun_sexo (IN Letra_sexo_px CHAR(1))
BEGIN
-- Listar informacion de los pacientes segun el sexo ingresado como parametro, ordenados por fecha de nacimiento y OOSS.
SELECT * FROM pacientes
WHERE Sexo_px = Letra_sexo_px
ORDER BY fecha_nac_px, ObraSocial ASC;
END //

CALL sp_listar_pacientes_segun_sexo (M);