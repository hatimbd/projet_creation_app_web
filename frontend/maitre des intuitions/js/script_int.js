function generateFields(){
    const fieldParts = document.querySelector("field-parts");
    const words = [ "Arbre", "Avion", "Banque", "Bateau", "Boutique",
        "Café", "Chat", "Chateau", "chocolat", "Cinéma",
        "Cirque", "Désert", "école", "église", "étoile",
        "Fleur", "foret", "Grotte", "Hopital", "Ile",
        "Jardin", "Livre", "Magasin", "Marché", "Ronaldo",
        "Plage", "Montagne", "Volcan", "Lac", "Rivière",
        "Cascade", "Pont", "Tunnel", "Route", "Autoroute",
        "Vélo", "Voiture", "Camion", "Tracteur", "Train",
        "Métro", "Station", "Aéroport", "Hôtel", "Restau",
        "marché", "Pharmacie", "Musée", "Parc", "Zoo",
        "Aquarium", "Théâtre", "Opéra", "cage", "Université",
        "Stade", "Gymnase", "Piscine", "Patinoire", "Terrain",
        "Cimetière", "Centre", "moto", "Poste", "Maison",
        "Appart", "Immeuble", "Gratte", "Tour", "Chambre",
        "Cuisine", "bain", "Salon", "esirem"
    ];

     // Mélanger les mots
     for (let i = words.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [words[i], words[j]] = [words[j], words[i]];
    }


    for ( let i=0; i<25 ; i++ ){    
        const fieldPart = document.createElement("field-part");
        fieldPart.classList.add("carte");
        fieldPart.textContent = words[i];  // Add word to the card
        fieldParts.appendChild(fieldPart);
    } 

}

window.addEventListener("load", generateFields);



function attachPersonnesEvent() {
    // Sélectionner tous les personnes
    const personnes = document.querySelectorAll("personnes personne");

    // Parcourir tous les personnes
    personnes.forEach(personne => {
        // Ajouter un gestionnaire d'événement "click"
        personne.addEventListener("click", function() {
            // Retirer la classe "active" de tous les personnes
            personnes.forEach(t => t.classList.remove("active"));
            // Ajouter la classe "active" à la personne cliquée
            this.classList.add("active");
        });
    });
}


// Appeler la fonction attachToolsEvent lorsque la page a terminé son chargement
window.addEventListener("load", attachPersonnesEvent);



document.addEventListener('DOMContentLoaded', () => {
    const player1 = localStorage.getItem('player1');
    const player2 = localStorage.getItem('player2');

    if (player1 && player2) {
        document.getElementById('maitre-int').textContent = player1;
        document.getElementById('maitre-mot').textContent = player2;
    }

    const scoreElement = document.getElementById('score');
    const incrementButton = document.getElementById('increment-score-button');

    incrementButton.addEventListener('click', () => {
        incrementScore(scoreElement);
    });
});

function incrementScore(scoreElement) {
    let currentScore = parseInt(scoreElement.textContent);
    currentScore += 1;
    scoreElement.textContent = currentScore;
}
