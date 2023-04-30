SELECT genres.title AS genre, COUNT(DISTINCT artists.id) AS num_performers
FROM genres
JOIN genres_artists ON genres.id = genres_artists.genre_id
JOIN artists ON genres_artists.artist_id = artists.id
GROUP BY genre;

SELECT COUNT(*) AS num_tracks
FROM tracks
JOIN albums ON tracks.album_id = albums.id
WHERE albums.release_year BETWEEN 2019 AND 2020;

SELECT albums.title AS album, AVG(tracks.duration) AS avg_duration
FROM albums
JOIN tracks ON albums.id = tracks.album_id
GROUP BY album;

SELECT artists.title AS artist
FROM artists
LEFT JOIN albums_artists ON artists.id = albums_artists.artist_id
LEFT JOIN albums ON albums_artists.album_id = albums.id
WHERE albums.release_year != 2020 OR albums.id IS NULL;

SELECT collections.title AS collection
FROM collections
JOIN collections_tracks ON collections.id = collections_tracks.collection_id
JOIN tracks ON collections_tracks.track_id = tracks.id
JOIN albums ON tracks.album_id = albums.id
JOIN albums_artists ON albums.id = albums_artists.album_id
JOIN artists ON albums_artists.artist_id = artists.id
WHERE artists.title = 'The Beatles';

SELECT DISTINCT albums.title AS album
FROM albums
JOIN albums_artists ON albums.id = albums_artists.album_id
JOIN artists ON albums_artists.artist_id = artists.id
JOIN genres_artists ON artists.id = genres_artists.artist_id
JOIN genres ON genres_artists.genre_id = genres.id
GROUP BY album
HAVING COUNT(DISTINCT genres.id) > 1;

SELECT tracks.title AS track
FROM tracks
LEFT JOIN collections_tracks ON tracks.id = collections_tracks.track_id
WHERE collections_tracks.track_id IS NULL;

SELECT artists.title AS artist, tracks.title AS track, tracks.duration
FROM artists
JOIN albums_artists ON artists.id = albums_artists.artist_id
JOIN albums ON albums_artists.album_id = albums.id
JOIN tracks ON albums.id = tracks.album_id
WHERE tracks.duration = (SELECT MIN(duration) FROM tracks);

SELECT albums.title AS album, COUNT(tracks.id) AS num_tracks
FROM albums
LEFT JOIN tracks ON albums.id = tracks.album_id
GROUP BY album
HAVING COUNT(tracks.id) = (SELECT MIN(num_tracks) FROM (SELECT COUNT(id) AS num_tracks FROM tracks GROUP BY album_id) AS t);
