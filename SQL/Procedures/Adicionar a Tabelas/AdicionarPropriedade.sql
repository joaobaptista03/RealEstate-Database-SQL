USE LTR;

DELIMITER //

CREATE PROCEDURE AdicionarPropriedade(
  IN p_Local INT,
  IN p_Valor DECIMAL(9, 2),
  IN p_Area INT,
  IN p_Utilizacao VARCHAR(45)
)
BEGIN
  DECLARE ultimoID INT;
  
  SELECT COALESCE(MAX(ID), 0) INTO ultimoID FROM LTR.Propriedade;
  SET ultimoID = ultimoID + 1;
  
  INSERT INTO LTR.Propriedade (ID, Local, Valor, Área, Utilização)
  VALUES (ultimoID, p_Local, p_Valor, p_Area, p_Utilizacao);
END //

DELIMITER ;

/*
CALL AdicionarPropriedade(<LocalID>, <Valor>, <Area>, <'Utilizacao'>);
*/
