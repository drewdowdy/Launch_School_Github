-- DDL (data definition language) is responsible for defining the schema of databases
CREATE
ALTER
DROP

-- DML (data manipulation language) is responsible for CRUD (create, read, update, delete) operations on data

SELECT
INSERT
UPDATE
DELETE

SELECT column_name FROM my_table;
-- This SQL statement is using DML to read the data in column_name from my_table

CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);
-- This SQL statement is using DDL to create a table called 'things' where 'id', 'item', and 'material' are columns of the table.

CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);
