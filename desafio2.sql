SELECT
  COUNT(DISTINCT son.song_id) AS cancoes,
  COUNT(DISTINCT a.artist_id) AS artistas,
  COUNT(DISTINCT al.album_id) AS albuns
FROM SpotifyClone.song son
INNER JOIN SpotifyClone.artist a
ON son.artist_id = a.artist_id
INNER JOIN SpotifyClone.album al
ON son.album_id = al.album_id;
