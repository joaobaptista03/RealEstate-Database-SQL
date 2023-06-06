USE LTR;

DELIMITER //

CREATE PROCEDURE AdicionarArrendatario(
  IN p_Nome VARCHAR(45),
  IN p_DataNascimento DATE,
  IN p_Genero CHAR(1),
  IN p_AreaResidencia VARCHAR(45),
  IN p_Profissao TEXT
)
BEGIN
  DECLARE ultimoID INT;
  
  SELECT COALESCE(MAX(ID), 0) INTO ultimoID FROM LTR.Arrendatário;
  SET ultimoID = ultimoID + 1;
  
  INSERT INTO LTR.Arrendatário (ID, Nome, DataNascimento, Género, ÁreaResidência, Profissão)
  VALUES (ultimoID, p_Nome, p_DataNascimento, p_Genero, p_AreaResidencia, p_Profissao);
END //

DELIMITER ;

/*
CALL AdicionarArrendatario('<NomeArrendatário>', '<DataNascimento>', '<Género>', '<ÁreaResidência>', '<Profissão>');
*/
