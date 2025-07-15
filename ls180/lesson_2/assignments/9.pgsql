-- Operations on NULL will always return NULL

-- Add a default value of 'unassigned' to the 'department' row
ALTER TABLE employees
  ALTER COLUMN department
    SET DEFAULT 'unassigned';

-- Change all instances where department value is NULL to 'unassigned'
UPDATE employees
  SET department = 'unassigned'
  WHERE department IS NULL;

-- Add constraint that all new data in the 'department' column can't be NULL
ALTER TABLE employees
  ALTER COLUMN department
  SET NOT NULL; -- SET is used to set column constraints

CREATE TABLE temperatures (
  date date NOT NULL,
  low int NOT NULL,
  high int NOT NULL
);

INSERT INTO temperatures
  VALUES ( '2016-03-01', 34, 43),
         ( '2016-03-02', 32, 44),
         ( '2016-03-03', 31, 47),
         ( '2016-03-04', 33, 42),
         ( '2016-03-05', 39, 46),
         ( '2016-03-06', 32, 43),
         ( '2016-03-07', 29, 32),
         ( '2016-03-08', 23, 31),
         ( '2016-03-09', 17, 28);

SELECT date, ROUND((low + high) / 2, 1) AS average
  WHERE date BETWEEN '2016-03-02' AND '2016-03-08';
-- WHERE date >= '2016-03-02' AND date <= '2016-03-08'; (same)

ALTER TABLE temperatures
  ADD COLUMN rainfall int DEFAULT 0;

UPDATE rainfall
  SET rainfall = ((low + high) / 2) - 35
  WHERE ((low + high) / 2) > 35;

ALTER TABLE temperatures
  ALTER COLUMN rainfall
    TYPE numeric(4,3)

UPDATE rainfall
  SET rainfall = rainfall * 0.039;

ALTER TABLE temperatures
  RENAME TO weather;

-- \d weather
