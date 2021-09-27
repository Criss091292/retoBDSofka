/*actualizar producto*/
DELIMITER $$

USE `CristianAyala_Supermercado_10092021`$$

DROP PROCEDURE IF EXISTS `actualizar_producto`$$

CREATE DEFINER=`sofka_training`@`%` PROCEDURE `actualizar_producto`(
IN codigoBarras VARCHAR(255),
IN nombre VARCHAR(255),
IN precioBase INT,
OUT respuesta BOOLEAN
)
BEGIN
DECLARE totalRegistros INT;
SET totalRegistros = 0;

UPDATE producto AS prod
SET prod.nombre = nombre, prod.precioBase = precioBase
WHERE prod.codigoBarras = codigoBarras;

SET totalRegistros = (SELECT COUNT(prod.codigoBarras) FROM producto AS prod
WHERE prod.codigoBarras = codigoBarras);

IF (totalRegistros) <> 1 THEN
SET respuesta = FALSE;
ELSE
SET respuesta = TRUE;
END IF;

SELECT respuesta;
END$$

DELIMITER ;




/*sp_borrar_producto*/

DELIMITER $$

USE `CristianAyala_Supermercado_10092021`$$

DROP PROCEDURE IF EXISTS `sp_borrar_producto`$$

CREATE DEFINER=`sofka_training`@`%` PROCEDURE `sp_borrar_producto`(
	IN codigoBarras VARCHAR(255)
)
BEGIN
	DELETE FROM producto prod WHERE prod.codigoBarras = codigoBarras;
END$$

DELIMITER ;



/*sp_insertar_producto*/
DELIMITER $$

USE `CristianAyala_Supermercado_10092021`$$

DROP PROCEDURE IF EXISTS `sp_insertar_producto`$$

CREATE DEFINER=`sofka_training`@`%` PROCEDURE `sp_insertar_producto`(
IN codigoBarras VARCHAR(255),
IN nombre VARCHAR(255),
IN precioBase INT,
OUT respuesta BOOLEAN
)
BEGIN
DECLARE totalRegistros INT;
SET totalRegistros = 0;
INSERT INTO producto VALUES(codigoBarras,nombre,precioBase);
SET totalRegistros = (SELECT COUNT(prod.codigoBarras) FROM producto AS prod
WHERE prod.codigoBarras = codigoBarras);
IF (totalRegistros) <> 1 THEN
SET respuesta = FALSE;
ELSE
SET respuesta = TRUE;
END IF;
SELECT respuesta;
END$$

DELIMITER ;


/*sp_select_producto*/
DELIMITER $$

USE `CristianAyala_Supermercado_10092021`$$

DROP PROCEDURE IF EXISTS `sp_select_producto`$$

CREATE DEFINER=`sofka_training`@`%` PROCEDURE `sp_select_producto`(
	IN codigoBarras VARCHAR(255)
)
BEGIN
	SELECT * FROM producto prod WHERE prod.codigoBarras = codigoBarras;
END$$

DELIMITER ;

/*sp_departamento_join_cidad*/

DELIMITER $$

USE `CristianAyala_Supermercado_10092021`$$

DROP PROCEDURE IF EXISTS `sp_departamento_join_ciudad`$$

CREATE DEFINER=`sofka_training`@`%` PROCEDURE `sp_departamento_join_ciudad`()
BEGIN
	SELECT
	c.idCiudad AS 'id',
	c.nombre AS 'ciudad',
	dep.nombre AS 'departamento'
	FROM
		Departamento dep
	INNER JOIN
		Ciudad c ON dep.idDomicilio = c.idDepartamento;
END$$

DELIMITER ;




/* vista documentosPersona */

CREATE OR REPLACE VIEW  documentosPersona AS SELECT  Documento.`abreviatura`, Documento.`numeroDocumento`, Persona.`nombres`,Persona.`apellidos`
   FROM Persona INNER JOIN Documento ON
   Documento.`idPersona` = Persona.`idPersona`
