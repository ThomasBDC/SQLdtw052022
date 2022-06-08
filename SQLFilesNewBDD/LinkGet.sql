/* Récupérer tous mes liens, triés par titre*/
SELECT
    l.link_id,
    l.url,
    l.title,
    l.Description,
    u.user_id,
    u.forename,
    u.surname, 
    u.mail
FROM 
    links AS l
INNER JOIN 
    users AS u ON
        u.user_id = l.user_id
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
        u.user_id = l.user_id 
GROUP BY u.user_id 
HAVING COUNT(l.link) > 3 AND u.forename LIKE '%G%'

/*
Je veux faire une recherche
Je veux récupérer un lien et son créateur
ma recherche est : 'ga'
je veux que ma requête cherche sur links.title links.description, user.forename, user.surname 
*/

SELECT
    l.link_id,
    l.url,
    l.title,
    l.Description,
    u.user_id,
    u.forename,
    u.surname, 
    u.mail
FROM 
    links AS l

INNER JOIN 
    users AS u ON
        u.user_id = l.user_id
Where 
    l.title LIKE '%ga%' OR
    l.description LIKE '%ga%' OR
    u.forename LIKE '%ga%' OR 
    u.surname LIKE '%ga%' 
ORDER BY
    l.title DESC
 


/*
Je veux récupérer tous les liens liké pour un utilisaeur

*/


SELECT 
    likes.user_ids,
    users.surname,
    users.forename,
    users.mail,
    likes.link_id,
    links.title,
    links.description, 
    links.url
FROM likes 
INNER JOIN users ON likes.user_ids = users.user_id
INNER JOIN links ON likes.link_id = links.link_id
    
    
 

 /*
 Je veux récupérer les liens des catégories
  */ 

select 
    tag_links.idlink,
    links.title,
    links.description, 
    links.url,
    tag_links.idtag,
    tags.name,
    tags.color
from tag_links
INNER JOIN links ON tag_links.idlink = links.link_id
INNER JOIN tags ON tag_links.idtag = tags.idtags


/*Ci-dessous tu peux écrire
__________________________






_______________________
*/