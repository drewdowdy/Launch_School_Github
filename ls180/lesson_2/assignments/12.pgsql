-- 1. Import the file 'films4.sql` into the database called 'films'
-- psql -d films < films4.sql

-- 2. Write SQL statements that insert some data
INSERT INTO films
  VALUES ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95),
         ('Bourne Identity', 2002, 'espionage', 'Doug Liman' 118);

-- 3. Write an SQL statement to list all the genres for which there is a film in the table
SELECT DISTINCT genre FROM films;

-- 4. Write another SQL statement with the same effect as #3.
SELECT genre FROM films
  GROUP BY genre;

-- 5. Write an SQL query that determines the average duration accross all movies
SELECT ROUND(AVG(duration), 0) FROM films;

-- 6. Write an SQL query that determines the average duration per genre
SELECT genre, ROUND(AVG(duration), 0) FROM films
  GROUP BY genre;

-- 7. Write an SQL query that determines the average duration of movies per decade and is in chronological order
SELECT ((year / 10) * 10) AS decade, ROUND(AVG(duration), 0) FROM films
  GROUP BY decade
  ORDER BY decade;

-- 8. Write an SQL query that displays all films where the director's name is John
SELECT * FROM films
  WHERE director LIKE 'John%';

-- 9. Write an SQL query that returns the following:
  --  genre   | count
---------+-------
--  scifi     |     5
--  comedy    |     4
--  drama     |     2
--  espionage |     2
--  crime     |     1
--  thriller  |     1
--  horror    |     1
--  action    |     1
-- (8 rows)
SELECT genre, count(id) FROM films
  GROUP BY genre
  ORDER BY count DESC;

-- 10. Write an SQL query that returns the following:
--  decade |   genre   |                  films
------+-----------+------------------------------------------
  --  1940 | drama     | Casablanca
  --  1950 | drama     | 12 Angry Men
  --  1950 | scifi     | 1984
  --  1970 | crime     | The Godfather
  --  1970 | thriller  | The Conversation
  --  1980 | action    | Die Hard
  --  1980 | comedy    | Hairspray
  --  1990 | comedy    | Home Alone, The Birdcage, Wayne's World
  --  1990 | scifi     | Godzilla
  --  2000 | espionage | Bourne Identity
  --  2000 | horror    | 28 Days Later
  --  2010 | espionage | Tinker Tailor Soldier Spy
  --  2010 | scifi     | Midnight Special, Interstellar, Godzilla
-- (13 rows)
SELECT (year / 10) * 10 AS decade, genre, STRING_AGG(title, ', ') AS films FROM films
  GROUP BY decade, genre
  ORDER BY decade, genre; 

-- 11. Write an SQL query that returns the following:
  --  genre   | total_duration
---------+----------------
--  horror    |            113
--  thriller  |            113
--  action    |            132
--  crime     |            175
--  drama     |            198
--  espionage |            245
--  comedy    |            407
--  scifi     |            632
-- (8 rows)
SELECT genre, SUM(duration) AS total_duration FROM films
  GROUP BY genre;