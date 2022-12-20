USE kidding;
-- CREATE DATABASE kidding;

CREATE TABLE IF NOT EXISTS users (
   id_user SERIAL,
   custom_data JSON
);

INSERT INTO users (custom_data) VALUES ('{"name": "John", "age": 25}');

-- transaction
BEGIN;
  INSERT INTO users (custom_data) VALUES ('{"name": "Anne", "age": 25}');
  INSERT INTO users (custom_data) VALUES (true);
COMMIT;

BEGIN;
  CREATE TABLE IF NOT EXISTS authors (
    id_author SERIAL PRIMARY KEY,
    nm_author VARCHAR(30) UNIQUE
  );

  CREATE TABLE IF NOT EXISTS posts (
    id_post SERIAL,
    creator VARCHAR(30) REFERENCES authors(nm_author) NOT NULL,
    content TEXT NOT NULL
  );
SAVEPOINT tables;
  INSERT INTO authors (nm_author) VALUES ('James');
  INSERT INTO posts (creator, content) VALUES ('James', 'Lorem ipsum');
COMMIT;

-- PREPARE creates a prepared statement.
--   A prepared statement is a server-side object that can be used to optimize performance. 
PREPARE author_insert (VARCHAR) AS
  INSERT INTO authors (nm_author) VALUES($1);

BEGIN;
  EXECUTE author_insert ('Jonas');
  EXECUTE author_insert ('Custodio');
  EXECUTE author_insert ('Ambrosio');
  EXECUTE author_insert ('Guilherme');
COMMIT;
