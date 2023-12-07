SELECT album.album_ID, album.album_title,
  SEC_TO_TIME(SUM(TIME_TO_SEC(song.duration))) AS album_duration
FROM music_streaming_sevice.album
INNER JOIN music_streaming_sevice.song ON album.album_ID = song.album_ID
GROUP BY album.album_ID, album.album_title
ORDER BY album_duration DESC;
