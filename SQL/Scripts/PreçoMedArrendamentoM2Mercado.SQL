SELECT AVG(Local.ValorMedArrendar / Propriedade.Área) AS PrecoMedioArrendamentoPorM2
FROM LTR.Local
JOIN LTR.Propriedade ON LTR.Local.ID = LTR.Propriedade.Local;
