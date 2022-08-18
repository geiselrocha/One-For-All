SELECT
  ART.artist AS artista,
  ALB.album AS album,
  COUNT(SEG.user_id) AS seguidores
FROM SpotifyClone.artist ART
INNER JOIN SpotifyClone.album ALB
ON ALB.artist_id = ART.artist_id
INNER JOIN SpotifyClone.following_artists SEG
ON SEG.artist_id = ALB.artist_id
GROUP BY ART.artist, ALB.album_id
ORDER BY seguidores DESC, ART.artist ASC, ALB.album ASC;
