-- 2. Create the join table that will allow a film to have multiple directors

CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id int REFERENCES directors(id) ON DELETE CASCADE,
  film_id int REFERENCES films(id) ON DELETE CASCADE,
  UNIQUE (film_id, director_id)
);

-- 3. Insert the directors and their corresponding films into the 'directors_films' table

INSERT INTO directors_films (director_id, film_id)
  VALUES (1, 1), (2, 2), (3, 7), (3, 3), (4, 10), (4, 4), (5, 5), (6, 6), (7, 8), (8, 9);

-- 4. Remove any unecessary columns from 'films'

ALTER TABLE films DROP COLUMN director_id;

-- 5. Return the movie title and director name of all films

SELECT films.title, directors.name
  FROM directors
    INNER JOIN directors_films ON directors.id = directors_films.director_id
    INNER JOIN films ON directors_films.film_id = films.id
  ORDER BY films.title;

-- 6.

INSERT INTO directors (name)
  VALUES ('Joel Coen'),
         ('Ethan Coen'),
         ('Frank Miller'),
         ('Robert Rodriguez');

INSERT INTO films (title, "year", genre, duration)
  VALUES ('Fargo', 1996, 'comedy', 98),
         ('No Country for Old Men', 2007, 'western', 122),
         ('Sin City', 2005, 'crime', 124),
         ('Spy Kids', 2001, 'si-fi', 88);

SELECT * FROM films
  WHERE title IN ('Fargo', 'No Country for Old Men', 'Sin City', 'Spy Kids');

SELECT * FROM directors
  WHERE name IN ('Joel Coen', 'Ethan Coen', 'Frank Miller', 'Robert Rodriguez');

INSERT INTO directors_films (film_id, director_id)
  VALUES (11, 9),
         (12, 9),
         (12, 10),
         (13, 11),
         (13, 12),
         (14, 12);

-- 7.

SELECT directors.name AS director, count(directors_films.film_id) AS films
  FROM directors
    INNER JOIN directors_films ON directors.id = directors_films.director_id
  GROUP BY directors.name
  ORDER BY films DESC, directors.name;
