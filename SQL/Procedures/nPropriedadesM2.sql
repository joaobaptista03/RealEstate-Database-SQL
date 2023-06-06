DELIMITER //

CREATE PROCEDURE `nPropriedadesM2`(n INT)
BEGIN
	SELECT (Valor / Área) AS ValorM2, Propriedade.ID AS Propriedade FROM Propriedade
	ORDER BY ValorM2 DESC
	LIMIT n;
END //

DELIMITER ;

/*
CALL nPropriedadesM2(<n>);
*/
