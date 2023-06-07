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