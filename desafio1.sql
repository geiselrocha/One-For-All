DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plan(
      plan_id INT PRIMARY KEY AUTO_INCREMENT,
      plan_name VARCHAR(50) NOT NULL,
      plan_value DECIMAL(10, 2) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plan (plan_name, plan_value)
  VALUES
    ('gratuito', 0.00),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  CREATE TABLE SpotifyClone.artist(
 	    artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artist VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artist (artist)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  CREATE TABLE SpotifyClone.album(
 	    album_id INT PRIMARY KEY AUTO_INCREMENT,
      album VARCHAR(50) NOT NULL,
      artist_id INT NOT NULL,
      release_year YEAR NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.album (album, artist_id, release_year)
  VALUES
    ('Renaissance', 1, '2022'),
    ('Jazz', 2, '1978'),
    ('Hot Space', 2, '1982'),
    ('Falso Brilhante', 3, '1998'),
    ('Vento de Maio', 3, '2001'),
    ('QVVJFA?', 4, '2003'),
    ('Somewhere Far Beyond', 5, '2007'),
    ('I Put A Spell On You', 6, '2012');

  CREATE TABLE SpotifyClone.user(
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      username VARCHAR(100) NOT NULL,
      age INT NOT NULL,
      plan_id INT NOT NULL,
      signature_date DATE NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.user (username, age, plan_id, signature_date)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 4, '2017-12-30'),
    ('Martin Fowler', 46, 4, '2017-01-17'),
    ('Sandi Metz', 58, 4, '2018-04-29'),
    ('Paulo Freire', 19, 2, '2018-02-14'),
    ('Bell Hooks', 26, 2, '2018-01-05'),
    ('Christopher Alexander', 85, 3, '2019-06-05'),
    ('Judith Butler', 45, 3, '2020-05-13'),
    ('Jorge Amado', 58, 3, '2017-02-17');
  
  CREATE TABLE SpotifyClone.song(
      song_id INT PRIMARY KEY AUTO_INCREMENT,
      song VARCHAR(100) NOT NULL,
      artist_id INT NOT NULL,
      album_id INT NOT NULL,
      duration INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
      FOREIGN KEY (album_id) REFERENCES album(album_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.song (song, artist_id, album_id, duration)
  VALUES
    ('BREAK MY SOUL', 1, 1, 279),
    ('VIRGO’S GROOVE', 1, 1, 369),
    ('ALIEN SUPERSTAR', 1, 1, 116),
    ('Don’t Stop Me Now', 2, 2, 203),
    ('Under Pressure', 2, 3, 152),
    ('Como Nossos Pais', 3, 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 3, 5, 207),
    ('Samba em Paris', 4, 6, 267),
    ('The Bard’s Song', 5, 7, 244),
    ('Feeling Good', 6, 8, 100);

  CREATE TABLE SpotifyClone.reproduction_history(
      user_id INT NOT NULL,
      song_id INT NOT NULL,
      artist_id INT NOT NULL,
      album_id INT NOT NULL,
      music_reproduction DATETIME NOT NULL,
      FOREIGN KEY (user_id) REFERENCES user(user_id),
      FOREIGN KEY (song_id) REFERENCES song(song_id),
      FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
      FOREIGN KEY (album_id) REFERENCES album(album_id),
      CONSTRAINT PRIMARY KEY (user_id, song_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.reproduction_history (user_id, song_id, artist_id, album_id, music_reproduction)
  VALUES
    (1, 8, 4, 6,  '2022-02-28 10:45:55'),
		(1, 2, 1, 1,  '2020-05-02 05:30:35'),
		(1, 10, 6, 8, '2020-03-06 11:22:33'),
		(2, 10, 6, 8, '2022-08-05 08:05:17'),
		(2, 7, 3, 5,  '2020-01-02 07:40:33'),
		(3, 10, 6, 8, '2020-11-13 16:55:13'),
		(3, 2, 1, 1,  '2020-12-05 18:38:30'),
		(4, 8, 4, 6,  '2021-08-15 17:10:10'),
		(5, 8, 4, 6,  '2022-01-09 01:44:33'), 
		(5, 5, 2, 3,  '2020-08-06 15:23:43'),
		(6, 7, 3, 5,  '2017-01-24 00:31:17'),
		(6, 1, 1, 1,  '2017-10-12 12:35:20'),
		(7, 4, 2, 2,  '2011-12-15 22:30:49'),
		(8, 4, 2, 2,  '2012-03-17 14:56:41'),
		(9, 9, 5, 7,  '2022-02-24 21:14:22'),
		(10, 3, 1, 1, '2015-12-13 08:30:22');

  CREATE TABLE SpotifyClone.following_artists(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (user_id) REFERENCES user(user_id),
      FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
      CONSTRAINT PRIMARY KEY (user_id, artist_id)
  ) engine = InnoDB;
   
  INSERT INTO SpotifyClone.following_artists (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
  