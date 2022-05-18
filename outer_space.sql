-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE
);

CREATE TABLE planets_info
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

INSERT INTO planets (name)
VALUES
  ('Mercury'), ('Venus'), ('Earth'), ('Mars'), ('Jupiter'), ('Saturn'), ('Uranus'), ('Neptune'), ('Proxima Centauri b'), ('Gliese 876 b');

INSERT INTO moons (name, planet_id)
VALUES
  ('The Moon', 3), ('Phobos', 4), ('Deimos', 4), ('Naiad', 8), ('Thalassa', 8), ('Despina', 8), ('Galatea', 8), ('Larissa', 8), 
  ('S/2004 N 1', 8), ('Proteus', 8), ('Triton', 8), ('Nereid', 8), ('Halimede', 8), ('Sao', 8), ('Laomedeia', 8), ('Psamathe', 8), ('Neso', 8);

INSERT INTO planets_info
  (planet_id, orbital_period_in_years, orbits_around, galaxy)
VALUES
  (3, 1.00, 'The Sun', 'Milky Way'),
  (4, 1.88, 'The Sun', 'Milky Way'),
  (2, 0.62, 'The Sun', 'Milky Way'),
  (8, 164.8, 'The Sun', 'Milky Way'),
  (9, 0.03, 'Proxima Centauri', 'Milky Way'),
  (10, 0.23, 'Gliese 876', 'Milky Way');