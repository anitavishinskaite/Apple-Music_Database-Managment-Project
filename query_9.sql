SELECT album.album_title, album.release_date
FROM music_streaming_sevice.album
ORDER BY album.release_date DESC
LIMIT 5;