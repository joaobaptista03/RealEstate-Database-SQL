USE LTR;

DELIMITER //

CREATE PROCEDURE AdicionarFuncionario(
  IN p_Nome VARCHAR(45),
  IN p_DataNascimento DATE,
  IN p_Genero CHAR(1),
  IN p_AreaResidencia VARCHAR(45),
  IN p_Funcao VARCHAR(45),
  IN p_Email VARCHAR(45),
  IN p_Password VARCHAR(45),
  IN p_Supervisor INT
)
BEGIN
  DECLARE ultimoID INT;
  
  SELECT COALESCE(MAX(ID), 0) INTO ultimoID FROM LTR.Funcionário;
  SET ultimoID = ultimoID + 1;
  
  INSERT INTO LTR.Funcionário (ID, Nome, DataNascimento, Género, ÁreaResidência, Função, Email, Password, Supervisor)
  VALUES (ultimoID, p_Nome, p_DataNascimento, p_Genero, p_AreaResidencia, p_Funcao, p_Email, p_Password, p_Supervisor);
END //

DELIMITER ;

/*
CALL AdicionarFuncionario('<NomeFuncionário>', 'DataNascimento', 'Género', 'ÁreaResidência', '<Função>', '<Email>', '<Senha>', 1);
*/
