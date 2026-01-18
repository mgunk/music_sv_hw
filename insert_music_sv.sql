INSERT INTO genres (name) values ('Рок'), ('Поп'), ('Электро'), ('Хип-Хоп');
INSERT INTO artist (name) values ('Muse'), ('Coldplay'), ('Daft Punk'), ('Eminem');
INSERT INTO genres_artist (genres_id, artist_id) values (1, 1), (3, 1), (1, 2), (2, 2), (3, 3), (4, 4);
INSERT INTO albums (name, year) values ('Simulation Theory', 2018), ('Everyday Life', 2019), ('Random Access Memories', 2013), ('Music To Be Murdered By', 2020);
INSERT INTO albums_artist (artist_id, albums_id) values (1, 1), (2, 2), (3, 3), (4, 4);
INSERT INTO tracks (name, duration, albums_id) values ('Algorithm', 250, 1), ('Break My Soul', 230, 1), ('Sunrise', 180, 2), ('Guns', 150, 2), ('Instant Crush', 340, 3), ('Lose Yourself to Dance', 360, 3), ('Darkness', 330, 4), ('My Name Is', 270, 4), ('Skits', 90, 4); 
INSERT INTO collection (name, year) values ('Best of 2018', 2018), ('Rock Hits 2020', 2020), ('Electronic Vibes', 2017), ('Hip-Hop Essentials', 2019);
INSERT INTO tracks_collection (tracks_id, collection_id) VALUES(1, 1), (3, 1), (5, 1), (1, 2), (4, 2), (7, 2), (5, 3), (6, 3), (7, 4), (8, 4); 
