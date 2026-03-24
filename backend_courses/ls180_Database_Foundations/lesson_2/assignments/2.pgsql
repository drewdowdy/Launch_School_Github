-- SQL is a specialized language used to interacting with a relational database.

-- DDL (data definition language) controls how the schema is definied
-- DML (data manipulation language) controls the values of data
-- DCL (data control language) controls who has access to the database

SELECT 'canoe';

SELECT 'hello'||'world'; -- || is used to concatinate strings

--   ?column?  
-- ------------
--  helloworld
-- (1 row)

SELECT lower('hEy ThErE'); -- lower() makes the string lowercase

--    lower   
-- -----------
--  hey there
-- (1 row)

-- The PSQL console displays true and false values as 't' and 'f' respectively.

SELECT trunc(4 * pi() * 26.3^2); -- we can use math inside a SQL statement
                                 -- trunc() will truncate the integer (toward zero)

--  trunc 
-- -------
--   8692
-- (1 row)

/*
If a database is like a warehouse, then SQL is like workers in a warehouse that can interact with the things in said warehouse. 

And by that logic, DDL (data definition language) is like a manager that determines how the warehouse should be setup and organized. 

DML (data manipulation language) is like the worker that puts new things in the warehouse, changes things in the warehouse, or removes things from the warehouse. 

And then DCL (data control language) would be like a security guard outside of the warehouse that determines who can and can't come inside.
*/
