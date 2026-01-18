-- Название и продолжительность самого длинного трека
SELECT name, duration
FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

-- Названия треков продолжительностью не менее 3,5 минут
SELECT name
FROM tracks
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name
FROM collection
WHERE year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name
FROM artist
WHERE name NOT LIKE '% %';

-- Названия треков, в которых есть слово «мой» или «my» 
SELECT name
FROM tracks
WHERE name ILIKE '% my %' OR name ILIKE 'my %' OR name ILIKE '% my' OR name ILIKE '%мой%';

-- Количество исполнителей в каждом жанре
SELECT g.name AS genre,
       COUNT(ga.artist_id) AS artist_count
FROM genres g
LEFT JOIN genres_artist ga ON g.genres_id = ga.genres_id
GROUP BY g.name
ORDER BY artist_count DESC;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.tracks_id) AS tracks_2019_2020
FROM tracks t
JOIN albums a ON t.albums_id = a.albums_id
WHERE a.year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков в каждом альбоме
SELECT a.name AS album,
       AVG(t.duration) AS avg_duration
FROM albums a
JOIN tracks t ON a.albums_id = t.albums_id
GROUP BY a.albums_id, a.name
ORDER BY a.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT ar.name
FROM artist ar
WHERE ar.artist_id NOT IN (
    SELECT aa.artist_id
    FROM albums_artist aa
    JOIN albums a ON aa.albums_id = a.albums_id
    WHERE a.year = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT c.name
FROM collection c
JOIN tracks_collection tc ON c.collection_id = tc.collection_id
JOIN tracks t            ON tc.tracks_id = t.tracks_id
JOIN albums a            ON t.albums_id = a.albums_id
JOIN albums_artist aa    ON a.albums_id = aa.albums_id
JOIN artist ar           ON aa.artist_id = ar.artist_id
WHERE ar.name = 'Eminem';

-- Названия альбомов, в которых представлены исполнители более чем одного жанра
SELECT a.name
FROM albums a
JOIN albums_artist aa ON a.albums_id = aa.albums_id
JOIN genres_artist ga ON aa.artist_id = ga.artist_id
GROUP BY a.albums_id, a.name
HAVING COUNT(DISTINCT ga.genres_id) > 1;

-- Названия треков, которые не вошли ни в один сборник
SELECT t.name
FROM tracks t
LEFT JOIN tracks_collection tc ON t.tracks_id = tc.tracks_id
WHERE tc.collection_id IS NULL;

-- Исполнители, написавшие самый короткий трек
SELECT DISTINCT ar.name
FROM artist ar
JOIN albums_artist aa ON ar.artist_id = aa.artist_id
JOIN albums a         ON aa.albums_id = a.albums_id
JOIN tracks t         ON a.albums_id = t.albums_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- Названия альбомов с наименьшим количеством треков
SELECT a.name
FROM albums a
JOIN tracks t ON a.albums_id = t.albums_id
GROUP BY a.albums_id, a.name
HAVING COUNT(t.tracks_id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(t2.tracks_id) AS track_count
        FROM albums a2
        JOIN tracks t2 ON a2.albums_id = t2.albums_id
        GROUP BY a2.albums_id
    ) AS sub
);



