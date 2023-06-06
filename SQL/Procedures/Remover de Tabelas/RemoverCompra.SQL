USE LTR;

DELIMITER //

CREATE PROCEDURE RemoverCompra(
  IN compraID INT
)
BEGIN
  DELETE FROM LTR.Compra
  WHERE ID = compraID;
END //

DELIMITER ;

/*
CALL RemoverCompra(<CompraID>);
*/
