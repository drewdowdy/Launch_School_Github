CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount numeric(6,2) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL DEFAULT current_date 
);

/*
1. Largest value for `amount`?

INSERT INTO expenses (amount, memo)
  VALUES (9999.99, 'largest amount');
*/

/*
2. Smallest value for `amount`?

INSERT INTO expenses (amount, memo)
  VALUES (-9999.99, 'smallest amount');
*/

-- 3. Add check so that `amount` only has a positive value

ALTER TABLE expenses
  ADD CONSTRAINT positive_amount
    CHECK (amount > 0);

-- INSERT INTO expenses (amount, memo)
-- VALUES 
-- (14.56, 'Pencils'),
-- (3.29, 'Coffee'),
-- (49.99, 'Text Editor');