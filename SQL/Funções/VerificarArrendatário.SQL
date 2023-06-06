USE LTR;

DELIMITER //

CREATE FUNCTION VerificarArrendamento(propriedade_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE arrendatario_id INT;

    SELECT Arrendatário INTO arrendatario_id
    FROM Arrendamento
    WHERE Propriedade = propriedade_id
    AND DATE_ADD(DataAssinatura, INTERVAL Duração DAY) >= CURDATE()
    LIMIT 1;

    RETURN arrendatario_id;
END; //
DELIMITER ;

/*
SELECT VerificarArrendamento(<PropriedadeID>) AS ArrendatárioPropriedade;
*/
