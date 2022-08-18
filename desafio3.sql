SELECT
  u.username AS usuario,
  COUNT(SON.song_id) AS qt_de_musicas_ouvidas,
  ROUND(SUM(d.duration) / 60, 2) AS total_minutos 
FROM SpotifyClone.user u
INNER JOIN SpotifyClone.reproduction_history SON
ON SON.user_id = u.user_id
INNER JOIN SpotifyClone.song d
ON SON.song_id = d.song_id
GROUP BY u.username
ORDER BY u.username; 
