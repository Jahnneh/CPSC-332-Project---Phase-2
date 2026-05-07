-- Insert Categories
INSERT INTO categories (categoryid, categoryname) VALUES
(1, 'Fiction'),
(2, 'Classic'),
(3, 'Literature');

-- Insert Users
INSERT INTO users (userid, name) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Carlos Rivera');

-- Insert Authors
INSERT INTO authors (authorid, authorname) VALUES
(1, 'John Steinbeck'),
(2, 'Ray Bradbury'),
(3, 'Roberto Bolaño'),
(4, 'Harper Lee'),
(5, 'William Golding'),
(6, 'George Orwell'),
(7, 'F. Scott Fitzgerald');

-- Insert Books
INSERT INTO books (bookid, title, categoryid) VALUES
(1, 'Of Mice and Men', 2),
(2, 'Fahrenheit 451', 2),
(3, 'The Savage Detectives', 3),
(4, 'To Kill a Mockingbird', 2),
(5, 'Lord of the Flies', 2),
(6, 'Animal Farm', 2),
(7, 'The Great Gatsby', 2);

-- Insert BookAuthors (M:N relationship)
INSERT INTO book_authors (bookid, authorid) VALUES
(1, 1), -- Of Mice and Men -> John Steinbeck
(2, 2), -- Fahrenheit 451 -> Ray Bradbury
(3, 3), -- The Savage Detectives -> Roberto Bolaño
(4, 4), -- To Kill a Mockingbird -> Harper Lee
(5, 5), -- Lord of the Flies -> William Golding
(6, 6), -- Animal Farm -> George Orwell
(7, 7); -- The Great Gatsby -> F. Scott Fitzgerald

-- Insert Loans
INSERT INTO loans (loanid, duedate, userid, bookid) VALUES
(1, '2026-04-10', 1, 1),
(2, '2026-04-10', 1, 2),
(3, '2026-04-10', 1, 3),
(4, '2026-04-10', 1, 4),
(5, '2026-04-10', 1, 5),

(6, '2026-04-12', 2, 2),

(7, '2026-04-15', 3, 3);

-- Insert Holds
INSERT INTO holds (holdid, holddate, userid, bookid) VALUES
(1, '2026-04-01', 2, 1),
(2, '2026-04-02', 3, 4);

-- Insert Fines
INSERT INTO fines (fineid, amount, loanid) VALUES
(1, 5.00, 1),
(2, 2.50, 2);