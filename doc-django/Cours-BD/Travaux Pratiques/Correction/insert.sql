use BIBLIO;

delete from EMPRUNT;
delete from CARACTERISE;
delete from MOT_CLEF;
delete from EXEMPLAIRE;
delete from ABONNE;
delete from LIVRE;

insert into  ABONNE values(901001,'LEVEQUE','PIERRE','MONTPELLIER',40,500,NULL);
insert into  ABONNE values(902043,'DUPONT','03IE','MONTPELLIER',20,200,20);
insert into  ABONNE values(902075,'RENARD','ALBERT','MONTPELLIER',18,200,NULL);
insert into  ABONNE values(911007,'03TIN','LOIC','BEZIER',35,500,20);
insert into  ABONNE values(911021,'DUPONT','ANTOINE','MONTPELLIER',38,500,NULL);
insert into  ABONNE values(911022,'DUPONT','SYLVIE','MONTPELLIER',35,500,NULL);
insert into  ABONNE values(911023,'DUPONT','JEAN','MONTPELLIER',22,200,20);
insert into  ABONNE values(922016,'MEUNIER','LUC','MONTPELLIER',14,100,NULL);
insert into  ABONNE values(921102,'LUCAS','PAUL','MONTPELLIER',48,500,20);
insert into  ABONNE values(922143,'REVEST','ANNIE','MONTPELLIER',12,100,NULL);
insert into  ABONNE values(932010,'ANTON','JEANNE','MONTPELLIER',10,100,NULL);

insert into  LIVRE values('1_104_1050_2','LE MUR',20,'NOUVELLE');
insert into  LIVRE values('0_15_270500_3','LE MIRACLE DE LA ROSE',20,'ROMAN');
insert into  LIVRE values('0_85_4107_3','L ENFANT',19,'ROMAN');
insert into  LIVRE values('0_112_3785_5','POESIES COMPLETES', 15,'POEME');
insert into  LIVRE values('0_201_14439_5','AN INTRODUCTION TO DATABASE SYSTEMS',20,'SCIENCES');
insert into  LIVRE values('0_12_27550_2','NEW APPLICATIONS OF DATABASES',20,'SCIENCES');
insert into  LIVRE values('0_8_7707_2','BASES DE DONNEES RELATIONNELLES',20,'SCIENCES');
insert into  LIVRE values('1_22_1721_3','LE NOM DE LA ROSE',20,'ROMAN');
insert into  LIVRE values('3_505_13700_5','LE GRAND VESTIAIRE',20,'ROMAN');
insert into  LIVRE values('0_18_47892_2','UNE ROSE POUR MORRISSON',20,'ROMAN');
insert into  LIVRE values('9_782070_36','LA PERLE',20,'ROMAN');
insert into  LIVRE values('2_7296_0040','GODEL ESCHER BACH : LES BRINS D UNE GUIRLANDE',20,NULL);
insert into  LIVRE values('0_26_28079_6','OBJET, DE MERISE A C++',20,'SCIENCES');


insert into  MOT_CLEF values('LITTERATURE');
insert into  MOT_CLEF values('ROMAN');
insert into  MOT_CLEF values('POESIE');
insert into  MOT_CLEF values('SCIENCES');
insert into  MOT_CLEF values('INFORMATIQUE');
insert into  MOT_CLEF values('BASES DE DONNEES');
insert into  MOT_CLEF values('HISTOIRE');
insert into  MOT_CLEF values('ESSAI');
insert into  MOT_CLEF values('NOUVELLE');
insert into  MOT_CLEF values('MEDECINE');

insert into  CARACTERISE VALUES ('1_104_1050_2','LITTERATURE');
insert into  CARACTERISE VALUES ('0_15_270500_3','LITTERATURE');
insert into  CARACTERISE VALUES ('0_15_270500_3','ROMAN');
insert into  CARACTERISE VALUES ('0_85_4107_3','LITTERATURE');
insert into  CARACTERISE VALUES ('0_85_4107_3','ROMAN');
insert into  CARACTERISE VALUES ('0_112_3785_5','LITTERATURE');
insert into  CARACTERISE VALUES ('0_112_3785_5','POESIE');
insert into  CARACTERISE VALUES ('0_201_14439_5','SCIENCES');
insert into  CARACTERISE VALUES ('0_201_14439_5','INFORMATIQUE');
insert into  CARACTERISE VALUES ('0_201_14439_5','BASES DE DONNEES');
insert into  CARACTERISE VALUES ('0_12_27550_2','SCIENCES');
insert into  CARACTERISE VALUES ('0_12_27550_2','INFORMATIQUE');
insert into  CARACTERISE VALUES ('0_8_7707_2','SCIENCES');
insert into  CARACTERISE VALUES ('0_8_7707_2','INFORMATIQUE');
insert into  CARACTERISE VALUES ('0_8_7707_2','BASES DE DONNEES');
insert into  CARACTERISE VALUES ('1_22_1721_3','ROMAN');
insert into  CARACTERISE VALUES ('1_22_1721_3','HISTOIRE');
insert into  CARACTERISE VALUES ('3_505_13700_5','LITTERATURE');
insert into  CARACTERISE VALUES ('3_505_13700_5','ROMAN');
insert into  CARACTERISE VALUES ('0_26_28079_6','SCIENCES');
insert into  CARACTERISE VALUES ('0_26_28079_6','INFORMATIQUE');
insert into  CARACTERISE VALUES ('0_26_28079_6','BASES DE DONNEES');


insert into  EXEMPLAIRE values (1010,'1985-04-10',55,'EMPRUNTABLE','BON','0_18_47892_2');
insert into  EXEMPLAIRE values (1011,'1985-04-10',55,'EMPRUNTABLE','BON','0_18_47892_2');
insert into  EXEMPLAIRE values (1012,'1985-05-20',112,'EMPRUNTABLE','BON','3_505_13700_5');
insert into  EXEMPLAIRE values (2909,'1990-03-30',35,'EMPRUNTABLE','BON','3_505_13700_5');
insert into  EXEMPLAIRE values (2673,'1991-03-15',42,'EMPRUNTABLE','ABIME','3_505_13700_5');
insert into  EXEMPLAIRE values (2710,'1984-06-20',270,'CONSULTABLE','BON','0_8_7707_2');
insert into  EXEMPLAIRE values (2711,'1984-06-20',270,'EMPRUNTABLE','BON','0_8_7707_2');
insert into  EXEMPLAIRE values (3014,'1990-09-15',420,'CONSULTABLE','BON','0_201_14439_5');
insert into  EXEMPLAIRE values (3016,'1990-09-15',420,'EMPRUNTABLE','BON','0_201_14439_5');
insert into  EXEMPLAIRE values (3702,'1992-02-20',210,'EMPRUNTABLE','BON','1_22_1721_3');
insert into  EXEMPLAIRE values (3703,'1992-02-20',210,'CONSULTABLE','BON','1_22_1721_3');
insert into  EXEMPLAIRE values (4111,'1995-01-03',48,'EMPRUNTABLE','BON','1_22_1721_3');
insert into  EXEMPLAIRE values (4112,'1995-01-03',48,'EXCLU','BON','1_22_1721_3');
insert into  EXEMPLAIRE values (4203,'1992-11-29',35,'EMPRUNTABLE','BON','1_104_1050_2');
insert into  EXEMPLAIRE values (4204,'1992-11-29',35,'EMPRUNTABLE','ABIME','1_104_1050_2');
insert into  EXEMPLAIRE values (5003,'1993-06-10',39,'EMPRUNTABLE','BON','1_104_1050_2');
insert into  EXEMPLAIRE values (5004,'1993-06-10',41,'EMPRUNTABLE','BON','0_15_270500_3');
insert into  EXEMPLAIRE values (5005,'1993-06-10',41,'EMPRUNTABLE','BON','0_15_270500_3');
insert into  EXEMPLAIRE values (5103,'1990-12-20',470,'CONSULTABLE','BON','0_12_27550_2');
insert into  EXEMPLAIRE values (5104,'1990-12-20',470,'EMPRUNTABLE','BON','0_12_27550_2');
insert into  EXEMPLAIRE values (6006,'1995-12-15',33,'EMPRUNTABLE','BON','0_85_4107_3');
insert into  EXEMPLAIRE values (6007,'1995-12-15',33,'EMPRUNTABLE','BON','0_85_4107_3');
insert into  EXEMPLAIRE values (5202,'1993-10-18',40,'EMPRUNTABLE','BON','0_18_47892_2');
insert into  EXEMPLAIRE values (7000,'1987-09-01',420,'CONSULTABLE','BON','2_7296_0040');
insert into  EXEMPLAIRE values (7001,'1987-09-01',420,'EMPRUNTABLE','BON','2_7296_0040');
insert into  EXEMPLAIRE values (7002,'1987-09-01',420,'EXCLU','BON','2_7296_0040');
insert into  EXEMPLAIRE values (1090,'1985-11-23',150,'EXCLU','ABIME','9_782070_36');
insert into  EXEMPLAIRE values (1091,'1985-11-23',150,'CONSULTABLE','EN_REPARATION','9_782070_36');
insert into  EXEMPLAIRE values (1109,'1987-05-30',170,'EMPRUNTABLE','BON','9_782070_36');
   

insert into  EMPRUNT values (911023,5003,'2002-03-10','2002-03-30','2002-03-30',NULL);
insert into  EMPRUNT values (911023,5005,'2002-03-30','2002-04-15','2002-04-10',NULL);
insert into  EMPRUNT values (911023,1012,'2002-03-30','2002-04-15','2002-04-10',NULL);
insert into  EMPRUNT values (911023,5103,'2002-06-17','2002-06-30','2002-07-20',1);
insert into  EMPRUNT values (901001,4203,'2001-01-03','2001-01-18','2001-01-18',NULL);
insert into  EMPRUNT values (901001,5005,'2001-01-03','2001-01-18','2001-01-18',NULL);
insert into  EMPRUNT values (911007,4203,'2001-02-25','2001-03-08','2001-03-25',1);
insert into  EMPRUNT values (911007,1010,'2001-05-13','2001-05-31','2001-05-31',NULL);
insert into  EMPRUNT values (921102,4204,'2002-08-08','2002-08-22','2002-08-30',NULL);
insert into  EMPRUNT values (921102,5005,'2002-08-08','2002-08-22','2002-08-30',NULL);
insert into  EMPRUNT values (911021,5004,'2002-12-10','2002-12-30','2002-12-28',NULL);
insert into  EMPRUNT values (911007,5004,'2002-07-20','2002-08-10','2002-08-10',NULL);
insert into  EMPRUNT values (911007,4204,'2003-01-19','2003-02-10',NULL,1);
insert into  EMPRUNT values (911007,2673,'2002-12-10','2002-12-30','2002-12-28',NULL);
insert into  EMPRUNT values (902075,2673,'2003-02-15','2003-02-28',NULL,NULL);
insert into  EMPRUNT values (902075,1010,'2003-01-05','2003-01-25',NULL,1);
insert into  EMPRUNT values (921102,6006,'2002-12-20','2003-01-10',NULL,2);
insert into  EMPRUNT values (911023,6007,'2002-12-22','2003-01-12','2003-01-13',NULL);
insert into  EMPRUNT values (902043,7001,'2000-09-15','2000-10-09','2000-10-10',NULL);
insert into  EMPRUNT values (902043,3014,'2000-10-01','2000-10-20','2000-11-20',2);
insert into  EMPRUNT values (902043,3014,'2000-12-01','2000-12-20','2000-12-20',NULL);
insert into  EMPRUNT values (911023,1109,'2002-09-15','2002-10-05','2002-11-05',2);
insert into  EMPRUNT values (902043,7001,'2000-11-20','2000-12-10','2000-12-10', NULL);
insert into  EMPRUNT values (901001,7001,'2000-01-30','2000-02-20','2000-02-18',NULL);
insert into  EMPRUNT values (901001,7001,'2002-05-22','2002-06-12','2002-06-15',NULL);

