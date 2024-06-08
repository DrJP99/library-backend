CREATE TABLE book (
	book_id SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	published_dte DATE
);
CREATE TABLE format (
	format_id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);
CREATE TABLE publisher (
	publisher_id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);
CREATE TABLE copy (
	copy_id SERIAL PRIMARY KEY,
	book_id INT REFERENCES book(book_id),
	format_id INT REFERENCES format(format_id),
	publisher_id INT REFERENCES publisher(publisher_id)
);
CREATE TABLE account (
	account_id SERIAL PRIMARY KEY,
	username VARCHAR(12) NOT NULL UNIQUE,
	password VARCHAR(50) NOT NULL,
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	DOB DATE
);
CREATE TABLE checkout (
	checkout_id SERIAL PRIMARY KEY,
	copy_id INT REFERENCES copy(copy_id),
	account_id INT REFERENCES account(account_id),
	checkout_dte TIMESTAMP NOT NULL,
	checkin_dte TIMESTAMP NOT NULL,
	returned BOOLEAN
);
CREATE TABLE category (
	category_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
CREATE TABLE book_category (
	book_category_id SERIAL PRIMARY KEY,
	book_id INT REFERENCES book(book_id),
	category_id INT REFERENCES category(category_id)
);
CREATE TABLE author (
	author_id SERIAL PRIMARY KEY,
	fname VARCHAR(50),
	lname VARCHAR(50),
	penname VARCHAR(50),
	DOB DATE
);
CREATE TABLE author_book (
	author_book_id SERIAL PRIMARY KEY,
	author_id INT REFERENCES author(author_id),
	book_id INT REFERENCES book(book_id)
);