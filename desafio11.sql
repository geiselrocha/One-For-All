SELECT 
  song AS nome_musica,
    CASE
	  WHEN song LIKE '%Bard%' THEN REPLACE(song, 'Bard','QA')
      WHEN song LIKE '%Amar%' THEN REPLACE(song, 'Amar','Code Review')
      WHEN song LIKE '%Pais%' THEN REPLACE(song, 'Pais','Pull Requests')
      WHEN song LIKE '%SOUL%' THEN REPLACE(song, 'SOUL','CODE')
      WHEN song LIKE '%SUPERSTAR%' THEN REPLACE(song, 'SUPERSTAR','SUPERDEV')
    ELSE NULL
END AS novo_nome
FROM SpotifyClone.song
HAVING novo_nome IS NOT NULL
ORDER BY song DESC; 
