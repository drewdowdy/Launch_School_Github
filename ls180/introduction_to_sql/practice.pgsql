CREATE TABLE famous_people (
  id serial,
  name varchar(100) NOT NULL,
  occupation varchar(150),
  date_of_birth varchar(50),
  deceased boolean DEFAULT false
);

CREATE TABLE animals (
  id serial,
  name varchar(100) NOT NULL,
  binomial_name varchar(100) NOT NULL,
  max_weight_kg decimal(8,3), -- decimal(total_digits, digits_to_the_right_of_decimal)
  max_age_years integer,
  conservation_status char(2) -- char is used when the number of characters doesn't change
);

-- ls_burger database

CREATE TABLE orders (
  id serial,
  customer_name varchar(100) NOT NULL,
  burger varchar(50),
  side varchar(50),
  drink varchar(50),
  order_total decimal(4,2) NOT NULL
);

ALTER TABLE users
  RENAME TO all_users;

ALTER TABLE all_users
  RENAME COLUMN username TO full_name;

ALTER TABLE all_users
  ALTER COLUMN full_name TYPE varchar(25);

ALTER TABLE all_users
  ALTER COLUMN full_name
  SET NOT NULL;

ALTER TABLE all_users
  ALTER COLUMN id
  DROP DEFAULT;

ALTER TABLE all_users
  ADD COLUMN last_login timestamp
    NOT NULL
    DEFAULT NOW();

ALTER TABLE all_users DROP COLUMN enabled;

-- encyclopedia database

ALTER TABLE famous_people
  RENAME TO celebrities;

ALTER TABLE celebrities
  RENAME COLUMN name TO first_name;

ALTER TABLE celebrities
  ALTER COLUMN first_name TYPE varchar(80);

ALTER TABLE celebrities
  ADD COLUMN last_name varchar(100) NOT NULL;

ALTER TABLE celebrities
  ALTER COLUMN date_of_birth TYPE date
    USING date_of_birth::date,
  ALTER COLUMN date_of_birth SET NOT NULL;

ALTER TABLE animals
  ALTER COLUMN max_weight_kg TYPE decimal(10,4);

ALTER TABLE animals
  ADD CONSTRAINT unique_binomial_name UNIQUE
  (binomial_name);

-- ls_burger database

ALTER TABLE orders
  ADD COLUMN customer_email varchar(50),
  ADD COLUMN customer_loyalty_points integer DEFAULT 0;

ALTER TABLE orders
  ADD COLUMN burger_cost decimal(4,2) DEFAULT 0,
  ADD COLUMN side_cost decimal(4,2) DEFAULT 0,
  ADD COLUMN drink_cost decimal(4,2) DEFAULT 0;

ALTER TABLE orders DROP COLUMN order_total;

-- ls_book database

CREATE TABLE users (
  id serial UNIQUE NOT NULL,
  full_name varchar(25) NOT NULL,
  enabled boolean DEFAULT true,
  last_login timestamp without time zone DEFAULT now()
);

-- ls_book database; users table

INSERT INTO users (full_name, enabled)
  VALUES ('John Smith', false);

INSERT INTO users (full_name)
  VALUES ('Jane Smith'), ('Harry Potter'); -- adds two rows

-- encyclopedia database

INSERT INTO countries (name, capital, population)
  VALUES ('France', 'Paris', 67158000);

INSERT INTO countries (name, capital, population)
  VALUES ('USA', 'Washington D.C.', 3253659),
         ('Germany', 'Berlin', 82349400),
         ('Japan', 'Tokyo', 126672000);

INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
  VALUES ('Bruce', 'Springsteen', 'singer and songwriter', '1949-09-23', false );

INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth)
  VALUES ('Scarlett', 'Johansson', 'actress', '1984-11-22');

INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
  VALUES ('Frank', 'Sinatra', 'singer, actor', '1915-12-12', true),
         ('Tom', 'Cruise', 'actor', '1962-07-03', DEFAULT);

ALTER TABLE celebrities
  ALTER COLUMN last_name DROP NOT NULL;

INSERT INTO celebrities (first_name, occupation, date_of_birth, deceased)
  VALUES ('Madonna', 'singer, actress', '1958-08-16', false),
         ('Prince', 'singer, songwriter, musician, actor', '1958-06-07', true);

INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
  VALUES ('Elvis', 'Presley', 'singer, musician, actor', '1935-01-08', NULL);

ALTER TABLE animals
  DROP CONSTRAINT unique_binomial_name;

INSERT INTO animals (name, binomial_name, max_weight_kg, max_age_years, conservation_status)
             VALUES ('Dove', 'Columbidae Columbiformes', 2, 15, 'LC'),
                    ('Golden Eagle', 'Aquila Chrysaetos', 6.35, 24, 'LC'),
                    ('Peregrine Falcon', 'Falco Peregrinus', 1.5, 15, 'LC'),
                    ('Pigeon', 'Columbidae Columbiformes', 2, 15, 'LC'),
                    ('Kakapo', 'Strigops habroptila', 4, 60,'CR');

INSERT INTO orders (customer_name, customer_email, customer_loyalty_points, burger, burger_cost, side, side_cost, drink, drink_cost)
  VALUES ('James Bergman', 'james1998@email.com', 28, 'LS Chicken Burger', 4.50, 'Fries', 0.99, 'Cola', 1.50),
         ('Natasha O''Shea', 'natasha@osheafamily.com', 18, 'LS Cheeseburger', 3.50, 'Fries', 0.99, NULL, DEFAULT),
         ('Natasha O''Shea', 'natasha@osheafamily.com', 42, 'LS Double Deluxe Burger', 6.00, 'Onion Rings', 1.50, 'Chocolate Shake', 2.00),
         ('Aaron Muller', NULL, 10, 'LS Burger', 3.00, NULL, DEFAULT, NULL, DEFAULT);

-- ls_book database, users table

SELECT full_name, enabled FROM users -- false appears before true
  ORDER BY enabled;

SELECT full_name, enabled FROM users
  ORDER BY enabled DESC;

SELECT full_name, enabled FROM users
  ORDER BY enabled DESC, id DESC;

SELECT full_name, enabled, last_login
       FROM users
       WHERE id >= 2;

SELECT * FROM users
         WHERE full_name = 'Harry Potter'
            OR enabled = 'false';

SELECT * FROM users
         WHERE full_name = 'Harry Potter'
           AND enabled = 'false';

SELECT * FROM users WHERE full_name LIKE '%Smith';
SELECT * FROM users WHERE full_name LIKE '%SMIth';

SELECT * FROM users WHERE full_name ILIKE '%SMIth'; -- ILIKE case insensitive

SELECT population 
  FROM countries
  WHERE name = 'USA';

SELECT population, capital
  FROM countries;

SELECT name
  FROM countries
  ORDER BY name;

SELECT name, capital
  FROM countries
  ORDER BY population;

SELECT name, capital
  FROM countries
  ORDER BY population DESC;

-- animals table

SELECT name, binomial_name, max_weight_kg, max_age_years
  FROM animals
  ORDER BY max_age_years, max_weight_kg, name DESC;

SELECT name
  FROM countries
  WHERE population > 70000000 AND population < 200000000;

SELECT first_name, last_name
  FROM celebrities
  WHERE deceased <> true OR deceased IS NULL; -- <> is alias for !=

SELECT first_name, last_name
  FROM celebrities
  WHERE occupation LIKE '%singer%';

-- '%singer' matches 'singer' at the end of a string
-- 'singer%' matches 'singer' at the beginning of a string
-- '%singer%' matches 'singer' anywhere in the string

SELECT first_name, last_name
  FROM celebrities
  WHERE occupation LIKE '%actress%' OR occupation LIKE '%actor%';

SELECT first_name, last_name
  FROM celebrities
  WHERE occupation LIKE '%singer%'
  AND (occupation LIKE '%actor%' OR occupation LIKE '%actress%'); -- use paranthesis to group clauses together

-- ls_burger database

SELECT burger FROM orders
  WHERE burger_cost < 5.00
  ORDER BY burger_cost;

SELECT customer_name, customer_email, customer_loyalty_points FROM orders
  WHERE customer_loyalty_points >= 20
  ORDER BY customer_loyalty_points DESC;

SELECT burger FROM orders
  WHERE customer_name = 'Natasha O''Shea';

SELECT customer_name FROM orders
  WHERE drink IS NULL;

SELECT burger, side, drink FROM orders
  WHERE side <> 'Fries' OR side IS NULL;

SELECT burger, side, drink FROM orders
  WHERE side IS NOT NULL AND drink IS NOT NULL;

SELECT * FROM users LIMIT 1;

SELECT * FROM users LIMIT 1 OFFSET 1;

SELECT DISTINCT full_name FROM users;

SELECT count(full_name) FROM users;

SELECT count(DISTINCT full_name) FROM users;

SELECT full_name, age(last_login) FROM users;

SELECT enabled, count(id) FROM users GROUP BY enabled;

SELECT * FROM countries LIMIT 1;

SELECT name FROM countries
  ORDER BY population DESC
  LIMIT 1;

SELECT name FROM countries
  ORDER BY population DESC
  LIMIT 1 OFFSET 1;

SELECT DISTINCT binomial_name FROM animals;

SELECT 
