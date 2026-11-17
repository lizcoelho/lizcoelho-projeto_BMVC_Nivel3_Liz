
document.addEventListener("DOMContentLoaded", function () {
    const formulario = document.querySelector(".formulario form");

    formulario.addEventListener("submit", function (evento) {
        const titulo = document.querySelector(
            'input[name="titulo"]'
        ).value.trim();

        const disciplina = document.querySelector(
            'input[name="disciplina"]'
        ).value.trim();

        if (titulo === "" || disciplina === "") {
            evento.preventDefault();
            alert("Preencha o título e a disciplina!");
        }
    });

    const botoesExcluir = document.querySelectorAll(".excluir");

    botoesExcluir.forEach(function (botao) {
        botao.addEventListener("click", function (evento) {
            const confirmar = confirm(
                "Deseja realmente excluir esta tarefa?"
            );

            if (!confirmar) {
                evento.preventDefault();
            }
        });
    });
});
