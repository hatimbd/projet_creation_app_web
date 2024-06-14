-- Création de la base de données ploynames_db
CREATE DATABASE ploynames;

-- Utilisation de la base de données ploynames_db
USE ploynames_db
-- Table Partie
CREATE TABLE Partie (
    ID VARCHAR(255) PRIMARY KEY,
    Code_de_la_partie VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL
);

-- Table Joueur
CREATE TABLE Joueur (
    ID VARCHAR(255) PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

-- Table Carte
CREATE TABLE Carte (
    mot VARCHAR(255) PRIMARY KEY
);


-- Table Couleur
CREATE TABLE Couleur (
    ID VARCHAR(255) PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL
);

-- Table Tour
CREATE TABLE Tour (
    ID VARCHAR(255) PRIMARY KEY,
    Numero_du_tour INT NOT NULL,
    Maitre_des_mots_ID VARCHAR(255) NOT NULL,
    Maitre_des_intuitions_ID VARCHAR(255) NOT NULL,
    Partie_ID VARCHAR(255) NOT NULL,
    FOREIGN KEY (Maitre_des_mots_ID) REFERENCES Joueur(ID),
    FOREIGN KEY (Maitre_des_intuitions_ID) REFERENCES Joueur(ID),
    FOREIGN KEY (Partie_ID) REFERENCES Partie(ID)
);

-- Table Indice
CREATE TABLE Indice (
    ID VARCHAR(255) PRIMARY KEY,
    Mot_d_indice VARCHAR(255) NOT NULL,
    Nombre_de_mots_associes INT NOT NULL,
    Tour_ID VARCHAR(255) NOT NULL,
    FOREIGN KEY (Tour_ID) REFERENCES Tour(ID)
);

-- Table Role
CREATE TABLE Role (
    Nom VARCHAR(255) PRIMARY KEY
);

-- Table Participer
CREATE TABLE Participer (
    Partie_ID VARCHAR(255) NOT NULL,
    Joueur_ID VARCHAR(255) NOT NULL,
    PRIMARY KEY (Partie_ID, Joueur_ID),
    FOREIGN KEY (Partie_ID) REFERENCES Partie(ID),
    FOREIGN KEY (Joueur_ID) REFERENCES Joueur(ID)
);

-- Table Avoir
CREATE TABLE Avoir (
    Joueur_ID VARCHAR(255) NOT NULL,
    Role_Nom VARCHAR(255) NOT NULL,
    PRIMARY KEY (Joueur_ID, Role_Nom),
    FOREIGN KEY (Joueur_ID) REFERENCES Joueur(ID),
    FOREIGN KEY (Role_Nom) REFERENCES Role(Nom)
);

-- Table Contenir
CREATE TABLE Contenir (
    Partie_ID VARCHAR(255) NOT NULL,
    Carte_Mot VARCHAR(255) NOT NULL,
    PRIMARY KEY (Partie_ID, Carte_Mot),
    FOREIGN KEY (Partie_ID) REFERENCES Partie(ID),
    FOREIGN KEY (Carte_Mot) REFERENCES Carte(Mot)
);

-- Table Couleur_Carte
CREATE TABLE Couleur_Carte (
    Carte_Mot VARCHAR(255) NOT NULL,
    Couleur_ID VARCHAR(255) NOT NULL,
    PRIMARY KEY (Carte_Mot, Couleur_ID),
    FOREIGN KEY (Carte_Mot) REFERENCES Carte(Mot),
    FOREIGN KEY (Couleur_ID) REFERENCES Couleur(ID)
);

-- Table Tour_Indice
CREATE TABLE Tour_Indice (
    Tour_ID VARCHAR(255) NOT NULL,
    Indice_ID VARCHAR(255) NOT NULL,
    PRIMARY KEY (Tour_ID, Indice_ID),
    FOREIGN KEY (Tour_ID) REFERENCES Tour(ID),
    FOREIGN KEY (Indice_ID) REFERENCES Indice(ID)
);

