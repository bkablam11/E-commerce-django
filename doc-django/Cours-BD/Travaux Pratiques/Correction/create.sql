-- create database BIBLIO;

-- use BIBLIO;

create table LIVRE (
ISBN varchar(20) not null, 
TITRE varchar(50) not null, 
SIECLE int(2) check (SIECLE BETWEEN 0 and 21),
CATEGORIE varchar(20),
primary key (ISBN)
)ENGINE = InnoDB;

create table ABONNE (
NUM_AB  int(6) ,  
NOM varchar(30) not null, 
PRENOM varchar(20), 
VILLE varchar(30), 
AGE int(3) check (age between 0 and 120) ,
TARIF int(3) ,
REDUC int(3) ,
primary key (NUM_AB))ENGINE = InnoDB;

create table EXEMPLAIRE (
NUMERO int(4), 
DATE_ACHAT date, 
PRIX int(5), 
CODE_PRET varchar(20) check (code_pret in ('EXCLU', 'EMPRUNTABLE', 'CONSULTABLE')),
ETAT varchar(15) check (etat in ('BON','ABIME','EN_REPARATION')), 
ISBN  varchar(20), 
primary key (numero),
FOREIGN KEY (ISBN) REFERENCES LIVRE(ISBN) 
)ENGINE = InnoDB;

create table MOT_CLEF (
MOT varchar(20) not null,
primary key (mot))ENGINE = InnoDB;

create table EMPRUNT 
(NUM_AB  int(6),
NUM_EX int(4) ,
D_EMPRUNT date , 
D_RETOUR date, 
D_RET_REEL date, 
NB_RELANCE int(1) check (nb_relance in (1,2,3)),
primary key (NUM_AB,NUM_EX,D_EMPRUNT),
FOREIGN KEY (num_ab) REFERENCES ABONNE(NUM_AB), 
FOREIGN KEY (num_ex)  REFERENCES EXEMPLAIRE(NUMERO)
)ENGINE = InnoDB;

create table CARACTERISE (
ISBN varchar(20), MOT varchar(20) ,
primary key (ISBN,MOT),
FOREIGN KEY (isbn) REFERENCES livre(ISBN),
FOREIGN KEY (mot) REFERENCES mot_clef(mot)
)ENGINE = InnoDB;
