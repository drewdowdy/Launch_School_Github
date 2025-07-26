-- 1.

CREATE DATABASE workshop;

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT current_timestamp 
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number int UNIQUE NOT NULL,
  device_id int REFERENCES devices (id)
);

-- 2.

INSERT INTO devices (name)
  VALUES ('Accelerometer'), ('Gyroscope');

INSERT INTO parts (part_number, device_id)
  VALUES (12, 1),
         (14, 1),
         (16, 1),
         (31, 2),
         (33, 2),
         (35, 2),
         (37, 2),
         (39, 2);

INSERT INTO parts (part_number)
  VALUES (50), (54), (58);

-- 3.

SELECT devices.name, parts.part_number
  FROM devices
  INNER JOIN parts ON devices.id = parts.device_id;

-- 4.

SELECT * FROM parts
  WHERE part_number::TEXT LIKE '3%';

-- 5. 

SELECT devices.name, count(parts.id) AS number_of_parts
  FROM devices
  INNER JOIN parts ON devices.id = parts.device_id
  GROUP BY devices.name;

-- 6.

SELECT devices.name, count(parts.id) AS number_of_parts
  FROM devices
  INNER JOIN parts ON devices.id = parts.device_id
  GROUP BY devices.name
  ORDER BY devices.name DESC;

-- 7. 

SELECT part_number, device_id
  FROM parts
  WHERE device_id IS NOT NULL;

SELECT part_number, device_id
  FROM parts
  WHERE device_id IS NULL;

-- 8.

INSERT INTO devices (name)
  VALUES ('Magnetometer');

INSERT INTO parts (part_number, device_id)
  VALUES (42, 3);

SELECT name AS oldest_device
  FROM devices
  ORDER BY created_at ASC
  LIMIT 1;

-- returns all devices with oldest timestamp
SELECT name AS oldest_device 
  FROM devices
  WHERE created_at = (SELECT MIN(created_at) FROM devices);

-- 9.

UPDATE parts
  SET device_id = 1
  WHERE part_number = 37 OR part_number = 39;

UPDATE parts
  SET device_id = 2
  WHERE part_number = (SELECT min(part_number) FROM parts) -- use a subquery

-- 10. 
  
DELETE FROM parts WHERE device_id = 1;            -- must delete parts FIRST
DELETE FROM devices WHERE name = 'Accelerometer'; -- then delete device SECOND

-- We can add a 'DELETE ON CASCADE` constraint when we set up the 'parts' table.
-- Then, when a device is deleted, the related parts are also deleted.