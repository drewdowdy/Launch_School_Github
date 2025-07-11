CREATE DATABASE animals; -- standard sql command from the sql console
createdb animals         -- wrapper function from the terminal

-- animals=#

CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(50),
  age int,
  species varchar(15)
);

INSERT INTO birds (name, age, species)
  VALUES ('Charlie', 3, 'Finch'),
         ('Allie', 5, 'Owl'),
         ('Jennifer', 3, 'Magpie'),
         ('Jamie', 4, 'Owl'),
         ('Roy', 8, 'Crow');

-- if we use INSERT INTO without column names,
-- we MUST include values for all columns
-- in the order in which they appear in the table

INSERT INTO birds
  VALUES (1, 'Charlie', 3, 'Finch'),
         (2, 'Allie', 5, 'Owl'),
         (3, 'Jennifer', 3, 'Magpie'),
         (4, 'Jamie', 4, 'Owl'),
         (5, 'Roy', 8, 'Crow');

-- could also use DEFAULT to take care of ids

INSERT INTO birds
  VALUES (DEFAULT, 'Charlie', 3, 'Finch'),
         (DEFAULT, 'Allie', 5, 'Owl'),
         (DEFAULT, 'Jennifer', 3, 'Magpie'),
         (DEFAULT, 'Jamie', 4, 'Owl'),
         (DEFAULT, 'Roy', 8, 'Crow');

SELECT * FROM birds -- * is the wildcard that selects everything

SELECT * FROM birds
  WHERE age < 5;

UPDATE birds SET species = 'Raven'
  WHERE species = 'Crow';

UPDATE birds SET species = 'Hawk'
  WHERE name = 'Jamie';

DELETE FROM birds
  WHERE age = 3 AND species = 'Finch';

ALTER TABLE birds
  ADD CONSTRAINT check_age CHECK (age > 0); -- we name the constraint ourselves

ALTER TABLE birds
  ADD CHECK (age > 0);  -- postgresql will name the contraint for us
  
DROP TABLE birds;

DROP DATABASE animals; -- sql command from sql console
dropdb animals         -- wrapper function from terminal
