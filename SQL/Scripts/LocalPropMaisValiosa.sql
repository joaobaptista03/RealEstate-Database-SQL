SELECT Nome AS Local FROM LTR.Local
WHERE ID = (
  SELECT Local
  FROM Propriedade
  WHERE Valor = (
    SELECT MAX(Valor)
    FROM Propriedade
  )
);
