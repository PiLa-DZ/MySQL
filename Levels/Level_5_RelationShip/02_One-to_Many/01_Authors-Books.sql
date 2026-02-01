-- == ======================================================
-- (Authors and Books)
-- The Rule:
-- 1. One Author can write Many Books.
-- 2. One Book belongs to Only One Author.
-- == ======================================================

-- -- Step 1 Create ----------------------------------------
DROP TABLE IF EXISTS books, authors;
CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    published_year YEAR,
    author_id INT, -- The Foreign Key
    -- Defining the Relationship
    CONSTRAINT fk_book_author FOREIGN KEY (author_id) 
    REFERENCES authors(id) ON DELETE CASCADE -- If author is deleted, delete their books
);
INSERT INTO authors (name) VALUES ('Robert Greene'), ('Napoleon Hill');
-- Robert Greene (ID: 1) has many books
INSERT INTO books (title, published_year, author_id) VALUES 
('48 Laws of Power', 1998, 1),
('Mastery', 2012, 1),
('The Art of Seduction', 2001, 1);
-- Napoleon Hill (ID: 2)
INSERT INTO books (title, published_year, author_id) VALUES 
('Think and Grow Rich', 1937, 2);

-- -- Step 2 Querying the Relationship ---------------------
-- Find all books and their authors
SELECT 
    authors.name AS author_name, 
    books.title AS book_title
FROM authors
JOIN books ON authors.id = books.author_id;
-- +---------------+----------------------+
-- | author_name   | book_title           |
-- +---------------+----------------------+
-- | Robert Greene | 48 Laws of Power     |
-- | Robert Greene | Mastery              |
-- | Robert Greene | The Art of Seduction |
-- | Napoleon Hill | Think and Grow Rich  |
-- +---------------+----------------------+
