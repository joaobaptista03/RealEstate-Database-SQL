DELIMITER //

CREATE FUNCTION GetProprietário (PropriedadeID INT) RETURNS INT DETERMINISTIC
BEGIN
SELECT NovoProprietário INTO @return FROM Compra
	WHERE Propriedade = PropriedadeID
	ORDER BY DataAquisição DESC
	LIMIT 1;
    
RETURN @return;
END; //

DELIMITER ;

/*
SELECT GetProprietário(<PropriedadeID>) AS Proprietário;
*/
