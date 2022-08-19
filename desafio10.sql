SELECT
  SON.song AS nome,
  COUNT(RH.song_id) AS reproducoes
FROM SpotifyClone.song SON
INNER JOIN SpotifyClone.reproduction_history RH
ON SON.song_id = RH.song_id
INNER JOIN SpotifyClone.user U
ON RH.user_id = U.user_id
INNER JOIN SpotifyClone.plan PL
ON PL.plan_id = U.plan_id
WHERE PL.plan_name = 'gratuito' OR PL.plan_name = 'pessoal'
GROUP BY song
ORDER BY song ASC;

