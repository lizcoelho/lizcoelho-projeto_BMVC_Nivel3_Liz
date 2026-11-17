
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plano e Progresso | Estação de Estudos</title>
    <link rel="stylesheet" href="/static/css/estudos.css">
    <script src="/static/js/estudos.js" defer></script>
</head>
<body data-usuario-id="{{usuario.id}}">

    <header class="topo">
        <div class="marca">ESTAÇÃO <span>DE ESTUDOS</span></div>
        <p>Olá, {{usuario.nome}}! <a href="/logout">Sair da conta</a></p>
    </header>

    <main class="container">

        <a href="/restrito" class="botao-voltar">← Voltar à área restrita</a>

        <section class="apresentacao">
            <p class="etiqueta">SEU PLANEJAMENTO</p>
            <h1>Plano e <span>Progresso.</span></h1>
            <p class="descricao">
                Marque suas atividades conforme concluir
                e acompanhe seu desenvolvimento.
            </p>
        </section>

        <section class="painel">

            <div class="painel-titulo">
                <div>
                    <p class="etiqueta">SEU PLANO</p>
                    <h2>Foco de hoje</h2>
                </div>
                <span class="icone">✦</span>
            </div>

            <p class="orientacao">
                Marque cada atividade quando terminar.
            </p>

            <div class="progresso-info">
                <span>Progresso das tarefas</span>
                <strong id="contador">0 de 3 concluídas</strong>
            </div>

            <div class="barra">
                <div id="barra-progresso"></div>
            </div>

            <div class="tarefas">

                <label class="tarefa">
                    <input type="checkbox" class="marcador">
                    <span class="texto-tarefa">
                        <strong>Revisar o conteúdo</strong>
                        <small>Releia suas anotações</small>
                    </span>
                    <span class="categoria">REVISÃO</span>
                </label>

                <label class="tarefa">
                    <input type="checkbox" class="marcador">
                    <span class="texto-tarefa">
                        <strong>Resolver exercícios</strong>
                        <small>Pratique o que aprendeu</small>
                    </span>
                    <span class="categoria">PRÁTICA</span>
                </label>

                <label class="tarefa">
                    <input type="checkbox" class="marcador">
                    <span class="texto-tarefa">
                        <strong>Planejar a próxima sessão</strong>
                        <small>Defina sua próxima prioridade</small>
                    </span>
                    <span class="categoria">PLANEJAMENTO</span>
                </label>

            </div>

            <p id="mensagem" class="mensagem" aria-live="polite">
                Você consegue! Comece pela primeira tarefa.
            </p>

            <button id="botao-resetar" type="button">
                Recomeçar tarefas
            </button>

        </section>

        <section class="lembrete">
            <span class="aspas">“</span>
            <p>
                Consistência vale mais do que perfeição.
                Continue avançando no seu ritmo.
            </p>
        </section>

    </main>

    <footer>
        <p>ESTAÇÃO DE ESTUDOS · Aprender é construir o futuro.</p>
    </footer>

</body>
</html>
