SELECT Propriedade.ID
FROM Propriedade
JOIN Arrendamento ON Propriedade.ID = Arrendamento.Propriedade
WHERE DATE_ADD(Arrendamento.DataAssinatura, INTERVAL Arrendamento.Duração DAY) >= CURDATE();
