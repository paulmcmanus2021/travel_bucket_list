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
  visited BOOLEAN,
  continent_id INT REFERENCES continents(id)
);

CREATE TABLE cities(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR not null,
  visited BOOLEAN,
  country_id INT REFERENCES countries(id)
);

CREATE TABLE sights(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR not null,
  visited BOOLEAN,
  type VARCHAR,
  city_id INT REFERENCES cities(id)
);

-- Sights depends countries & cities so gets dropped first.
-- Cities depends on countries so gets dropped next.
-- Create biggest down to smallest
