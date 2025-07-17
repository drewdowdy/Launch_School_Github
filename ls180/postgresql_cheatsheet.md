# PostgreSQL Cheatsheet

This is a document to quick reference various SQL key words and their function in statements.

## Meta-commands (psql console)

Meta-commands are run from the `psql` console and perform various functions in order to interact with SQL databases and tables.

| Meta-command | Effect | Example |
|-|-|-|
| `\c $dbname` | **Connect** to database `$dbname`   | `\c my_database` |
| `\d` | **Describe** available relations (tables) |
| `\d $name` | **Describe** relation `$name` | `\d users` |
| `\l` | **List** all of the available databases |  |
| `\?` | List of console commands and options |
| `\h` | List of available SQL syntax **help** topics |
| `\h $topic` | SQL syntax help on syntax for `$topic` | `\h INSERT` |
| `\q` | **Quits** the `psql` console and returns to the terminal |
| `\i ~/directory/file_to_import.sql` | **Imports** `file_to_import.sql` into the connected database |

## Wrapper Functions

Wrapper functions essentially act like shortcuts to common SQL statements. They are useful for common tasks but don't allow for specificity.

**These functions are used from the terminal** and not the psql console.

| Wrapper Function | Effect | Equivilent SQL |
|-|-|-|
| `psql -d $dbname` | Starts a `psql` session and connects to `$dbname` |
| `createdb $dbname` | Creates the database `$dbname` | `CREATE DATABASE $dbname;` |
| `dropdb $dbname` | Removes the database `$dbname` | `DROP DATABASE $dbname;` |
| `psql -d $dbname < file_to_import.sql` | Loads `file_to_import.sql` file into `$dbname` database |  |

If you are in the terminal and put in the command `psql`, it will open the psql console and connect to the database that is the same as the username.

Otherwise, you should include the name of the database you want to connect to.

```
% psql                (connects to database with the same name as the user)
% psql -d my_database (connects to "my_database")
```

## Documentation Key

> `[]` indicates optional information. 
> `[, ... ]` indicates that one or more of the preceeding item can be in a comma separated list
> `[ ... ]` indicates that one or more of the preceeding item can be included (no commas)
> `{ a | b }` indicates that one of `a` or `b` is necessary

## Making a New Table

### `CREATE TABLE`

Create a new table with columns (and their data types) with the constraints of each type.

```sql
CREATE TABLE table_name (
  column_name column_data_type [column_constraint[ ... ]][, ...]
  table_constraints [, ...]
);
```

Example

```sql
CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25) UNIQUE,
  color varchar(25) NOT NULL,
  height decimal(4,2) NOT NULL,
  CHECK (length(name) > 25)
);
```

#### Column Data Types

| Column Data Type | Description | Example |
|-|-|-|
| `serial` | Integers that are auto-incrementing and cannot contian a `NULL` value. Used for an identifier column. |  |
| `char(num)` | Strings up to `num` characters in length. If a string less than `num` characters is stored, the remaining length is filled with spaces. | `char(10)` --> `'hello_____'` |
| `varchar(num)` | Strings up to `num` characters in length. If a string less than `num` characters is stored, the remaining length isn't used. | `varchar(10)` --> `'hello'` |
| `boolean` | True or false. Displayed as `t` and `f` | `t` |
| `int` | Any whole number from -2,147,483,648 and 2,147,483,647 | `54321` |
| `decimal(precision, scale)` | Any decimal number; `precision` --> total number of digits in the entire number on both sides of decimal `scale` --> number of digits to the right of the decimal | `decimal(5,3)` --> `00.000` |
| `timestamp` | Both the simple date and time in `YYYY-MM-DD HH:MM:SS` format | `1999-01-08 04:05:06` |
| `date` | Date without time `YYYY-MM-DD` | `1995-01-23` |

#### Column Constraints

| Column Constraint | Effect |
|-|-|
| `UNIQUE` | Prevents any duplicate values |
| `NOT NULL` | Prevents any `NULL` values |
| `DEFAULT value` | If no value is given, then `value` is set |
| `PRIMARY KEY` | Combines `NOT NULL` and `UNIQUE` constraints |
| `CHECK (expression)`  | Checks that `expression` evaluates as true (can be table constraint too) |

## Modifying a Table

We use an `ALTER` statement to update the schema of the table. 

### `ALTER TABLE`

```sql
ALTER TABLE table_name
  action [, ... ];

where action is one of:

  RENAME TO new_table_name
  RENAME COLUMN column_name TO new_column_name
  RENAME CONSTRAINT constraint_name to new_constraint_name

  ADD [ COLUMN ] column_name data_type [ column_constraint ]
  ADD CONSTRAINT [ table_constraint_name ] table_constraint_clause

  DROP [ COLUMN ] column_name
  DROP CONSTRAINT constraint_name

  ALTER [ COLUMN ] column_name TYPE data_type
  ALTER [ COLUMN ] column_name SET DEFAULT expression
  ALTER [ COLUMN ] column_name DROP DEFAULT
  ALTER [ COLUMN ] column_name { SET | DROP } NOT NULL
```

Examples

```sql
ALTER TABLE films RENAME TO movies;

ALTER TABLE movies RENAME COLUMN director TO producer;

ALTER TABLE movies
  ADD COLUMN duration int NOT NULL;

ALTER TABLE movies
  ADD CONSTRAINT title_length CHECK (length(title) >= 1);

ALTER TABLE movies DROP CONSTRAINT title_length;
```

#### Table Constraints



### `DROP TABLE`

Using a `DROP TABLE` statement permanately removes the table or tables from the database.

```sql
DROP TABLE table_name [, ... ] [ CASCADE ];
```

> `CASCADE` means that any tables that depend on that table are automatically dropped as well

## Adding Rows to Table

### `INSERT INTO`

Use `INSERT INTO` to add new rows of data to the table.

```sql
INSERT INTO table_name [ ( column_name [, ... ] ) ]
  VALUES ( expression [, ... ] ) [, ... ];
```

Examples

```sql
INSERT INTO pets (name, species, color, height)
  VALUES ('Bob', 'cat', 'gray', 10),
         ('Socks', 'cat', 'black and white', 9),
         ('Rex', 'dog', 'brown', 15);

INSERT INTO pets
  VALUES ('Snickers', 'dog', 'light brown', 20);
```

If no columns are specified, then all columns must have a value.

## Selecting Rows from a Table

### `SELECT`

```sql
SELECT [ DISTINCT ] [ * | expression [ AS output_name ] ]
  FROM table_name
  WHERE condition [ { AND | OR } another_condition [, ... ] ]
  GROUP BY grouping_element [, ... ]
  ORDER BY expression [ ASC | DESC ]
  LIMIT count
  OFFSET count;
```

Examples

```sql
SELECT * FROM films;

SELECT title FROM films
  WHERE budget <= 1000000;

SELECT title, budget FROM films
  ORDER BY budget DESC
  LIMIT 10;

SELECT director, count(id) AS movie_number FROM films
  GROUP BY director;
```

In `GROUP BY` statements, all columns **MUST** be either be included in the statement OR be the result of an **aggregate function**.

### Comparison Operators

Comparison operators are used to compare values. Often they are numeric but can be other data types too.

| Operator | Descriptioin |
|-|-|
| `<` | less than |
| `>` | greater than |
| `<=` | less than or equal to |
| `>=` | greater than or equal to |
| `=` | equal |
| `<>` or `!=` | not equal |

> Ordinary comparison operators yield null (signifying "unknown"), not true or false, when either input is null.

### Comparison Predicates

These are key words that act exactly like operators but have a special syntax.

| Comparison Predicate | Example | Equivilant | Note |
|-|-|-|-|
| `BETWEEN` | `a BETWEEN x AND y` | `a >= x AND a <= y` |
| `NOT BETWEEN` | `a NOT BETWEEN x AND y` | `a < x OR a > y` |
| `IS DISTINCT FROM` | `a IS DISTINCT FROM b` | `a <> b` | Used to handle `NULL` values |
| `IS NOT DISTINCT FROM` | `a IS NOT DISTINCT FROM b` | `a = b` | Used to handle `NULL` values |
| `IS NULL` | `expression IS NULL` | `expression = NULL` | Used to handle `NULL` values |
| `IS NOT NULL` | `expression IS NOT NULL` | `expression <> NULL` | Used to handle `NULL` values |

### Logical Operators

| Logical Operator | Notes |
|-|-|
| `AND` |  |
| `OR` |  |
| `NOT` |  |

### String Matching

Use `LIKE` to match strings to patters.

The percent sign `%` is used to match patterns at the start, end, or anywhere in the string

| Pattern | Description | Example |
|-|-|-|
| `pattern%` | Match from the start of string | `'billybob@gmail.com' LIKE 'billybob%'` |
| `%pattern` | Match to the end of the string | `'billybob@gmail.com' LIKE '%gmail.com'` |
| `%pattern%` | Match anywhere in the string | `'billybob@gmail.com' LIKE '%bob%'` |

| Expression Syntax | Effect | Example |
|-|-|-|
| `string LIKE pattern` | Returns true if `string` matches the pattern | `'abc' LIKE '%a'` |
| `string NOT LIKE pattern` | Returns true if `string` does not match the pattern | `'abc' NOT LIKE 'a%'` |

### Functions

Functions are commands in the RDBMS that perform certain operations on fields or data. Some are transformative and others simply return information.

There are three main types of functions; string, date/time, and aggregate.

| Function | Type | Example | Notes |
|-|-|-|-|
| `length(string)` | String | `length('jose')` --> `4` | Returns the number of characters in `string`. Can be used in `SELECT` and `WHERE` |
| `trim([leading \| trailing \| both] [characters] from string)` | String | `trim(both 'xyz' from 'yxTomxx')` --> `Tom` | Removes the longest string containing only characters from `characters` from the start, end or both of `string` |
| `string \|\| string` | String | `'hello'\|\|'world'` --> `helloworld` | String concatination |
| `lower(string)` | String | `lower('TOM')` --> `tom` | Convert string to lower case |
| `upper(string)` | String | `upper('tom')` --> `TOM` | Convert string to upper case |
| `date_part(text, timestamp)` | Date/Time | `date_part('hour', timestamp '2001-02-16 20:38:40')` --> `20` | Returns the specified part of the timestamp. |
| `age(timestamp)` | Date/Time | `age(timestamp '1957-06-13')` --> `43 years 8 mons 3 days` | Returns the subtraction from `current_date` (at midnight) |
| `count(expression)` | Aggregate | `SELECT count(id) FROM users;` | Returns an integer of the sum of the number of rows in `id` column |
| `sum(expression)` | Aggregate | `SELECT sum(item_cost) FROM orders;` | Returns an integer of the sum of all the integer values in `item_cost` column |
| `min(expression)` | Aggregate | `SELECT min(budget) FROM films;` | maximum value of expression across all non-null input values |
| `max(expression)` | Aggregate | `SELECT max(budget) FROM films;` | minimum value of expression across all non-null input values |
| `avg(expression)` | Aggregate | `SELECT avg(budget) FROM films;` | the average (arithmetic mean) of all non-null input values |

> `date_part`'s `text` field can be:
> - `century`
> - `day`
> - `decade`
> - `dow`(day of the week)
> - `doy`(day of the year)
> - `hour`
> - `microseconds`
> - `milliseconds`
> - `minute`
> - `month`
> - `quarter`
> - `second`
> - `week`
> - `year`
> - etc.
>

## Updating Rows in a Table

### `UPDATE`

Use `UPDATE` statements to change the data in rows within the table.

```sql
UPDATE table_name
  SET column_name = { expression | DEFAULT | NULL } [, ... ]
  [ WHERE condition ];
```

> Without a `WHERE` statement, **all rows** in the column **will be set** to the value of the expression.

### `DELETE FROM`

Use `DELETE FROM` statements to remove entire rows from the table.

```sql
DELETE FROM table_name
  [ WHERE condition ];
```

> Without a `WHERE` statement, **all rows** will be removed from the table.


