USE LTR;

DELIMITER //

CREATE PROCEDURE RemoverProprietario(
  IN p_ID INT
)
BEGIN
  DELETE FROM LTR.Compra
  WHERE AntigoProprietário = p_ID OR NovoProprietário = p_ID;

  DELETE FROM LTR.Proprietário
  WHERE ID = p_ID;
END //

DELIMITER ;

/*
CALL RemoverProprietario(<ProprietárioID>);
*/
