-- Shows books with their categories and authors
CREATE OR REPLACE VIEW view_books_details AS
SELECT
    b.bookid,
    b.title,
    c.categoryname,
    a.authorname
FROM books b
JOIN categories c
    ON b.categoryid = c.categoryid
JOIN book_authors ba
    ON b.bookid = ba.bookid
JOIN authors a
    ON ba.authorid = a.authorid;