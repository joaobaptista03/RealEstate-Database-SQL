USE LTR;

DELIMITER //

CREATE PROCEDURE AdicionarLocal(
  IN p_Nome VARCHAR(45),
  IN p_ValorMedM2 DECIMAL(7,2),
  IN p_ValorMedArrendar DECIMAL(7,2)
)
BEGIN
  DECLARE ultimoID INT;
  
  SELECT COALESCE(MAX(ID), 0) INTO ultimoID FROM LTR.Local;
  SET ultimoID = ultimoID + 1;
  
  INSERT INTO LTR.Local (ID, Nome, ValorMedM2, ValorMedArrendar)
  VALUES (ultimoID, p_Nome, p_ValorMedM2, p_ValorMedArrendar);
END //

DELIMITER ;

/*
CALL AdicionarLocal('<NomeLocal', <ValorMedM2>, <ValorMedArrendar>);
*/
