CREATE TABLE movies (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(45) NOT NULL,
    genre VARCHAR(45) NOT NULL,
    image VARCHAR(1000) NOT NULL,
    category VARCHAR(45) NOT NULL,
    year INT
);

INSERT INTO `netflix`.`movies` (`title`, `genre`, `image`, `category`, `year`) VALUES ('Pulp Fiction', 'Crimen', 'https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg', 'Top 10', '1994');
INSERT INTO `netflix`.`movies` (`title`, `genre`, `image`, `category`, `year`) VALUES ('La vita è bella', 'Comedia', 'https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg', 'Top 10', '1996');
INSERT INTO `netflix`.`movies` (`title`, `genre`, `image`, `category`, `year`) VALUES ('Forrest Gump', 'Comedia', 'https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg', 'Top 10', '1994');

CREATE TABLE users (
	idUser INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    plan_details VARCHAR(45) NOT NULL
);

INSERT INTO `netflix`.`users` (`user`, `password`, `name`, `email`, `plan_details`) VALUES ('laura_dev', 'laura', 'Laura', 'laura@gmail.com', 'Standard');
INSERT INTO `netflix`.`users` (`user`, `password`, `name`, `email`, `plan_details`) VALUES ('maria_dev', 'maria', 'Maria', 'maria@gmail.com', 'Standard');
INSERT INTO `netflix`.`users` (`user`, `password`, `name`, `email`, `plan_details`) VALUES ('ester_dev', 'ester', 'Ester', 'ester@gmail.com', 'Standard');


CREATE TABLE actors (
	idActor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    year_birthday INT
);

INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('Tom', 'Hanks', 'Estados Unidos', '1956');
INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('Roberto', 'Benigni', 'Italia', '1952');
INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('John', 'Travolta', 'Estados Unidos', '1954');
--consultas--
SELECT * FROM netflix.movies;
SELECT title, genre FROM netflix.movies WHERE  year > 1990;
SELECT * FROM netflix.movies WHERE category = 'Top 10';
UPDATE netflix.movies SET year = 1997 WHERE id=2; 
SELECT * FROM netflix.actors;
SELECT * FROM netflix.actors WHERE year_birthday BETWEEN 1950 and 1960;
SELECT name, lastname FROM netflix.actors WHERE country = 'Estados Unidos';
select * from netflix.actors; 
ALTER TABLE netflix.actors ADD photo varchar(100) AFTER lastname;

--DROP TABLE nombre_tabla // DROP DATABASE nombre_del_database o DROP SCHEMA nombre_del_schema--

CREATE TABLE rel_movies_users
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
fk_idUser INT,
fk_idMovie INT, 
FOREIGN KEY (fk_idUser) REFERENCES netflix.users(idUser),
FOREIGN KEY (fk_idMovie) REFERENCES netflix.movies(id));

INSERT INTO `netflix`.`rel_movies_users` (`fk_idUser`, `fk_idMovie`) VALUES ('1', '1');
INSERT INTO `netflix`.`rel_movies_users` (`fk_idUser`, `fk_idMovie`) VALUES ('1', '2');
INSERT INTO `netflix`.`rel_movies_users` (`fk_idUser`, `fk_idMovie`) VALUES ('2', '2');

ALTER TABLE netflix.rel_movies_users ADD score INT AFTER fk_idMovie;

CREATE TABLE rel_movies_actors
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
fk_idActor INT,
fk_idMovie INT, 
FOREIGN KEY (fk_idActor) REFERENCES netflix.actors(idActor),
FOREIGN KEY (fk_idMovie) REFERENCES netflix.movies(id));

INSERT INTO `netflix`.`rel_movies_actors` (`fk_idActor`, `fk_idMovie`) VALUES ('1', '3');
INSERT INTO `netflix`.`rel_movies_actors` (`fk_idActor`, `fk_idMovie`) VALUES ('2', '2');
INSERT INTO `netflix`.`rel_movies_actors` (`fk_idActor`, `fk_idMovie`) VALUES ('3', '1');

-- UPDATE IMG QUE NO SE VEN



UPDATE `netflix`.`movies` SET `image` = 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2016/12/pulp-fiction.jpg' WHERE (`id` = '1');
UPDATE `netflix`.`movies` SET `image` = 'https://upload.wikimedia.org/wikipedia/en/7/7c/Vitaebella.jpg' WHERE (`id` = '2');
UPDATE `netflix`.`movies` SET `image` = 'https://c8.alamy.com/compes/pxnb1j/forrest-gump-poster-de-pelicula-original-pxnb1j.jpg' WHERE (`id` = '3');