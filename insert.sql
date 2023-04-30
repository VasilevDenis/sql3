-- Insert some data into artists, genres, collections, and tracks tables
INSERT INTO artists (title) VALUES
    ('The Beatles'),
    ('Pink Floyd'),
    ('Led Zeppelin'),
    ('Queen'),
    ('The Rolling Stones'),
    ('David Bowie'),
    ('Bob Dylan'),
    ('Jimi Hendrix');

INSERT INTO genres (title) VALUES
    ('Rock'),
    ('Pop'),
    ('Folk'),
    ('Blues'),
    ('Jazz');

INSERT INTO albums (title, release_year) VALUES
    ('Sgt. Pepper''s Lonely Hearts Club Band', 2018),
    ('Dark Side of the Moon', 2020),
    ('Led Zeppelin IV', 1971),
    ('A Night at the Opera', 1975),
    ('Sticky Fingers', 1971),
    ('The Rise and Fall of Ziggy Stardust and the Spiders from Mars', 1972),
    ('Blood on the Tracks', 1975),
    ('Electric Ladyland', 1968);

INSERT INTO tracks (title, duration, album_id) VALUES
    ('Lucy in the Sky with Diamonds', 203, 1),
    ('Another Brick in the Wall', 232, 2),
    ('Stairway to my Heaven', 482, 3),
    ('Bohemian Rhapsody', 354, 4),
    ('Brown Sugar', 228, 5),
    ('Starman', 258, 6),
    ('Tangled Up in Blue', 359, 7),
    ('All Along the Watchtower', 239, 8),
    ('Money', 383, 2),
    ('Wish You Were Here', 334, 2),
    ('Kashmir', 518, 3),
    ('Hotel California', 391, 3),
    ('Sympathy for the Devil', 382, 5),
    ('Space Oddity', 320, 6),
    ('Like a Rolling Stone', 361, 7),
    ('Purple Haze', 167, 8);

INSERT INTO collections (title, release_year) VALUES
    ('Greatest Hits', 2019),
    ('The Wall', 2020),
    ('Physical Graffiti', 1975),
    ('Jazz Samba', 1962),
    ('Mingus Ah Um', 1959),
    ('Bitches Brew', 1970),
    ('Kind of Blue', 1959),
    ('Led Zeppelin', 1969);

-- Populate genres_artists table
INSERT INTO genres_artists (genre_id, artist_id) VALUES
    (1, 1), -- Rock - The Beatles
    (1, 2), -- Rock - Pink Floyd
    (1, 3), -- Rock - Led Zeppelin
    (1, 4), -- Rock - Queen
    (1, 5), -- Rock - The Rolling Stones
    (1, 6), -- Rock - David Bowie
    (1, 7), -- Rock - Bob Dylan
    (1, 8), -- Rock - Jimi Hendrix
    (2, 4), -- Pop - Queen
    (3, 7), -- Folk - Bob Dylan
    (4, 5); -- Blues - The Rolling Stones
    
    -- Insert data into albums_artists table
INSERT INTO albums_artists (album_id, artist_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 2),
    (4, 4);

-- Insert data into collections_tracks table
INSERT INTO collections_tracks (collection_id, track_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 5),
    (2, 6),
    (2, 7),
    (3, 8),
    (3, 9),
    (3, 10),
    (4, 11),
    (4, 12),
    (4, 13),
    (4, 14),
    (4, 15);
