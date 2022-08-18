SELECT 
  MIN(PV.plan_value) AS faturamento_minimo,
  MAX(PV.plan_value) AS faturamento_maximo,
  ROUND(AVG(PV.plan_value),2) AS faturamento_medio,
  SUM(PV.plan_value) AS faturamento_total 
FROM SpotifyClone.user U
INNER JOIN SpotifyClone.plan PV 
ON U.plan_id = PV.plan_id; 
