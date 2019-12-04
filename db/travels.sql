DROP TABLE IF EXISTS sights;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS continents;

CREATE TABLE continents(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR,
  visited BOOLEAN
);

CREATE TABLE countries(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR not null,
  visited BOOLEAN
);

CREATE TABLE cities(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR not null,
  country_id INT REFERENCES countries(id) ON DELETE CASCADE,
  visited BOOLEAN
);

CREATE TABLE sights(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR not null,
  type VARCHAR,
  country_id INT REFERENCES countries(id) ON DELETE CASCADE,
  city_id INT REFERENCES cities(id) ON DELETE CASCADE
);

-- Sights depends countries & cities so gets dropped first.
-- Cities depends on countries so gets dropped next.
-- Create biggest down to smallest
