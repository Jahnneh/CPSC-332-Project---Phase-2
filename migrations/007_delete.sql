INSERT INTO users (userid, name)
VALUES (99, 'Temporary User');

INSERT INTO categories (categoryid, categoryname)
VALUES (99, 'Temporary Category');

INSERT INTO books (bookid, title, categoryid)
VALUES (99, 'Temporary Book', 99);

INSERT INTO authors (authorid, authorname)
VALUES (99, 'Temporary Author');

INSERT INTO book_authors (bookid, authorid)
VALUES (99, 99);

INSERT INTO loans (loanid, duedate, userid, bookid)
VALUES (99, '2026-06-01', 99, 99);

INSERT INTO holds (holdid, holddate, userid, bookid)
VALUES (99, '2026-05-01', 99, 99);

INSERT INTO fines (fineid, amount, loanid)
VALUES (99, 3.00, 99);

-- Delete a fine
DELETE FROM fines
WHERE fineid = 99;

-- Delete a hold
DELETE FROM holds
WHERE holdid = 99;

-- Delete a loan
DELETE FROM loans
WHERE loanid = 99;

-- Delete a book-author relationship
DELETE FROM book_authors
WHERE bookid = 99
  AND authorid = 99;

-- Delete a temporary book
DELETE FROM books
WHERE bookid = 99;

-- Delete a temporary author
DELETE FROM authors
WHERE authorid = 99;