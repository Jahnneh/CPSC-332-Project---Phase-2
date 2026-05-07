-- List all books with their categories and authors
SELECT
    b.bookid,
    b.title,
    c.categoryname,
    a.authorname
FROM books b
JOIN categories c ON b.categoryid = c.categoryid
JOIN book_authors ba ON b.bookid = ba.bookid
JOIN authors a ON ba.authorid = a.authorid;

-- Show all loans with user and book information
SELECT
    l.loanid,
    u.name AS user_name,
    b.title AS book_title,
    l.duedate
FROM loans l
JOIN users u ON l.userid = u.userid
JOIN books b ON l.bookid = b.bookid;

-- Show all holds with user and book information
SELECT
    h.holdid,
    u.name AS user_name,
    b.title AS book_title,
    h.holddate
FROM holds h
JOIN users u ON h.userid = u.userid
JOIN books b ON h.bookid = b.bookid;

-- Show all fines with user, loan, and book information
SELECT
    f.fineid,
    u.name AS user_name,
    b.title AS book_title,
    f.amount,
    l.duedate
FROM fines f
JOIN loans l ON f.loanid = l.loanid
JOIN users u ON l.userid = u.userid
JOIN books b ON l.bookid = b.bookid;

-- Count how many books each user has borrowed
SELECT
    u.userid,
    u.name,
    COUNT(l.loanid) AS total_loans
FROM users u
LEFT JOIN loans l ON u.userid = l.userid
GROUP BY u.userid, u.name;

-- Count how many books are in each category
SELECT
    c.categoryid,
    c.categoryname,
    COUNT(b.bookid) AS total_books
FROM categories c
LEFT JOIN books b ON c.categoryid = b.categoryid
GROUP BY c.categoryid, c.categoryname;