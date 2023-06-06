USE LTR;

DELIMITER //

CREATE PROCEDURE RemoverGerePropriedade(
  IN funcionarioID INT,
  IN propriedadeID INT
)
BEGIN
  DELETE FROM LTR.GerePropriedade
  WHERE Propriedade = propriedadeID AND Funcionário = funcionarioID;
END //

DELIMITER ;

/*
CALL RemoverGerePropriedade(<FuncionárioID>, <PropriedadeID>);
*/
