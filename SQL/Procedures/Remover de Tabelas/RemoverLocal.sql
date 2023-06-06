USE LTR;

DELIMITER //

CREATE PROCEDURE RemoverLocal(
  IN p_ID INT
)
BEGIN
  DELETE FROM LTR.Propriedade
  WHERE Propriedade.Local = p_ID;

  DELETE FROM LTR.Local
  WHERE ID = p_ID;
END //

DELIMITER ;

/*
CALL RemoverLocal(<LocalID>);
*/
