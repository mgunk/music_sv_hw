create table if not exists genres(
genres_id SERIAL primary key,
name VARCHAR(60) not null unique
);
create table if not exists artist(
artist_id SERIAL primary key,
name VARCHAR(80) not null
);
create table if not exists genres_artist(
genres_id INTEGER references genres(genres_id),
artist_id INTEGER references artist(artist_id),
PRIMARY KEY (genres_id, artist_id)
);
create table if not exists albums(
albums_id SERIAL primary key,
name VARCHAR(40) not null,
year INTEGER not null check(year between 1860 and 2030)
);
create table if not exists albums_artist(
artist_id INTEGER not null references artist(artist_id),
albums_id INTEGER not null references albums(albums_id),
PRIMARY KEY (albums_id, artist_id)
);
create table if not exists tracks(
tracks_id SERIAL primary key,
name VARCHAR(40) not null,
duration INTEGER not null CHECK(duration > 0),
albums_id INTEGER references albums(albums_id)
);
create table if not exists collection(
collection_id SERIAL primary key,
name VARCHAR(100) not null,
year INTEGER not null
);
create table if not exists tracks_collection(
tracks_id INTEGER not null references tracks(tracks_id),
collection_id INTEGER not null references collection(collection_id),
PRIMARY KEY (tracks_id, collection_id)
);