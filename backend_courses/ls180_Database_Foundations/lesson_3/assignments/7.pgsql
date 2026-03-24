-- 1. Import 'orders_products1.sql` into the 'foreign_keys' database
-- % psql -d foreign_keys < orders_products1.sql

-- 2. Update the 'orders' table so that referential integrity is preserved between 'orders' and 'products'
ALTER TABLE orders
  ADD CONSTRAINT orders_products_fkey FOREIGN KEY (product_id) REFERENCES products(id);

-- 3. Insert some data into 'orders'

--  (add 'small bolt' and 'large bolt' to products)
INSERT INTO products (name)
  VALUES ('small bolt'), ('large bolt');

--  (add an order of 10 small bolts, an order of 25 small bolts, and an order of 15 large bolts)
INSERT INTO orders (product_id, quantity)
  VALUES (1, 10), (1, 25), (2, 15);

-- 4. Write an SQL statement that returns the product name and quantity of all orders
SELECT o.quantity, p.name
  FROM products AS p
  INNER JOIN orders AS o
    ON  p.id = o.product_id;

-- 5. Can you write a row into 'orders' without a product id? Write an SQL to prove it.
INSERT INTO orders (quantity)
  VALUES (99);
-- Yes. This SQL statement is executed with no problems.

-- 6. Write an SQL statement to prevent NULL values from being added to 'product_id'.
ALTER TABLE orders
  ALTER COLUMN product_id SET NOT NULL;
-- ERROR:  column "product_id" of relation "orders" contains null values

-- 7. Make any changes to avoid the error message in the previous question.
DELETE FROM orders WHERE product_id IS NULL;

-- 8. Create a new table called 'reviews' that has a primary key that references the 'products' table.
CREATE TABLE reviews (
  id serial,
  body text NOT NULL,
  product_id int REFERENCES products (id)
);

-- 9. Insert some data into the new 'reviews' table
INSERT INTO reviews (product_id, body)
  VALUES (1, 'a little small'),
         (1, 'very round!'),
         (2, 'could have been smaller');

-- 10. Does a foreign key constraint prevent NULL values from being inserted into a column?
-- No. It is possible to add null values into a column that has a foreign key constraint. To acheive that effect, you must use the foreign key constraint in conjunction with a NOT NULL constraint.
