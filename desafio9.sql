SELECT
  COUNT(U.user_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.reproduction_history RH
INNER JOIN SpotifyClone.user U
ON RH.user_id = U.user_id
WHERE username = 'Barbara Liskov';
