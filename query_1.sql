SELECT playlist.playlist_title, COUNT(playlistsong.song_ID) AS song_count
FROM music_streaming_sevice.playlist
INNER JOIN music_streaming_sevice.playlistSong ON playlist.playlist_ID = playlistSong.playlist_ID
WHERE playlist.user_ID = 'sophie.muller@web.de'
GROUP BY playlist.playlist_ID;


