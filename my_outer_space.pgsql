DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- Create stars TABLE

CREATE TABLE stars (
    id SERIAL PRIMARY KEY,
    star TEXT NOT NULL
);

-- Create galaxies TABLE

CREATE TABLE galaxies (
    id SERIAL PRIMARY KEY,
    galaxy TEXT NOT NULL
);

-- Create planets TABLE

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet TEXT NOT NULL,
  orbital_period_yrs FLOAT NOT NULL,
  orbits_around INTEGER NOT NULL REFERENCES stars,
  galaxy INTEGER NOT NULL REFERENCES galaxies
);

-- Create moons TABLE

CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    planet_id INTEGER REFERENCES planets ON DELETE CASCADE,
    moon TEXT NOT NULL
);


INSERT INTO stars (star) 
    VALUES
        ('The Sun'),
        ('Proxima Centauri'),
        ('Gliese 876');


INSERT INTO galaxies (galaxy)
    VALUES
        ('Milky Way');


INSERT INTO planets (planet, orbital_period_yrs, orbits_around, galaxy)
    VALUES  
        ('Earth', 1, 1, 1),
        ('Mars', 1.88, 1, 1),
        ('Venus', 0.62, 1, 1),
        ('Neptune', 164.8, 1, 1),
        ('Proxima Centauri b', 0.03, 2, 1),
        ('Gliese 876 b', 0.23, 3, 1);

INSERT INTO moons (planet_id, moon)
    VALUES
        (1, 'The Moon'),
        (2, 'Phobos'),
        (2, 'Deimos'),
        (4, 'Naiad'),
        (4, 'Thalassa'),
        (4, 'Despina'),
        (4, 'Galatea'),
        (4, 'Larissa'),
        (4, 'S/2004 N 1'),
        (4, 'Proteus'),
        (4, 'Triton'),
        (4, 'Nereid'),
        (4, 'Halimede'),
        (4, 'Sao'),
        (4, 'Laomedeia'),
        (4, 'Psamathe'),
        (4, 'Neso');