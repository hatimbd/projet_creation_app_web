document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('create-game-button');
    form.addEventListener('click', (event) => {
        event.preventDefault();
        const player1 = document.getElementById('player1').value;
        const player2 = document.getElementById('player2').value;

        // Stockez les noms des joueurs dans le localStorage pour les utiliser sur la page de jeu
        localStorage.setItem('player1', player1);
        localStorage.setItem('player2', player2);

        // Redirigez vers la page de jeu
        window.location.href = '../maitre des intuitions/game_int.html';
    });
});
