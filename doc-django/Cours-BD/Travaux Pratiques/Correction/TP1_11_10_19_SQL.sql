-- 1. Quels sont les noms et prénoms 
-- des abonnés domiciliés à Montpellier ?
SELECT NOM,PRENOM
FROM abonne
WHERE VILLE='Montpellier';

-- 2. Donnez toutes les informations 
-- sur les exemplaires dont le code 
-- de prêt est : « EMPRUNTABLE »
SELECT *
FROM exemplaire
WHERE CODE_PRET='EMPRUNTABLE';

-- 3. Donnez la liste des ouvrages 
-- (numéro ISBN, titre et catégorie) 
-- dont le titre inclut le mot « ROSE » triée
-- par ordre décroissant de numéro.
SELECT ISBN,TITRE,CATEGORIE
FROM livre
WHERE TITRE LIKE '%ROSE%' 
ORDER BY ISBN DESC;

-- 4. Donnez, pour l’abonné Jean Dupont, 
-- la liste des exemplaires empruntés 
-- (leur numéro et la date d’emprunt), 
-- par ordre croissant de date d’emprunt.
-- Option 1
SELECT ex.NUMERO,em.D_EMPRUNT
FROM  exemplaire ex
INNER JOIN emprunt em ON em.NUM_EX=ex.NUMERO
INNER JOIN abonne ab ON ab.NUM_AB=em.NUM_AB
WHERE ab.NOM='Dupont'AND ab.PRENOM='Jean'
ORDER BY em.D_EMPRUNT DESC;
 
 -- Option 2
 
 
 
 -- 5. Donnez la liste des exemplaires
 -- (leur numéro, code prêt et le titre 
 -- du livre associé) d’un livre caractérisé
-- par le mot clé « INFORMATIQUE »
SELECT ex.NUMERO,ex.CODE_PRET,li.TITRE
FROM  exemplaire ex
INNER JOIN livre li ON li.ISBN=ex.ISBN
INNER JOIN caracterise ca ON ca.ISBN=ex.ISBN
WHERE ca.MOT='INFORMATIQUE';

-- 6. Quels sont les abonnés (numéro et nom) 
-- ayant emprunté un exemplaire 
-- du livre « LE MUR » ?
SELECT  NUM_AB,NOM
FROM  abonne
WHERE NUM_AB IN 
(SELECT em.NUM_AB
FROM  exemplaire ex
INNER JOIN emprunt em ON em.NUM_EX=ex.NUMERO
INNER JOIN livre li ON li.ISBN=ex.ISBN
WHERE li.TITRE='LE MUR');

-- Option 2
SELECT DISTINCT ab.NOM, ab.PRENOM
FROM livre li 
INNER JOIN exemplaire ex ON li.ISBN=ex.ISBN
INNER JOIN emprunt em ON em.NUM_EX=ex.NUMERO
INNER JOIN abonne ab ON ab.NUM_AB=em.NUM_AB	
WHERE li.TITRE='LE MUR';

-- 7. Quel est le nombre d’emprunt en cours 
-- de l’abonné Renard Albert ?
SELECT COUNT(*)
FROM abonne ab 
INNER JOIN emprunt em ON em.NUM_AB=ab.NUM_AB
WHERE ab.NOM='RENARD' AND ab.PRENOM='ALBERT' AND D_RET_REEL IS NULL ;

-- 8. Donnez le prix d’achat moyen 
-- des exemplaires de roman
SELECT li.CATEGORIE,avg(PRIX) AS 'Prix Moyen'
FROM livre li
INNER JOIN exemplaire ex ON ex.ISBN=li.ISBN
WHERE li.CATEGORIE='ROMAN'
GROUP BY li.CATEGORIE;

-- Option 2
SELECT li.ISBN,li.TITRE,avg(PRIX) AS 'Prix Moyen'
FROM livre li
INNER JOIN exemplaire ex ON ex.ISBN=li.ISBN
WHERE li.CATEGORIE='ROMAN'
GROUP BY li.ISBN;

-- 9. Quelle est la catégorie de livres 
-- pour laquelle l’exemplaire le plus cher
-- a été acheté ?
SELECT li.CATEGORIE,max(ex.PRIX) AS 'Le Prix Max'
FROM livre li
INNER JOIN exemplaire ex ON ex.ISBN=li.ISBN;

-- 10. Existe-t-il des exemplaires dans 
-- l’état « Abimé » et qui sont actuellement
--  empruntés ? Si oui donnez leur numéro.
SELECT ex.NUMERO
FROM exemplaire ex
INNER JOIN emprunt em ON em.NUM_EX=ex.NUMERO
WHERE ex.ETAT='ABIME' AND em.D_RET_REEL IS NULL;

-- 11. Donnez pour la catégorie « Roman », 
-- le nombre d’exemplaires par livre
SELECT li.ISBN,li.TITRE, COUNT(*)
FROM livre li
INNER JOIN exemplaire ex ON ex.ISBN=li.ISBN
WHERE li.CATEGORIE='ROMAN'
GROUP BY li.ISBN,li.TITRE;

-- 12. Quel est l’abonné ayant effectué 
-- le plus d’emprunts ?
SELECT ab.NOM, ab.PRENOM, COUNT(*) AS 'Nbre Emprunt' 
FROM abonne ab
INNER JOIN emprunt em ON ab.NUM_AB=em.NUM_AB
GROUP BY ab.NUM_AB
ORDER BY 'Nbre Emprunt' DESC 
LIMIT 1;
