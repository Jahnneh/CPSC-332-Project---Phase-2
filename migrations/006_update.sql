-- Update a user's name
UPDATE users
SET name = 'Alice Thompson'
WHERE userid = 1;

-- Update a category name
UPDATE categories
SET categoryname = 'Classic Literature'
WHERE categoryid = 2;

-- Update a book title
UPDATE books
SET title = 'Of Mice and Men'
WHERE bookid = 1;

-- Change a book's category
UPDATE books
SET categoryid = 3
WHERE bookid = 3;

-- Extend a loan due date
UPDATE loans
SET duedate = '2026-05-15'
WHERE loanid = 1;

-- Increase a fine amount
UPDATE fines
SET amount = amount + 1.50
WHERE fineid = 1;