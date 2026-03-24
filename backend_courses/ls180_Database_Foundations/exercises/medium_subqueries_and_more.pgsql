-- 1. Set up the database using \copy

CREATE DATABASE auction;

\c auction

CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6,2) NOT NULL CHECK (initial_price BETWEEN 0.01 AND 1000),
  sales_price numeric(6,2) CHECK (sales_price BETWEEN 0.01 AND 1000)
);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id int NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id int NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount numeric(6,2) CHECK (amount BETWEEN 0.01 AND 1000) NOT NULL
);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders FROM 'Launch_School_Github/ls180/exercises/bidders.csv' WITH HEADER CSV
\copy items FROM 'Launch_School_Github/ls180/exercises/items.csv' WITH HEADER CSV
\copy bids FROM 'Launch_School_Github/ls180/exercises/bids.csv' WITH HEADER CSV

-- 2. Conditional subqueries: IN

SELECT item.name AS "Bid on Items" FROM items
  WHERE items.id IN (SELECT DISTINCT item_id FROM bids);

-- 3. Conditional Subqueries: NOT IN

SELECT item.name AS "Not Bid On" FROM items
  WHERE items.id NOT IN (SELECT DISTINCT item_id FROM bids);

-- 4. Conditional Subqueries: EXISTS

SELECT bidders.name FROM bidders
  WHERE EXISTS (
    SELECT bidder_id FROM bids
    WHERE bids.bidder_id = bidders.id
  );

-- 5. Query from a transient table

SELECT max(bid_counts.count)
  FROM (
  SELECT bidder_id, count(bidder_id) 
    FROM bids
    GROUP BY bidder_id
  ) AS bid_counts;

-- 6. Scalar Subqueries

SELECT name, (
  SELECT count(item_id) FROM bids WHERE items.id = item_id
  )
  FROM items;

SELECT items.name, count(bids.item_id)
  FROM items
  LEFT OUTER JOIN bids ON items.id = item_id
  GROUP BY items.name;

-- 7. Row comparison

SELECT * FROM items
  WHERE ROW('Painting', 100, 250) = ROW(name, initial_price, sales_price);

-- 8. EXPLAIN

EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
--                                 QUERY PLAN                                
-- --------------------------------------------------------------------------
--  Hash Join  (cost=33.38..66.47 rows=635 width=32)
--    Hash Cond: (bidders.id = bids.bidder_id)
--    ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36)
--    ->  Hash  (cost=30.88..30.88 rows=200 width=4)
--          ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4)
--                Group Key: bids.bidder_id
--                ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4)
-- (7 rows)

EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
--                                                      QUERY PLAN                                                      
-- ---------------------------------------------------------------------------------------------------------------------
--  Hash Join  (cost=33.38..66.47 rows=635 width=32) (actual time=0.193..0.202 rows=6 loops=1)
--    Hash Cond: (bidders.id = bids.bidder_id)
--    ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.048..0.050 rows=7 loops=1)
--    ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.128..0.129 rows=6 loops=1)
--          Buckets: 1024  Batches: 1  Memory Usage: 9kB
--          ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.085..0.089 rows=6 loops=1)
--                Group Key: bids.bidder_id
--                Batches: 1  Memory Usage: 40kB
--                ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.041..0.049 rows=26 loops=1)
--  Planning Time: 0.393 ms
--  Execution Time: 0.359 ms
-- (11 rows)

-- 9. Comparing SQL statements

EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;
--                                                   QUERY PLAN                                                   
-- ---------------------------------------------------------------------------------------------------------------
--  Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.353..0.354 rows=1 loops=1)
--    ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.343..0.345 rows=6 loops=1)
--          Group Key: bids.bidder_id
--          Batches: 1  Memory Usage: 40kB
--          ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.011..0.015 rows=26 loops=1)
--  Planning Time: 1.274 ms
--  Execution Time: 0.457 ms
-- (7 rows)

EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;

--                                                      QUERY PLAN                                                      
-- ---------------------------------------------------------------------------------------------------------------------
--  Limit  (cost=35.65..35.65 rows=1 width=12) (actual time=0.071..0.072 rows=1 loops=1)
--    ->  Sort  (cost=35.65..36.15 rows=200 width=12) (actual time=0.070..0.070 rows=1 loops=1)
--          Sort Key: (count(bidder_id)) DESC
--          Sort Method: top-N heapsort  Memory: 25kB
--          ->  HashAggregate  (cost=32.65..34.65 rows=200 width=12) (actual time=0.039..0.041 rows=6 loops=1)
--                Group Key: bidder_id
--                Batches: 1  Memory Usage: 40kB
--                ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.012..0.015 rows=26 loops=1)
--  Planning Time: 0.228 ms
--  Execution Time: 1.325 ms
-- (10 rows)
