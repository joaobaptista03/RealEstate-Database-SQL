USE LTR;

DELIMITER //

CREATE PROCEDURE RemoverArrendamento(
  IN p_ID INT
)
BEGIN
  DELETE FROM LTR.Arrendamento
  WHERE ID = p_ID;
END //

DELIMITER ;

/*
CALL RemoverArrendamento(<ArrendamentoID>);
*/
