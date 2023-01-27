/*
 * TODO: Create a table called 'songs' that has the following fields:
 * - id - integer, primary key
 * - name - string
 * - album_id - foreign key
 * 
 * Note that album - song is a one-to-many relationship, so no bridge table is needed.
 */

CREATE TABLE Songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(70) NOT NULL,
    album_id INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

CREATE TABLE Albums (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(70) NOT NULL,
    artist VARCHAR(70) NOT NULL,
    year_published INTEGER NOT NULL
);

/* 
 * TODO: Insert at least 4 rows of data into the songs table. You can change up the albums as well. :)
 */
 
INSERT INTO Albums
    (name, artist, year_published)
VALUES
    ('The Dark Side of the Moon', 'Pink Floyd', 1973),
    ('Speaking In Tongues', 'Talking Heads', 1983),
    ('Arrival', 'ABBA', 1976),
    ('When In Rome', 'When In Rome', 1988),
    ('24K Magic', 'Bruno Mars', 2016),
    ('SOS', 'SZA', 2022)
;

INSERT INTO Songs
    (name, album_id)
VALUES
    ('Time', 1),
    ('Kill Bill', 6),
    ('This Must Be the Place', 2),
    ('The Promise', 4),
    ('Dancing Queen', 3),
    ('Finesse', 5)
;

/* Required to get result in column format */
.headers on
.mode column


/* Queries */

-- SELECT * FROM Songs;

SELECT *
FROM Songs;

SELECT * 
FROM Albums;

/* 
 * TODO: Write a table join query to construct a table of Song Name : Album Name
 */

SELECT * FROM Albums
JOIN Songs
ON Albums.id = Songs.album_id;

/*
 * TODO: Find all albums published between 1970 and 1980.
 */

SELECT * 
FROM Albums
WHERE year_published between 1970 AND 1980;

/*
 * TODO: Find all songs on albums published between 1970 and 1980. 
 *(Hint: Use a table join.)
 */

SELECT songs.name, year_published
FROM Songs
INNER JOIN Albums ON Albums.id = Songs.album_id
WHERE year_published BETWEEN 1970 AND 1980
ORDER BY year_published;

/*
 * TODO: Find all songs on albums with names containing 'California'.
 */

SELECT *
FROM Albums
WHERE name LIKE '%California%';

/* Got help from Paloma! */
