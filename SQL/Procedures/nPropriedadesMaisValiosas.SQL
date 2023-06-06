USE LTR;

DELIMITER //
CREATE PROCEDURE `nPropriedadesMaisValiosas`(n INT)
BEGIN
	SELECT Propriedade.ID AS Propriedade, Propriedade.Valor AS Valor FROM Propriedade
	ORDER BY Propriedade.Valor DESC
	LIMIT n;
END //
DELIMITER ;

/*
CALL nPropriedadesMaisValiosas(<n>);
*/
