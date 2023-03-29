DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- Create passengers TABLE

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- Create flights TABLE

CREATE TABLE flights (
    id SERIAL PRIMARY KEY NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    airline TEXT NOT NULL
);

-- Create locations TABLE

CREATE TABLE locations (
    id SERIAL PRIMARY KEY NOT NULL,
    city TEXT NOT NULL,
    country TEXT NOT NULL
);

-- Create seats TABLE

CREATE TABLE seats (
    id SERIAL PRIMARY KEY NOT NULL,
    seat_num TEXT,
    flight_id INTEGER REFERENCES flights ON DELETE CASCADE,
    passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE
);

-- Create routes TABLE

CREATE TABLE routes (
    id SERIAL PRIMARY KEY NOT NULL,
    from_loc_id INTEGER REFERENCES locations ON DELETE CASCADE,
    to_loc_id INTEGER REFERENCES locations ON DELETE CASCADE,
    flight_id INTEGER REFERENCES flights
);

-- DATA INSERTIONS 

INSERT INTO passengers (first_name, last_name)
    VALUES
        ('Jennifer','Finch'),
        ('Thadeus','Gathercoal'),
        ('Sonja','Pauley'),
        ('Waneta','Skeleton'),
        ('Berkie','Wycliff'),
        ('Alvin','Leathes'),
        ('Cory','Squibbes');

INSERT INTO locations (city, country)
    VALUES
        ('Washington DC','United States'),
        ('Tokyo','Japan'),
        ('Los Angeles','United States'),
        ('Seattle','United States'),
        ('Paris','France'),
        ('Dubai','UAE'),
        ('New York','United States'),
        ('Cedar Rapids','United States'),
        ('Charlotte','United States'),
        ('Sao Paulo','Brazil'),
        ('London','United Kingdom'),
        ('Las Vegas','United States'),
        ('Mexico City','Mexico'),
        ('Casablanca','Morocco'),
        ('Beijing','China'),
        ('Chicago','United States'),
        ('New Orleans','United States'),
        ('Santiago','Chile');

INSERT INTO flights (departure, arrival, airline)
    VALUES
        ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United'),
        ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways'),
        ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta'),
        ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta'),
        ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium'),
        ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China'),
        ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United'),
        ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines'),
        ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines'),
        ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil');

INSERT INTO seats (seat_num, flight_id, passenger_id)
    VALUES
        ('33B',1,1),
        ('8A',2,2),
        ('12F',3,3),
        ('20A',4,4),
        ('23D',5,4),
        ('18C',6,2),
        ('9E',7,5),
        ('1A',8,6),
        ('32B',9,5),
        ('10D',10,7);

INSERT INTO routes (from_loc_id, to_loc_id, flight_id)
    VALUES
        (1,4,1),
        (2,11,2),
        (3,12,3),
        (4,13,4),
        (5,14,5),
        (6,15,6),
        (7,9,7),
        (8,16,8),
        (9,17,9),
        (10,18,10);