CREATE DATABASE mdb;

USE mdb;

CREATE TABLE actors (actor_id int(11) NOT NULL AUTO_INCREMENT,
	last_name varchar(45) NOT NULL,
	first_name varchar(45) NOT NULL,
PRIMARY KEY (actor_id));

INSERT INTO actors VALUES
	(NULL,'Hanks', 'Tom'), (NULL,'Allen', 'Tim');
    
INSERT INTO actors VALUES
	(DEFAULT, 'Potts', 'Annie');

INSERT INTO actors (last_name, first_name)
	VALUES ("Fisher", "Carrie");
    
CREATE TABLE movies (movie_id int(11) NOT NULL AUTO_INCREMENT,
	title varchar(45) NOT NULL,
    rating varchar(10),
    r_year datetime NOT NULL,
    studio varchar(45),
PRIMARY KEY (movie_id));

INSERT INTO movies VALUES
	(DEFAULT, 'Toy Story', 'G', '1995-10-01', 'Pixar');
    
UPDATE actors 
SET first_name = 'Tommy'
WHERE last_name = 'Hanks';  -- won't work because we are in safe mode

UPDATE actors 
SET first_name = 'Tommy'
WHERE actor_id = 1;  -- works because we used a primary key to do it

DELETE FROM actors
WHERE actor_id = 1;

DROP TABLE movies;

DROP DATABASE mdb;