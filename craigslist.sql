DROP DATABASE IF EXISTS  craigslist;
CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username VARCHAR(20) UNIQUE NOT NULL,
  password VARCHAR(8) NOT NULL
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users ON DELETE SET NULL,
  title TEXT,
  location TEXT,
  region TEXT
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users ON DELETE CASCADE,
  post_id INTEGER REFERENCES posts ON DELETE CASCADE,
  category TEXT NOT NULL
);