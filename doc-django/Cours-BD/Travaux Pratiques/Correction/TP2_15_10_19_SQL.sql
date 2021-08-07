-- create database TP02;
-- use TP02;

-- Etablissez le schéma de relation 
-- de cette base de données.

create table Editeur (
num_editeur  int(10),
nom_editeur varchar(20) not null,
primary key (num_editeur)
)ENGINE = InnoDB;


create table Livre (
num_livre int(10),
nom_livre varchar(20) not null,
num_editeur  int(10),
primary key (num_livre),
FOREIGN KEY (num_editeur) REFERENCES Editeur(num_editeur) ON DELETE CASCADE 
)ENGINE = InnoDB; -- MyISAM

create table Auteur (
num_auteur  int(10),
nom_auteur varchar(20) not null,
primary key (num_auteur)
)ENGINE = InnoDB;

create table Ecrire (
num_livre int(10),
num_auteur int(10),
FOREIGN KEY (num_auteur) REFERENCES Auteur(num_auteur) ON DELETE CASCADE,
FOREIGN KEY (num_livre) REFERENCES Livre(num_livre) ON DELETE CASCADE,
primary key (num_livre,num_auteur)
)ENGINE = InnoDB;

-- 1. Modification de tables
-- Modifiez la table Livre pour :
-- • Ajouter l'attribut nb_pages (de type entier);
-- • Ajouter l'attribut ISBN (de type entier);
ALTER TABLE Livre
ADD nb_pages int,
ADD ISBN int;
-- Essayez de modifier la table pour que ISBN
-- en devienne la clé. Que se passe-t-il ?

ALTER TABLE ecrire 
DROP foreign key ecrire_ibfk_2 ;

ALTER TABLE Livre
DROP COLUMN num_livre;

ALTER TABLE Livre
DROP COLUMN num_livre;

ALTER TABLE Livre
ADD CONSTRAINT  pk_ISBN PRIMARY KEY(ISBN);

-- 2. Insertion d'enregistrements
-- Ajoutez 2 enregistrements à la table
-- Editeur correspondant aux editeurs suivants :
-- num_editeur nom_editeur
-- 1 Gallimard
-- 2 Plon
INSERT INTO editeur values (1,'Gallimard'),(2,'Plon');

-- Ajoutez 1 enregistrement à la table Livre
--  correspondant au livre suivant :
-- isbn nom_livre num_editeur nb_pages
-- 123456 Introduction a SQL 2 350
INSERT INTO livre values ('Introduction a SQL',2,350,123456);
-- option 2
INSERT INTO livre(ISBN,nom_livre,num_editeur,nb_pages) values (123456,'Introduction a SQL',2,350);

-- Supprimer de la table Editeur 
-- l'enregistrement pour lequel num_editeur = 1. 
-- Vérifiez que la suppression a bien été effectuée.
DELETE FROM editeur
WHERE num_editeur = 1;

-- Supprimer de la table Editeur 
-- l'enregistrement pour lequel num_editeur = 2.
--  Que se passe-t-il ?
DELETE FROM editeur
WHERE num_editeur = 2;

