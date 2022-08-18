SELECT 
  u.username AS usuario,
IF (YEAR(MAX(dat.music_reproduction)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.user u
INNER JOIN SpotifyClone.reproduction_history dat
ON u.user_id = dat.user_id
GROUP BY u.username
ORDER BY u.username;
