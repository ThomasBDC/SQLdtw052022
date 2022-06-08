-- Récupérer tous les utilisateurs, tri abc sur le nom et prenom
SELECT 
    user_id, 
    surname,
    forename,
    mail
FROM
    users
ORDER BY surname, forename, mail ASC;

-- Récupérer les utilisateurs, tri abc sur le nom et prenom, mais paginés
SELECT 
    user_id, 
    surname,
    forename,
    mail
FROM
    users
ORDER BY surname, forename, mail ASC
LIMIT @perPage OFFSET @nombreElementAPasser;

-- OFFSET = nbPerPage * (NoPage-1)

-- Récupérer un utilisateur, par son identifiant
SELECT 
    user_id, 
    surname,
    forename,
    mail
FROM
    users
where user_id = @identifiantUser;

-- Recherche sur un utilisateur, tri abc sur le nom et prenom
-- la recherche c'est 'er'
SELECT
    user_id, 
    surname,
    forename,
    mail
FROM
    users
WHERE 
    surname like '%er%' OR 
    forename like '%er%' OR 
    mail like '%er%'
ORDER BY surname, forename, mail ASC;

-- Modifier un utilisateur
UPDATE
    users
SET
    surname = 'surnameUPDATE',
    forename = 'forenameUPDATE',
    mail = 'mailUPDATE'
WHERE 
    user_id = 5;


-- Supprimer un utilisateur (il faut d'abord supprimer les liens liés à l'utilisateur)
DELETE FROM 
    links
where idauteur = 102;
DELETE FROM 
    users
WHERE 
    user_id = 102;

-- Insérer un utilisateur
INSERT INTO users (surname, forename, mail, password) 
VALUES
('nom', 'prenom', 'mail', 'mdp');