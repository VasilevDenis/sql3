BEGIN;

CREATE TABLE IF NOT EXISTS albums
(
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL,
    release_year integer NOT NULL CHECK (release_year > 1900 AND release_year <= EXTRACT(year FROM NOW()))
);

CREATE TABLE IF NOT EXISTS artists
(
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS collections
(
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL UNIQUE,
    release_year integer NOT NULL CHECK (release_year > 1900 AND release_year <= EXTRACT(year FROM NOW()))
);

CREATE TABLE IF NOT EXISTS genres
(
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tracks
(
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL,
    duration integer  NOT NULL CHECK (duration > 1 AND duration < 60000),
    album_id integer  NOT NULL REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS albums_artists
(
    album_id integer NOT NULL REFERENCES albums(id),
    artist_id integer NOT NULL REFERENCES artists(id),
	CONSTRAINT albart PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS genres_artists
(
    genre_id integer  NOT NULL REFERENCES genres(id),
    artist_id integer  NOT NULL REFERENCES artists(id),
	CONSTRAINT genart PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS collections_tracks
(
    collection_id integer NOT NULL REFERENCES collections(id),
    track_id integer NOT NULL REFERENCES tracks(id),
	CONSTRAINT colltrac PRIMARY KEY (collection_id, track_id)
);

END;
