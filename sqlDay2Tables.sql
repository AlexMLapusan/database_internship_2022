/*creation*/
CREATE TABLE genre(
	id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(15),
    description varchar(100)
) ENGINE = INNODB;

CREATE TABLE streaming_platform(
	id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(15),
    domain varchar(20)
) ENGINE = INNODB;

CREATE TABLE director(
	id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(15),
    birth_date date,
    nr_of_shows int
) ENGINE = INNODB;

CREATE TABLE my_show(
	id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(15),
    rating float,
    release_date date,
    director_id int,
    platform_id int,
    FOREIGN KEY(director_id) REFERENCES director(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(platform_id) REFERENCES streaming_platform(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = INNODB;

CREATE TABLE genre_per_show(
    show_id int,
    genre_id int,
    PRIMARY KEY(show_id,genre_id),
    FOREIGN KEY(show_id) REFERENCES my_show(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(genre_id) REFERENCES genre(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = INNODB;

/*populating*/

INSERT INTO genre VALUES
(NULL, "shonen", "shonen jump, pretty known genre in anime"),
(NULL, "comedy", "what is comedy? u get the idea :)"),
(NULL, "drama", "have u seen titanic? u get the idea");

INSERT INTO director VALUES
(NULL, "dummy1", '1986/12/17', 13),
(NULL, "dummy2", '1985/12/17', 14),
(NULL, "dummy3", '1984/12/17', 15),
(NULL, "dummy4", '1983/12/17', 16);

INSERT INTO streaming_platform VALUES
(NULL, "animeDao", '.to'),
(NULL, "Netflix", '.ce vrei'),
(NULL, "Rito", '.teemo'),
(NULL, "Poli", '.wtf');

INSERT INTO my_show VALUES
(NULL, "Naruto", 8.5,'2005/12/17', 1, 5),
(NULL, "Bleach", 7.8, '2005/12/17', 2, 5),
(NULL, "Suits", 7.8, '2005/12/17', 3, 6),
(NULL, "Arcane", 7.8, '2005/12/17', 3, 7),
(NULL, "Examene", 0.0, '2005/12/17', 4, 8);
/* insert la genre/show facut din interfata*/
