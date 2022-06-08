/* Pensez à changer le use pour faire fonctionner le script */
USE DTW_import;

CREATE TABLE Users(
    user_id int PRIMARY KEY NOT NULL auto_increment,
    forename varchar(100) NOT NULL,
    surname varchar(100) NOT NULL,
    mail varchar(200) NOT NULL,
    password varchar(500) NOT NULL, 
    avatar blob,
    avatar_mimeType varchar(500)
);

CREATE TABLE Tags(
    tag_id int PRIMARY KEY NOT NULL auto_increment, 
    name varchar(20) NOT NULL,
    color varchar(6) NOT NULL
);

CREATE TABLE Links(
    link_id int PRIMARY KEY NOT Null auto_increment, 
    url varchar(500) NOT NULL,
    title varchar(100) NOT NULL,
    description varchar(1000),
    creation_date datetime NOT NULL,
    user_id int NOT NULL,
    foreign key  (user_id) REFERENCES Users(user_id)
);

create table Links_tags(
    link_id int NOT NULL,
    tag_id int NOT NULL,
    PRIMARY KEY (link_id, tag_id),
    foreign key (link_id) REFERENCES Links(link_id),
    foreign key (tag_id) REFERENCES Tags(tag_id)
);

create table Likes(
    user_id int NOT NULL,
    link_id int NOT NULL,
    PRIMARY KEY (user_id, link_id),
    foreign key (user_id) REFERENCES Users(user_id),
    foreign key (link_id) REFERENCES Links(link_id)
);


INSERT INTO Users
(forename, surname, mail, password)
VALUES
('Abdallah', 'BAILOUL', 'abba@gmail.com', 'JDORSQL'),
('Aleksandra', 'CICHOCKA', 'test@gmail.com', 'pwd'),
('Andriy', 'NANTOY', 'test@gmail.com', 'pwd'),
('ANTHOnY', 'COMMUN', 'test@gmail.com', 'pwd'),
('Bruno', 'DAHLEM', 'test@gmail.com', 'pwd'),
('Christophe', 'THEVENET', 'test@gmail.com', 'pwd'),
('Dominique', 'BUTIN', 'test@gmail.com', 'pwd');


INSERT INTO Links
(url, title, description, creation_date, user_id)
VALUES
('https://google.com', 'Google', 'Le moteur de recherche le plus connu', '2022-06-08', 1),
('https://sql.sh/', 'SQL', 'Liste de cours SQL', '2022-06-08', 1),
('https://www.pierre-giraud.com/html-css-apprendre-coder-cours/', 'Cours HTML', 'Cours HTML de Pierre GIRAUD', '2022-06-08', 2),
('https://www.pierre-giraud.com/html-css-apprendre-coder-cours/', 'Cours CSS', 'Cours CSS de Pierre GIRAUD', '2022-06-08', 2),
('https://www.pierre-giraud.com/javascript-apprendre-coder-cours/', 'Cours JS', 'Cours JS de Pierre GIRAUD', '2022-06-08', 2),
('https://www.pierre-giraud.com/php-mysql-apprendre-coder-cours/', 'Cours PGP', 'Cours PHP de Pierre GIRAUD', '2022-06-08', 3),
('https://www.pierre-giraud.com/bootstrap-apprendre-cours/', 'Cours Boostrap', 'Cours BS de Pierre GIRAUD', '2022-06-08', 4),
('https://www.pierre-giraud.com/jquery-apprendre-cours/', 'Cours JQUERY', 'Cours JQUERY de Pierre GIRAUD', '2022-06-08', 5),
('https://www.pierre-giraud.com/', 'Cours Pierre GIRUD', 'Toutes les ressources de Pierre GIRAUD', '2022-06-08', 5);

INSERT INTO Likes
(user_id, link_id)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(5,1),
(5,4),
(5,5);

INSERT INTO Tags
(name, color)
VALUES
('SQL', 'eb4034'),
('C#', '431f6b'),
('HTML', '9aa321'),
('CSS', 'a36621'),
('JS', '854564'),
('PHP', '2a229c');

INSERT INTO Links_tags
(link_id, tag_id)
VALUES
(2,1),
(3,3),
(4,4),
(5,4),
(6,6),
(7,4),
(8,5),
(9,1),
(9,2),
(9,3),
(9,4),
(9,5),
(9,6);