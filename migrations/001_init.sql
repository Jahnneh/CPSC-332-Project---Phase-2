CREATE TABLE users (
    userid INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE categories (
    categoryid INT PRIMARY KEY,
    categoryname VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    bookid INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    categoryid INT NOT NULL,
    FOREIGN KEY (categoryid) REFERENCES categories(categoryid)
);

CREATE TABLE authors (
    authorid INT PRIMARY KEY,
    authorname VARCHAR(255) NOT NULL
);

CREATE TABLE book_authors (
    bookid INT NOT NULL,
    authorid INT NOT NULL,
    PRIMARY KEY (bookid, authorid),
    FOREIGN KEY (bookid) REFERENCES books(bookid),
    FOREIGN KEY (authorid) REFERENCES authors(authorid)
);

CREATE TABLE loans (
    loanid INT PRIMARY KEY,
    duedate DATE NOT NULL,
    userid INT NOT NULL,
    bookid INT NOT NULL,
    FOREIGN KEY (userid) REFERENCES users(userid),
    FOREIGN KEY (bookid) REFERENCES books(bookid)
);

CREATE TABLE holds (
    holdid INT PRIMARY KEY,
    holddate DATE NOT NULL,
    userid INT NOT NULL,
    bookid INT NOT NULL,
    FOREIGN KEY (userid) REFERENCES users(userid),
    FOREIGN KEY (bookid) REFERENCES books(bookid)
);

CREATE TABLE fines (
    fineid INT PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    loanid INT NOT NULL,
    FOREIGN KEY (loanid) REFERENCES loans(loanid)
);