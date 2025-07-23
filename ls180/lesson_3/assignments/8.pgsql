-- 1. Write an SQL statement to add data to 'calls'
INSERT INTO calls ("when", duration, contact_id) -- delimit identifiers with double quotes ("")
  VALUES ('2016-01-08 14:47:00', 632, 6);

-- 2. Write an SQL statement that returns the call times, duration and first names of all calls that were NOT to William Swift
SELECT calls."when", calls.duration, contacts.first_name
  FROM calls
  INNER JOIN contacts ON contacts.id = calls.contact_id
  WHERE (contacts.first_name || ' ' || contacts.last_name) <> 'William Swift'; -- || is string concatination

-- 3. Write an SQL statement that adds more data to 'calls' and 'contacts'
INSERT INTO contacts (first_name, last_name, number)
  VALUES ('Merve', 'Elk', 6343511126),
         ('Sawa', 'Fyodorov', 6125594874);

INSERT INTO calls ("when", duration, contact_id)
  VALUES ('2016-01-17 11:52:00', 175, 26),
         ('2016-01-18 21:22:00', 79, 27);

-- 4. Add a constraint to 'contacts' that prevents duplicate values in 'numbers' column
ALTER TABLE contacts
  ADD CONSTRAINT unique_numbers UNIQUE (number);

-- 5. Write an SQL statement that attempts to add a contact with a duplicate number. What's the error?
INSERT INTO contacts (first_name, last_name, number)
  VALUES ('Bob', 'Smith', 7204890809);
-- ERROR:  duplicate key value violates unique constraint "unique_numbers"
-- DETAIL:  Key (number)=(7204890809) already exists.

-- 6. Why does 'when' need to be in double quotes?
-- A: 'WHEN' is a reserved keyword in SQL. In order to reference a column name with the word 'when' we need to delimit it with double quotes.

-- 7. Draw a conceptual-level entity-relationship diagram for the data
-- (see drawio)