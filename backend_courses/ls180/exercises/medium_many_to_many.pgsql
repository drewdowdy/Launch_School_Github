-- 1. Set Up Database

CREATE DATABASE billing;

\c billing

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) NOT NULL CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL CHECK (price >= 0.00)
);

INSERT INTO customers (name, payment_token)
  VALUES ('Pat Johnson', 'XHGOAHEQ'),
         ('Nancy Monreal', 'JKWQPJKL'),
         ('Lynn Blake', 'KLZXWEEE'),
         ('Chen Ke-Hua', 'KWETYCVX'),
         ('Scott Lakso', 'UUEAPQPS'),
         ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
  VALUES ('Unix Hosting', 5.95),
         ('DNS', 4.95),
         ('Whois Registration', 1.95),
         ('High Bandwidth', 15.00),
         ('Business Support', 250.00),
         ('Dedicated Hosting', 50.00),
         ('Bulk Email', 250.00),
         ('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  service_id int 
    REFERENCES services (id)
    NOT NULL,
  customer_id int
    REFERENCES customers (id)
    ON DELETE CASCADE
    NOT NULL,
  UNIQUE(customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id)
  VALUES (1, 1), (1, 2), (1, 3),
         (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
         (4, 1), (4, 4),
         (5, 1), (5, 2), (5, 4),
         (6, 1), (6, 6), (6, 7);

-- 2. Get customers with services

SELECT customers.id, customers.name, customers.payment_token
  FROM customers
  INNER JOIN customers_services ON customers.id = customers_services.customer_id
  GROUP BY customers.id;

-- LS ANSWER

SELECT DISTINCT customers.*
    FROM customers
  INNER JOIN customers_services ON customers.id = customers_services.customer_id;

-- 3. Get customers with no services

SELECT DISTINCT customers.*
    FROM customers
      LEFT JOIN customers_services ON customers.id = customers_services.customer_id;
      WHERE service_id IS NULL;

SELECT customers.*, services.*
  FROM customers_services
    FULL JOIN customers ON customers.id = customers_services.customer_id
    FULL JOIN services ON services.id = customers_services.service_id
    WHERE customers_services.id IS NULL;

-- 4. Get services with no customers

SELECT services.description
  FROM customers_services
  RIGHT JOIN services ON services.id = customers_services.service_id
  WHERE customers_services.customer_id IS NULL;

-- 5. Services for each customer

SELECT c.name, string_agg(s.description, ', ') AS services
  FROM customers as c
  LEFT JOIN customers_services ON c.id = customers_services.customer_id
  LEFT JOIN services AS s ON s.id = customers_services.service_id
  GROUP BY c.name;

-- 6. Services with at least 3 customers

SELECT services.description, count(customers_services.customer_id)
  FROM services
  LEFT JOIN customers_services ON services.id = customers_services.service_id
  GROUP BY services.description
  HAVING count(customers_services.customer_id) >= 3;

-- 7. Total gross income

SELECT sum(services.price)
  FROM services
  INNER JOIN customers_services
    ON service_id = services.id;

-- 8. Add new customer

INSERT INTO customers(name, payment_token)
  VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id)
  VALUES (7, 1),
         (7, 2),
         (7, 3);

-- 9. Hypothetically

SELECT sum(services.price)
  FROM services
  INNER JOIN customers_services
    ON service_id = services.id
  WHERE services.price > 100;

SELECT sum(services.price)
  FROM customers
  CROSS JOIN services
  WHERE price > 100;

-- 10. Deleting rows

DELETE FROM customers_services
  WHERE service_id = 7;

DELETE FROM services
  WHERE description = 'Bulk Email';

DELETE FROM customers
  WHERE name = 'Chen Ke-Hua';
