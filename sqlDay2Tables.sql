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