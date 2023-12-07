SELECT artist.artist_name, artist.birth_date, artist.birth_place 
FROM music_streaming_sevice.artist
WHERE artist.genre_ID = (SELECT genre.genre_ID FROM music_streaming_sevice.genre WHERE genre.genre_name = 'Pop');

