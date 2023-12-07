SELECT song.song_title, album.album_title
FROM music_streaming_sevice.song
INNER JOIN music_streaming_sevice.artist ON song.artist_ID = artist.artist_ID
INNER JOIN music_streaming_sevice.album ON song.album_ID = album.album_ID
WHERE artist.artist_name = 'Beyoncé';
