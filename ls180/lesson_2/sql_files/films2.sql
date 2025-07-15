DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), year integer, genre varchar(100), director varchar(255), duration integer);

INSERT INTO films(title, year, genre, director, duration) VALUES ('Die Hard', 1988, 'action', 'John McTiernan', 132);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('Casablanca', 1942, 'drama', 'Michael Curtiz', 102);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('The Conversation', 1974, 'thriller', 'Francis Ford Coppola', 113);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

--
-- PRACTICE STATEMENTS BELOW
--

-- psql -d drewdowdy < films2.sql

-- Make all of the columns NOT NULL
ALTER TABLE films ALTER COLUMN title SET NOT NULL; -- IS NULL or NOT NULL constraints
ALTER TABLE films ALTER COLUMN year SET NOT NULL;
ALTER TABLE films ALTER COLUMN genre SET NOT NULL;
ALTER TABLE films ALTER COLUMN director SET NOT NULL;
ALTER TABLE films ALTER COLUMN duration SET NOT NULL;

-- Ensure that all film titles are unique
ALTER TABLE films ADD CONSTRAINT title_unique UNIQUE (title); -- All other constraints

-- Drop the title_unique constraint
ALTER TABLE films DROP CONSTRAINT title_unique;

-- Ensure that all film titles are at least one character long
ALTER TABLE films ADD CONSTRAINT title_length CHECK (length(title) >= 1);

-- Demonstrate the error that appears if we break the title_length constraint
INSERT INTO films
  VALUES ('', 1960, 'horror', 'Alfred Hitchcock', 109);
-- ERROR:  new row for relation "films" violates check constraint "title_length"
-- DETAIL:  Failing row contains (, 1960, horror, Alfred Hitchcock, 109).

-- Drop the title_length constraint
ALTER TABLE films DROP CONSTRAINT title_length;

-- Ensure that all films added have years between 1900 and 2100
ALTER TABLE films ADD CONSTRAINT year_range CHECK (year BETWEEN 1900 AND 2100);

-- Ensure that all films have a director that is at least 3 characters long and has a space
ALTER TABLE films
  ADD CONSTRAINT director_name
    CHECK (length(director) >= 3 AND director LIKE '% %');

-- Try to update the director of "Die Hard" to "Johnny"
UPDATE films
  SET director = 'Johnny'
  WHERE title = 'Die Hard';

-- Q: List three ways to use the schema to restrict what values can be stored in a column.
-- A: Data type, NOT NULL constraints, CHECK constraints