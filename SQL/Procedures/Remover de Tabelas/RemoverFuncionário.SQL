USE LTR;

DELIMITER //

CREATE PROCEDURE RemoverFuncionario(
  IN p_ID INT
)
BEGIN
  -- Remover os funcionários que têm o funcionário a ser removido como supervisor
  DELETE FROM LTR.Funcionário
  WHERE Supervisor = p_ID;

  -- Remover as referências nas tabelas dependentes
  DELETE FROM LTR.GerePropriedade
  WHERE Funcionário = p_ID;

  -- Remover o funcionário
  DELETE FROM LTR.Funcionário
  WHERE ID = p_ID;
END //

DELIMITER ;

/*
CALL RemoverFuncionario(<FuncionarioID>);
*/
