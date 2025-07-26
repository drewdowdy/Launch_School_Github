-- 1.

CREATE DATABASE extrasolar;

\c extrasolar

CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) UNIQUE NOT NULL,
  distance int NOT NULL CHECK (distance > 0),
  spectral_type char(1),
  companions int NOT NULL CHECK (companions > 0)
);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass int
);

-- 2.

ALTER TABLE planets
  ADD COLUMN star_id int NOT NULL REFERENCES stars (id);

-- 3.

ALTER TABLE stars
  ALTER COLUMN name TYPE varchar(50);

INSERT INTO stars (name, distance, spectral_type, companions)
  VALUES ('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',  4, 'K', 3);
-- ERROR:  value too long for type character varying(50)

-- 4.

ALTER TABLE stars
  ALTER COLUMN distance TYPE numeric; -- numeric has arbitrary precision

-- 5.

ALTER TABLE stars
  ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
  ALTER COLUMN spectral_type SET NOT NULL;

-- 6.

ALTER TABLE stars DROP CONSTRAINT stars_spectral_type_check;

CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
  ALTER COLUMN spectral_type TYPE spectral_type_enum
                             USING spectral_type::spectral_type_enum;

--7. 

ALTER TABLE planets
  ALTER COLUMN mass TYPE numeric,
  ALTER COLUMN mass SET NOT NULL,
  ADD CHECK (mass > 0),
  ALTER COLUMN designation SET NOT NULL;

-- 8.

ALTER TABLE planets
  ADD COLUMN semi_major_axis numeric NOT NULL;

-- 9.

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation int NOT NULL CHECK (designation > 0),
  semi_major_axis numeric CHECK (semi_major_axis > 0.0),
  mass numeric CHECK (mass > 0.0),
  planet_id int NOT NULL REFERENCES planets (id)
);

-- 10.

DROP DATABASE extrasolar;
