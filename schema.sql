-- Create Item Table--
CREATE TABLE Item (
  id INT PRIMARY KEY,
  genre VARCHAR(200),
  author VARCHAR(200),
  source VARCHAR(200),
  label VARCHAR(200),
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  can_be_archived BOOLEAN,
  move_to_archive BOOLEAN,
  add_genre INT REFERENCES Genre(id),
  add_source INT REFERENCES Source(id),
  add_author INT REFERENCES Author(id),
  add_label INT REFERENCES Label(id)
);


--book table--

CREATE TABLE  book (
  id INT PRIMARY KEY REFERENCES item(id),
  publisher VARCHAR(40),
  cover_state VARCHAR(30)
);

--label table--

CREATE TABLE label (
  id INT PRIMARY KEY,
  title VARCHAR(30),
  color VARCHAR(20)
);

CREATE INDEX idx_book_label_id ON book (label_id);

--music album table --
CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL DEFAULT DATE,
  on_spotify BOOLEAN,
  archived BOOLEAN,
  genre_id INT,
  label_id INT,
  author_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(label_id)
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
  PRIMARY KEY(id)
);

-- genre table --
CREATE TABLE genres (
  genre_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  PRIMARY KEY(genre_id)
);

-- Create game table --
CREATE TABLE game (
  id SERIAL PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  genre_id INT,
  label_id INT,
  publish_date DATE,
  author_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(label_id)
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
  PRIMARY KEY(id)
);

--author table --
CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100)
);