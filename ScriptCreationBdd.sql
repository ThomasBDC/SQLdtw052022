CREATE DATABASE DTW_import;
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
    foreign key  (user_id) REFERENCES users(user_id)
);

create table links_tags(
    link_id int NOT NULL,
    tag_id int NOT NULL,
    PRIMARY KEY (link_id, tag_id),
    foreign key (link_id) REFERENCES Links(link_id),
    foreign key (tag_id) REFERENCES Tags(tag_id)
);

create table likes(
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