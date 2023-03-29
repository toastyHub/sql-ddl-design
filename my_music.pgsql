DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- Create albums TABLE

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_date DATE NOT NULL
);

-- Create producers TABLE

CREATE TABLE producers (
    id SERIAL PRIMARY KEY,
    producer TEXT NOT NULL,
    album_id INTEGER REFERENCES albums ON DELETE CASCADE
);

-- Create songs TABLE

CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    album_id INTEGER REFERENCES albums ON DELETE CASCADE,
    title TEXT NOT NULL,
    duration_in_seconds INTEGER NOT NULL
);

-- Create artist TABLE

CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    album_id INTEGER REFERENCES albums ON DELETE CASCADE,
    song_id INTEGER REFERENCES songs ON DELETE CASCADE,
    artist TEXT NOT NULL
);






-- Insert VALUES

INSERT INTO albums (title, release_date)
    VALUES
        ('Middle of Nowhere','1997-05-06'),
        ('A Night at the Opera','1975-11-21'),
        ('Daydream','1995-10-03'),
        ('A Star is Born','2018-10-05'),
        ('Silver Side Up','2001-09-11'),
        ('The Blueprint 3','2009-09-08'),
        ('Prism','2013-10-18'),
        ('Hands All Over','2010-09-21'),
        ('Let Go','2002-06-04'),
        ('The Writings on the Wall','1999-07-27');

INSERT INTO producers (producer, album_id)
    VALUES
        ('Dust Brothers',1),
        ('Stephen Lironi',1),
        ('Roy Thomas Baker',2),
        ('Walter Afanasieff',3),
        ('Benjamin Rice',4),
        ('Rick Parashar',5),
        ('Al Shux',6),
        ('Max Martin',7),
        ('Cirkut',7),
        ('Shellback',8),
        ('Benny Blanco',8),
        ('The Matrix',9),
        ('Darkchild',10);

INSERT INTO songs (album_id, title, duration_in_seconds)
    VALUES
        (1,'MMMBop',238),
        (2,'Bohemian Rhapsody',355),
        (3,'One Sweet Day',282),
        (4,'Shallow',216),
        (5,'How You Remind Me',223),
        (6,'New York State of Mind',276),
        (7,'Dark Horse',215),
        (8,'Moves Like Jagger',201),
        (9,'Complicated',244),
        (10,'Say My Name',240);

INSERT INTO artists (album_id, song_id, artist)
    VALUES
        (1,1,'Hanson'),
        (2,2,'Queen'),
        (3,3,'Mariah Carey'),
        (3,3,'Boyz II Men'),
        (4,4,'Lady Gaga'),
        (4,4,'Bradley Cooper'),
        (5,5,'Nickelback'),
        (6,6,'Jay Z'),
        (6,6,'Alicia Keys'),
        (7,7,'Katy Perry'),
        (7,7,'Juicy J'),
        (8,8,'Maroon 5'),
        (8,8,'Christina Aguilera'),
        (9,9,'Avril Lavigne'),
        (10,10,'Destinys Child');