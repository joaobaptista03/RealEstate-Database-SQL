USE LTR;

DELIMITER //

CREATE PROCEDURE AdicionarArrendamento(
  IN p_Propriedade INT,
  IN p_Arrendatario INT,
  IN p_DataAssinatura DATE,
  IN p_Duracao INT,
  IN p_ValorMensal DECIMAL(8, 2)
)
BEGIN
  DECLARE ultimoID INT;
  
  SELECT COALESCE(MAX(ID), 0) INTO ultimoID FROM LTR.Arrendamento;
  SET ultimoID = ultimoID + 1;
  
  INSERT INTO LTR.Arrendamento (ID, Propriedade, Arrendatário, DataAssinatura, Duração, ValorMensal)
  VALUES (ultimoID, p_Propriedade, p_Arrendatario, p_DataAssinatura, p_Duracao, p_ValorMensal);
END //

DELIMITER ;

/*
CALL AdicionarArrendamento(<PropriedadeID>, <ArrendatarioID>, <'DataAssinatura'>, <Duracao>, <ValorMensal>);
*/
