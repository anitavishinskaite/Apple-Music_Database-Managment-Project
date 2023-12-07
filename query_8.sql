SELECT artist.artist_ID, artist.artist_name, COUNT(album.album_ID) AS album_count
FROM music_streaming_sevice.artist
INNER JOIN music_streaming_sevice.album ON artist.artist_ID = album.artist_ID
GROUP BY artist.artist_ID, artist.artist_name
ORDER BY album_count DESC;

