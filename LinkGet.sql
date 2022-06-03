/* Récupérer tous mes liens, triés par titre*/
SELECT
    l.idlinks,
    l.Link,
    l.title,
    l.Description,
    u.iduser,
    u.forename,
    u.surname, 
    u.mail
FROM 
    links AS l
INNER JOIN 
    users AS u ON
        u.iduser = l.idAuteur
ORDER BY
    l.title DESC


-- Je veux récupérer le nombre de liens par utilisateurs
-- pour les utilisateurs qui ont la lettre G dans leurs prenoms
SELECT
    u.forename,
    u.surname,
    u.mail,
    count(l.Link)
FROM 
    links AS l
INNER JOIN 
    users AS u ON
        u.iduser = l.idAuteur 
GROUP BY u.iduser 
HAVING COUNT(l.link) > 3 AND u.forename LIKE '%G%'

/*
Je veux faire une recherche
Je veux récupérer un lien et son créateur
ma recherche est : 'ga'
je veux que ma requête cherche sur links.title links.description, user.forename, user.surname 
*/

SELECT
    l.idlinks,
    l.Link,
    l.title,
    l.Description,
    u.iduser,
    u.forename,
    u.surname, 
    u.mail
FROM 
    links AS l

INNER JOIN 
    users AS u ON
        u.iduser = l.idAuteur
Where 
    l.title LIKE '%ga%' OR
    l.description LIKE '%ga%' OR
    u.forename LIKE '%ga%' OR 
    u.surname LIKE '%ga%' 
ORDER BY
    l.title DESC
 



/*Ci-dessous tu peux écrire
__________________________






_______________________
*/