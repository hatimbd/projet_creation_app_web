document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("choose-role-form");

    form.addEventListener("submit", function(event) {
        event.preventDefault(); // Empêche le formulaire de se soumettre normalement

        const role = document.getElementById("role").value;

        // Logique pour gérer le choix du rôle
        console.log("Rôle choisi :", role);
        if (role === "maitre_des_mots") {
            window.location.href = "maitre des mots/game_mot.html"; // Page du maître des mots
        } else if (role === "maitre_des_intuitions") {
            window.location.href = "maitre des intuitions/game_int.html"; // Page du maître des intuitions
        }
    });
});