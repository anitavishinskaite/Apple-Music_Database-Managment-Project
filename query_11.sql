SELECT genre.genre_name, COUNT(*) AS song_count
FROM music_streaming_sevice.genre
INNER JOIN music_streaming_sevice.song ON genre.genre_ID = song.genre_ID
GROUP BY genre.genre_name
ORDER BY song_count DESC;