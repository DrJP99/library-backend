#! /bin/bash

# Setup database

source `pwd`/db/.env

psql postgresql://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT << EOF
DROP DATABASE library;
CREATE DATABASE library;
\c library
\i `pwd`/db/setup.sql
EOF