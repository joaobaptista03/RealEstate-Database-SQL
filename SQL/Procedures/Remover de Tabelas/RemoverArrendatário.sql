USE LTR;

DELIMITER //

CREATE PROCEDURE RemoverArrendatario(
  IN p_ID INT
)
BEGIN
  DELETE FROM LTR.Arrendamento
  WHERE Arrendatário = p_ID;

  DELETE FROM LTR.Arrendatário
  WHERE ID = p_ID;
END //

DELIMITER ;

/*
CALL RemoverArrendatario(<ArrendatárioID>);
*/
