SELECT
  ART.artist AS artista,
  ALB.album AS album
FROM SpotifyClone.album ALB
INNER JOIN SpotifyClone.artist ART
ON ALB.artist_id = ART.artist_id
WHERE ART.artist = 'Elis Regina'
ORDER BY ALB.album;
