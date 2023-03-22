CREATE DATABASE library;

CREATE TABLE item (
  id INT SERIAL PRIMARY KEY,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  source INT REFERENCES source(id),
  label INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN 
);

CREATE TABLE game (
  id INT PRIMARY KEY REFERENCES item(id), , 
  publish_date DATE, 
  multiplayer BOOLEAN,
  last_played_at DATE, 
);

CREATE TABLE author (
  id INT PRIMARY KEY, 
  first_name VARCHAR(50), 
  last_name VARCHAR(50)
);

CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE books (
    id  INT,
    title VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE musicalbum (
  id INT PRIMARY KEY REFERENCES item(id),
  publish_date DATE, 
  on_spotify BOOLEAN
);

CREATE TABLE genre (
  id INT PRIMARY KEY, 
  f_name VARCHAR(50)
);