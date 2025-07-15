-- residents=# \d people
--                                        Table "public.people"
--      Column     |         Type          | Collation | Nullable |              Default               
-- ----------------+-----------------------+-----------+----------+------------------------------------
--  id             | integer               |           | not null | nextval('people_id_seq'::regclass)
--  given_name     | text                  |           | not null | 
--  middle_initial | text                  |           |          | 
--  surname        | text                  |           | not null | 
--  street         | text                  |           | not null | 
--  city           | text                  |           | not null | 
--  state          | character varying(2)  |           | not null | 
--  zipcode        | character varying(5)  |           | not null | 
--  email          | text                  |           | not null | 
--  username       | text                  |           | not null | 
--  telephone      | character varying(12) |           | not null | 
--  birthday       | date                  |           | not null | 
--  occupation     | text                  |           | not null | 
--  company        | text                  |           |          | 
-- Indexes:
--     "people_pkey" PRIMARY KEY, btree (id)

SELECT state, COUNT(id) FROM people
  GROUP BY state
  ORDER BY count DESC
  LIMIT 10;

SELECT substr(email, strpos(email, '@') + 1) AS domain, COUNT(id) FROM people
  GROUP BY domain
  ORDER BY count DESC;

DELETE FROM people
  WHERE id = 3399;

DELETE FROM people
  WHERE state = 'CA';

UPDATE people
  SET given_name = upper(given_name)
  WHERE email LIKE '%teleworm.us';

DELETE FROM people;
