SELECT
  SON.song AS cancao,
  COUNT(RH.song_id) AS reproducoes
FROM SpotifyClone.song SON
INNER JOIN SpotifyClone.reproduction_history RH
ON SON.song_id = RH.song_id
GROUP BY SON.song
ORDER BY reproducoes DESC, SON.song ASC
LIMIT 2; 
