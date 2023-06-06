USE LTR;

DELIMITER //

CREATE PROCEDURE RemoverPropriedade(
  IN p_ID INT
)
BEGIN
  DELETE FROM LTR.Compra
  WHERE Propriedade = p_ID;

  DELETE FROM LTR.Arrendamento
  WHERE Propriedade = p_ID;

  DELETE FROM LTR.GerePropriedade
  WHERE Propriedade = p_ID;

  DELETE FROM LTR.Propriedade
  WHERE ID = p_ID;
END //

DELIMITER ;

/*
CALL RemoverPropriedade(<PropriedadeID>);
*/
