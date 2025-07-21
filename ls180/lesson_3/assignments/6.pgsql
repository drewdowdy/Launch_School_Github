-- 1. Import the sql file 'import.sql' to the 'ls_book' database
-- psql -d ls_book < import.sql

-- 2. Determine how many tickets have been sold
SELECT count(*) from tickets;

-- 3. 
SELECT count(DISTINCT customer_id) FROM tickets;

-- 4. Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events (use JOIN)
SELECT ROUND( count(DISTINCT tickets.customer_id)
            / count(DISTINCT customers.id)::decimal * 100,
            2)
       AS percent
  FROM customers
  LEFT OUTER JOIN tickets
    ON tickets.customer_id = customers.id;

-- 5. Write a query that returns the name of all events and how many tickets were sold per event in order of popularity
SELECT e.name, count(t.id) AS popularity
  FROM events AS e
  LEFT OUTER JOIN tickets AS t
    ON e.id = t.event_id
  GROUP BY e.name 
  ORDER BY popularity DESC;

-- 6. Write a query that returns the id and email address of all customers that have attended 3 events
SELECT c.id, c.email, count(DISTINCT t.event_id)
  FROM customers AS c
  INNER JOIN tickets AS t
    ON c.id = t.customer_id
  GROUP BY c.id
  HAVING count(DISTINCT t.event_id) = 3;
  
-- 7. Write a query that returns a report for the customer with the address 'gennaro.rath@mcdermott.co' (event name, starts_at, section, row, seat)
SELECT e.name, 
