USE LTR;

DELIMITER //

CREATE PROCEDURE AdicionarGestaoPropriedade(
  IN p_Funcionario INT,
  IN p_Propriedade INT
)
BEGIN
  INSERT INTO GerePropriedade (Funcionario, Propriedade)
  VALUES (p_Funcionario, p_Propriedade);
END //

DELIMITER ;

/*
CALL AdicionarGestaoPropriedade(<FuncionarioID>, <PropriedadeID>);
*/
