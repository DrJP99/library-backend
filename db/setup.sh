#! /bin/bash

# Setup database

DIR=$(dirname "$0")
source $DIR/.env

psql postgresql://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT << EOF
DROP DATABASE library;
CREATE DATABASE library;
\c library
\i $DIR/setup.sql
\copy book FROM '$DIR/data/book.csv' DELIMITER ',' CSV HEADER
\copy format FROM '$DIR/data/format.csv' DELIMITER ',' CSV HEADER
\copy publisher FROM '$DIR/data/publisher.csv' DELIMITER ',' CSV HEADER
\copy copy FROM '$DIR/data/copy.csv' DELIMITER ',' CSV HEADER
\copy account FROM '$DIR/data/account.csv' DELIMITER ',' CSV HEADER
\copy checkout FROM '$DIR/data/checkout.csv' DELIMITER ',' CSV HEADER
\copy category FROM '$DIR/data/category.csv' DELIMITER ',' CSV HEADER
\copy book_category FROM '$DIR/data/book_category.csv' DELIMITER ',' CSV HEADER
\copy author FROM '$DIR/data/author.csv' DELIMITER ',' CSV HEADER
\copy author_book FROM '$DIR/data/author_book.csv' DELIMITER ',' CSV HEADER
EOF