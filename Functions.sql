SELECT SUM(costo) FROM insumos
WHERE Cod_servicio = 5;

SELECT Cod_servicio, Costo FROM insumos
where cod_servicio = 26
;

SELECT * FROM insumos
;


USE centro_odontologico;
SELECT costo_total_por_servicio(10) as costo;DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `costo_total_por_servicio`(Cod_Servicio INT) RETURNS decimal(8,2)
    READS SQL DATA
BEGIN
DECLARE Suma_de_insumos DECIMAL (8,2);

SET Suma_de_insumos = (SELECT Sum(Costo) FROM insumos i
					WHERE i.Cod_Servicio = Cod_Servicio);
RETURN Suma_de_insumos;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `profesionales_por_especialidad`(Id_especialidad INT) RETURNS int
    READS SQL DATA
BEGIN
DECLARE especialidad_function INT;
SET especialidad_function = (SELECT COUNT(legajo) FROM profesionales p
					WHERE p.especialidad = especialidad_function);
RETURN especialidad_function;
END$$
DELIMITER ;

