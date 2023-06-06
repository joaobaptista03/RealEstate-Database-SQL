SET @ValorTotalM = 0;
SET @ValorTotalF = 0;

SELECT SUM(Valor) INTO @ValorTotalM FROM Propriedade
WHERE (SELECT Género FROM Proprietário WHERE Proprietário.ID = GetProprietário(Propriedade.ID) AND Proprietário.ID != 1) = 'M';

SELECT SUM(Valor) INTO @ValorTotalF FROM Propriedade
WHERE (SELECT Género FROM Proprietário WHERE Proprietário.ID = GetProprietário(Propriedade.ID)) = 'F';

SELECT ROUND(@ValorTotalM / (@ValorTotalM + @ValorTotalF) * 100, 2) AS PercentagemMasculino, ROUND(@ValorTotalF / (@ValorTotalM + @ValorTotalF) * 100, 2) AS PercentagemFeminino;
