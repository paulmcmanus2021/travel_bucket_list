DROP TABLE IF EXISTS sights;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;

CREATE TABLE countries(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR not null,
  cities VARCHAR,
  visited BOOLEAN
);

CREATE TABLE cities(
  id SERIAL8 PRIMARY KEY,
  country_id INT REFERENCES countries(id),
  name VARCHAR not null,
  sights VARCHAR,
  visited BOOLEAN
);

CREATE TABLE sights(
  id SERIAL8 PRIMARY KEY,
  country_id INT REFERENCES,
  city_id INT REFERENCES cities(id),
  name VARCHAR not null,
  type VARCHAR,
  visited BOOLEAN
);

-- Sights depends countries & cities so gets dropped first.
-- Cities depends on countries so gets dropped next.
-- Create biggest down to smallest
