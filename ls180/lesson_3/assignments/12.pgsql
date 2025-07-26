-- 1. Add NOT NULL and ON DELETE CASCADE constraints to 'books_categories'

ALTER TABLE books_categories
  ALTER COLUMN book_id SET NOT NULL,
  ALTER COLUMN category_id SET NOT NULL;

ALTER TABLE books_categories
  DROP CONSTRAINT "books_categories_book_id_fkey", 
  DROP CONSTRAINT "books_categories_category_id_fkey",
  ADD FOREIGN KEY (book_id) references books(id) ON DELETE CASCADE,
  ADD FOREIGN KEY (category_id) references categories(id) ON DELETE CASCADE;

-- 2. Select the book id, author and categories of all books

SELECT books.id, books.author, string_agg(categories.name, ', ') AS categories
  FROM books
    INNER JOIN books_categories ON books.id = books_categories.book_id 
    INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY books.id
  ORDER BY books.id; 

-- 3. Insert some books with varying categories

ALTER TABLE books ALTER COLUMN title TYPE text;

INSERT INTO books (title, author)
  VALUES ('Sally Ride: America''s First Woman in Space', 'Lynn Sherr'),
         ('Jane Eyre', 'Charlotte Brontë'),
         ('Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');

INSERT INTO categories (name)
  VALUES ('Space Exploration'), ('Cookbook'), ('South Asia');

INSERT INTO books_categories (book_id, category_id)
  VALUES (4, 5), (4, 1), (4, 7),
         (5, 2), (5, 4),
         (6, 8), (6, 1), (6, 9);

-- 4. Add a UNIQUE constraint to 'book_id' and 'category_id' in the 'books_categories' table

ALTER TABLE books_categories
  ADD UNIQUE (book_id, category_id);

-- 5. Return the category name, number of books in that category, and 

SELECT categories.name, count(books.id) AS book_count, string_agg(books.title, ', ') AS book_titles
  FROM books
    INNER JOIN books_categories ON books.id = books_categories.book_id
    INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY categories.name
  ORDER BY categories.name;


