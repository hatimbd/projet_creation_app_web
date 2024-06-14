USE ploynames_db;

-- Insertion des couleurs
INSERT INTO Couleur (ID, Nom) VALUES 
('1', 'Bleu'),
('2', 'Gris'),
('3', 'Noir');

-- Insertion des joueurs
INSERT INTO Joueur (ID, Nom, Email) VALUES 
('1', 'Joueur1', 'joueur1@example.com'),
('2', 'Joueur2', 'joueur2@example.com');

-- Insertion des rôles
INSERT INTO Role (Nom) VALUES 
('Maitre des intuitions'),
('Maitre des mots');

-- Assigner les rôles aux joueurs
INSERT INTO Avoir (Joueur_ID, Role_Nom) VALUES 
('1', 'Maitre des intuitions'),
('2', 'Maitre des mots');

-- Création d'une partie
INSERT INTO Partie (ID, Code_de_la_partie, status) VALUES 
('1', 'P001', 'En cours');

-- Assigner les joueurs à la partie
INSERT INTO Participer (Partie_ID, Joueur_ID) VALUES 
('1', '1'),
('1', '2');

-- Insertion des cartes
-- J'ai pensé à 75 mots
INSERT INTO Carte (mot) VALUES 
('Arbre'),
('Avion'),
('Banque'),
('Bateau'),
('Boutique'),
('Café'),
('Chat'),
('Chateau'),
('Chocolat'),
('Cinéma'),
('Cirque'),
('Désert'),
('école'),
('église'),
('étoile'),
('Fleur'),
('Foret'),
('Grotte'),
('Hopital'),
('Ile'),
('Jardin'),
('Livre'),
('Magasin'),
('Marché'),
('Ronaldo'),
('Plage'),
('Montagne'),
('Volcan'),
('Lac'),
('Rivière'),
('Cascade'),
('Pont'),
('Tunnel'),
('Route'),
('Autoroute'),
('Vélo'),
('Voiture'),
('Camion'),
('Tracteur'),
('Train'),
('Métro'),
('Station'),
('Aéroport'),
('Hôtel'),
('Restaurant'),
('Supermarché'),
('Pharmacie'),
('Musée'),
('Parc'),
('Zoo'),
('Aquarium'),
('Théâtre'),
('Opéra'),
('Bibliothèque'),
('Université'),
('Stade'),
('Gymnase'),
('Piscine'),
('Patinoire'),
('Terrain de sport'),
('Cimetière') ,
