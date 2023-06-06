USE LTR;

DELIMITER //

CREATE PROCEDURE AdicionarCompra(
  IN p_Propriedade INT,
  IN p_AntigoProprietario INT,
  IN p_NovoProprietario INT,
  IN p_ValorAquisicao DOUBLE,
  IN p_DataAquisicao DATETIME
)
BEGIN
  DECLARE ultimoID INT;
  
  SELECT COALESCE(MAX(ID), 0) INTO ultimoID FROM LTR.Compra;
  SET ultimoID = ultimoID + 1;
  
  INSERT INTO LTR.Compra (ID, Propriedade, AntigoProprietário, NovoProprietário, ValorAquisição, DataAquisição)
  VALUES (ultimoID, p_Propriedade, p_AntigoProprietario, p_NovoProprietario, p_ValorAquisicao, p_DataAquisicao);
END //

DELIMITER ;

/*
CALL AdicionarCompra(1, 3, 5, 200000.00, '2023-06-05 10:00:00');
*/
