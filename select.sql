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

SELECT title
FROM artists /* Из таблицы исполнителей */
WHERE title NOT IN ( /* Где имя исполнителя не входит в вложенную выборку */
    SELECT artists.title /* Получаем имена исполнителей */
    FROM artists /* Из таблицы исполнителей */
    JOIN  albums_artists ON artists.id = albums_artists.artist_id  /* Объединяем с промежуточной таблицей */
    JOIN  albums ON  albums_artists.album_id = albums.id/* Объединяем с таблицей альбомов */
    WHERE release_year = 2020 /* Где год альбома равен 2020 */);

SELECT collections.title AS collection
FROM collections
JOIN collections_tracks ON collections.id = collections_tracks.collection_id
JOIN tracks ON collections_tracks.track_id = tracks.id
JOIN albums ON tracks.album_id = albums.id
JOIN albums_artists ON albums.id = albums_artists.album_id
JOIN artists ON albums_artists.artist_id = artists.id
WHERE artists.title = 'The Beatles';

SELECT DISTINCT albums.title /* Получаем ТОЛЬКО уникальные имена альбомов. Другие данные в выводе не нужны */
FROM albums /* Из таблицы альбомов */
JOIN albums_artists ON albums.id = albums_artists.album_id  /* Объединяем альбомы с промежуточной таблицей между исполнителями */
JOIN artists ON albums_artists.artist_id = artists.id /* Объединяем промежуточную таблицу с исполнителями */
JOIN genres_artists ON artists.id = genres_artists.artist_id /* Объединяем исполнителей с промежуточной таблицей между жанрами */
GROUP BY albums.title, artists.id  /* Группируем по именам альбомов и айди исполнителей из промежуточной таблицы между жанрами и исполнителями */
HAVING COUNT(genres_artists.genre_id) > 1; /* Где количество id жанров из промежуточной таблицы больше 1 */

SELECT tracks.title AS track
FROM tracks
LEFT JOIN collections_tracks ON tracks.id = collections_tracks.track_id
WHERE collections_tracks.track_id IS NULL;

SELECT artists.title /* Имена исполнителей */
FROM artists /* Из таблицы исполнителей */
JOIN albums_artists ON artists.id = albums_artists.artist_id  /* Объединяем с таблицей между исполнителями и альбомами */
JOIN tracks ON albums_artists.album_id = tracks.album_id /* Объединяем с таблицей треков */
WHERE tracks.duration = ( /* Где длительность трека равна вложенному запросу */
    SELECT MIN(tracks.duration) FROM tracks /* Получаем минимальную длительность из таблицы треков */
    JOIN albums_artists ON tracks.album_id = albums_artists.album_id /* Объединяем таблицу треков с промежуточной таблицей между альбомами и исполнителями на основе айди альбомов */
);

SELECT albums.title AS album, COUNT(tracks.id) AS num_tracks
FROM albums
LEFT JOIN tracks ON albums.id = tracks.album_id
GROUP BY album
HAVING COUNT(tracks.id) = (SELECT MIN(num_tracks) FROM (SELECT COUNT(id) AS num_tracks FROM tracks GROUP BY album_id) AS t);
