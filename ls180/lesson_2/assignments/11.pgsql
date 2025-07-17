-- 1. Make a new sequence called 'counter'
CREATE SEQUENCE counter;

-- 2. Retrieve the next value from 'counter'
SELECT nextval('counter');

-- 3. Remove the sequence called 'counter'
DROP SEQUENCE counter;

-- 4. Is it possible for a SEQUENCE to count only even number? : Yes
-- > The optional clause INCREMENT BY increment specifies which value is added to the current sequence value to create a new value. A positive value will make an ascending sequence, a negative one a descending sequence. The default value is 1.
CREATE SEQUENCE even_counter INCREMENT BY 2 MINVALUE 2;
SELECT nextval('even_counter');
--  nextval
-- ---------
--        2
-- (1 row)
SELECT nextval('even_counter');
--  nextval
-- ---------
--        4
-- (1 row)

-- 5. What will be the name of the sequence created by this SQL statement be?
CREATE TABLE regions (id serial PRIMARY KEY, name text, area integer);
-- regions_id_seq

-- 6. Write an SQL statment that will add an auto incrementing integer primary key to the 'films' table
ALTER TABLE films
  ADD COLUMN id serial PRIMARY KEY;

-- 7. What error appears if you try to update a row with an id value that already exists?
-- > We get an error that the column already exists 
UPDATE films
