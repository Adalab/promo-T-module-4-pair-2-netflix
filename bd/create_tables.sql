CREATE TABLE actors (
  idActor INT auto_increment not null primary key,
  name VARCHAR(45) not null,
  lastname VARCHAR(45) not null,
  country VARCHAR(45) not null,
  year_birthday INT not null
);

CREATE TABLE movies (
  id INT auto_increment primary key,
  title VARCHAR(45) not null,
  genre VARCHAR(45) not null,
  image VARCHAR(1000) not null,
  category VARCHAR(45) not null,
  year INT
);

CREATE TABLE Users (
  idUser INT auto_increment not null primary key,
  user VARCHAR(45) not null,
  password VARCHAR(45) not null,
  name VARCHAR(1000) not null,
  email VARCHAR(45) not null,
  plan_details VARCHAR(45) not null
);
