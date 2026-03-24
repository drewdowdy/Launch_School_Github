/*
Entities:

- surveys
- questions
- options
- responses (from user)
- users

Relationships:

surveys ||--|{ questions
questions ||--|{ options
questions ||--|| responses
users ||--o{ surveys
users ||--o{ responses

*/

CREATE TABLE users (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL DEFAULT 'Anonymous',
  creation_date timestamp NOT NULL DEFAULT now()
);

CREATE TABLE eating_styles (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE
);

INSERT INTO eating_styles (name)
  VALUES ('Waffle cone'), ('Bowl'), ('Straight from the tub');

CREATE TABLE toppings (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE
);

INSERT INTO toppings (name)
  VALUES ('Sprinkles'), ('Gummy bears'), ('Hot fudge'), ('Cookie dough');

CREATE TABLE flavors (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE
);

INSERT INTO flavors (name)
  VALUES ('Chocolate'), ('Vanilla'), ('Strawberry'), ('Cookies and cream');

CREATE TABLE responses (
  id serial PRIMARY KEY,
  user_id int NOT NULL UNIQUE
    REFERENCES users(id) ON DELETE CASCADE,
  brand text NOT NULL,
  eating_style_id int NOT NULL
    REFERENCES eating_styles(id) ON DELETE CASCADE,
  flavor_id int NOT NULL
    REFERENCES flavors(id) ON DELETE CASCADE,
  poem text NOT NULL,
  submission_date timestamp NOT NULL DEFAULT now()
);

-- Join table so each response can can be associated with more than one topping
CREATE TABLE toppings_responses (
  id serial PRIMARY KEY,
  response_id int NOT NULL
    REFERENCES responses(id) ON DELETE CASCADE,
  topping_id int NOT NULL
    REFERENCES toppings(id) ON DELETE CASCADE,
  UNIQUE(response_id, topping_id)
);
