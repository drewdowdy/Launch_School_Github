-- 1. Import the sql file 'import.sql' to the 'ls_book' database
-- psql -d ls_book < import.sql

-- 2. Determine how many tickets have been sold
SELECT count(*) from tickets;

-- 3. 
SELECT count(DISTINCT customer_id) FROM tickets;

-- 4. Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events (use JOIN)

