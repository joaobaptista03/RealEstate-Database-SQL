SET @Total1 = 0;
SET @Total2 = 0;

SELECT SUM(ValorMensal * (Duração / 30.4375)) INTO @Total1 FROM Arrendamento
JOIN Propriedade ON Propriedade.ID = Arrendamento.Propriedade
WHERE GetProprietário(Propriedade.ID) = 1
AND DATE_ADD(Arrendamento.DataAssinatura, INTERVAL Arrendamento.Duração DAY) < CURDATE();

SELECT SUM((ValorMensal/30.4375) * DATEDIFF(CURDATE(), Arrendamento.DataAssinatura)) INTO @Total2 FROM Arrendamento
JOIN Propriedade ON Propriedade.ID = Arrendamento.Propriedade
WHERE GetProprietário(Propriedade.ID) = 1
AND DATE_ADD(Arrendamento.DataAssinatura, INTERVAL Arrendamento.Duração DAY) >= CURDATE();

SELECT @Total1 + @Total2;
