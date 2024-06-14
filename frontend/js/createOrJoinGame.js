document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("create-join-game-form");

    form.addEventListener("submit", function(event) {
        event.preventDefault(); // Empêche le formulaire de se soumettre normalement

        const playerName = document.getElementById("playerName").value;
        const action = document.getElementById("action").value;
        const gameId = document.getElementById("gameId").value;

        // Vérifier si le joueur a saisi un nom
        if (!playerName) {
            alert("Veuillez entrer votre nom.");
            return;
        }

        // En fonction de l'action choisie, effectuer les opérations nécessaires
        if (action === "create") {
            // Logique pour créer une nouvelle partie
            createNewGame(playerName);
        } else if (action === "join") {
            // Vérifier si l'ID de la partie est saisi
            if (!gameId) {
                alert("Veuillez entrer l'ID de la partie que vous souhaitez rejoindre.");
                return;
            }
            // Logique pour rejoindre une partie existante avec l'ID spécifié
            joinExistingGame(playerName, gameId);
        }
    });

    function createNewGame(playerName) {
        // Insérer ici la logique pour créer une nouvelle partie
        console.log("Création d'une nouvelle partie avec le joueur", playerName);
        // Rediriger vers la page de choix du rôle
        window.location.href = "choix_des_roles.html";
    }

    function joinExistingGame(playerName, gameId) {
        // Insérer ici la logique pour rejoindre une partie existante
        console.log("Le joueur", playerName, "rejoint la partie", gameId);
        // Vous pouvez également rediriger vers une page de jeu ou un lobby ici si nécessaire
    }
});
