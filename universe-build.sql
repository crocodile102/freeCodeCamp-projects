CREATE DATABASE universe;

\c universe

CREATE TABLE star (star_id SERIAL PRIMARY KEY, name VARCHAR(50) UNIQUE NOT NULL, galaxy_id INT NOT NULL, FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id), distance_in_ly NUMERIC(4,2), stellar_class TEXT);
INSERT INTO star (name, galaxy_id) VALUES ('Sun',1),('Proxima Centauri',1),('Rigil Kentaurus',1),('Toliman',1),('Barnards Star',1),('Luhman 16',1);

CREATE TABLE planet (planet_id SERIAL PRIMARY KEY, name VARCHAR(50) UNIQUE NOT NULL, star_id INT NOT NULL, FOREIGN KEY (star_id) REFERENCES star (star_id), has_life BOOLEAN, notes TEXT);
INSERT INTO planet (name, star_id) VALUES ('Mercury',1),('Venus',1),('Earth',1),('Mars',1),('Jupiter',1),('Saturn',1),('Uranus',1),('Neptune',1),('Proxima Centauri d',2),('Barnard b',5),('Barnard d',5),('Barnard c',5);

CREATE TABLE moon (moon_id SERIAL PRIMARY KEY, name VARCHAR(50) UNIQUE NOT NULL, planet_id INT NOT NULL, FOREIGN KEY (planet_id) REFERENCES planet (planet_id), mean_diameter INT, notes TEXT);
INSERT INTO moon (name, planet_id) VALUES ('Moon',3),('Ganymede',5),('Callisto',5),('Io',5),('Europa',5),('Amalthea',5),('Himalia',5),('Thebe',5),('Elara',5),('Pasiphae',5),('Carme',5),('Metis',5),('Sinope',5),('Lysithea',5),('Ananke',5),('Leda',5),('Adrastea',5),('Titan',6),('Rhea',6),('Iapetus',6),('Dione',6),('Tethys',6);

CREATE TABLE universe_table (universe_table_id SERIAL PRIMARY KEY, name VARCHAR(50) UNIQUE NOT NULL, populated BOOLEAN NOT NULL);
INSERT INTO universe_table (name, populated) VALUES ('galaxy',TRUE),('star',TRUE),('planet',TRUE),('moon',TRUE);