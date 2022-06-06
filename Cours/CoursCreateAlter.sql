--Créer la table
CREATE TABLE campus(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    Address1 VARCHAR(100) NOT NULL,
    Address2 VARCHAR(100),
    Ville VARCHAR(100) NOT NULL,
    CodePostal Varchar(6) NOT NULL,
    DateOuverture DATE NOT NULL,
    Isopen BOOLEAN NOT NULL
);


CREATE TABLE campusTest(
    id int NOT NULL,
    nom VARCHAR(100) NOT NULL,
    Address1 VARCHAR(100) NOT NULL,
    Address2 VARCHAR(100),
    Ville VARCHAR(100) NOT NULL,
    CodePostal Varchar(6) NOT NULL,
    DateOuverture DATE NOT NULL,
    Isopen BOOLEAN NOT NULL,
    campusBaseId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (campusBaseId) REFERENCES campus(id)
);

--Voir les caractéristiques de la table
DESCRIBE campus;

-- Insérer une ligne dans la table
INSERT INTO campus (nom, Address1, Address2, Ville, CodePostal, DateOuverture, Isopen)
VALUES
('campus 1', '1 rue de la rue', 'BT 684', 'TOURS', '31546', '2021-06-01', true);

--Récupérer les données
SELECT * FROM campus;


--Modifier une colonne de ma table
ALTER TABLE campus
CHANGE Adresse1 Adresse int NOT NULL;

ALTER TABLE campus
CHANGE Adresse2 ComplementAdresse VARCHAR(255);

--Supprimer une colonne
ALTER TABLE campus
DROP Isopen;

--Ajouter une colonne
ALTER TABLE campus
ADD new_Column int not null;

--Modifier la clé 
ALTER TABLE matable
DROP PRIMARY KEY; 
ALTER TABLE matable
ADD PRIMARY KEY (id, colonne2, colonne3)


--Changer une clé étrangère
ALTER TABLE matable
ADD FOREIGN KEY (colonneEtrangere) REFERENCES TableSource(ClePrimaireTable);

