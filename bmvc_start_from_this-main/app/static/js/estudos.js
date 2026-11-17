
const tarefas = document.querySelectorAll(".marcador");
const contador = document.getElementById("contador");
const barra = document.getElementById("barra-progresso");
const mensagem = document.getElementById("mensagem");
const botaoResetar = document.getElementById("botao-resetar");

const usuarioId = document.body.dataset.usuarioId;
const chaveProgresso = "estacaoEstudosProgresso_" + usuarioId;


function atualizarProgresso() {
    let concluidas = 0;

    tarefas.forEach(function(tarefa) {
        const linha = tarefa.closest(".tarefa");

        if (tarefa.checked) {
            concluidas++;
            linha.classList.add("concluida");
        } else {
            linha.classList.remove("concluida");
        }
    });

    const total = tarefas.length;
    const porcentagem = total > 0
        ? (concluidas / total) * 100
        : 0;

    contador.textContent =
        concluidas + " de " + total + " concluídas";

    barra.style.width = porcentagem + "%";

    if (concluidas === total) {
        mensagem.textContent =
            "Parabéns! Você concluiu todas as tarefas!";
    } else if (concluidas > 0) {
        mensagem.textContent =
            "Muito bem! Continue avançando.";
    } else {
        mensagem.textContent =
            "Você consegue! Comece pela primeira tarefa.";
    }

    const progresso = Array.from(tarefas).map(function(tarefa) {
        return tarefa.checked;
    });

    localStorage.setItem(
        chaveProgresso,
        JSON.stringify(progresso)
    );
}


// Recuperar o progresso do usuário conectado
if (tarefas.length > 0) {

    const progressoSalvo = JSON.parse(
        localStorage.getItem(chaveProgresso) || "[]"
    );

    tarefas.forEach(function(tarefa, indice) {

        tarefa.checked = progressoSalvo[indice] === true;

        tarefa.addEventListener(
            "change",
            atualizarProgresso
        );

    });

    atualizarProgresso();
}


// Botão para recomeçar
if (botaoResetar) {

    botaoResetar.addEventListener("click", function() {

        tarefas.forEach(function(tarefa) {
            tarefa.checked = false;
        });

        atualizarProgresso();

    });

}
