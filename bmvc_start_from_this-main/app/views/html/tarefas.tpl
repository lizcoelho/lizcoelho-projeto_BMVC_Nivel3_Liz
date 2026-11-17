
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Tarefas | Estação de Estudos</title>
    <link rel="stylesheet" href="/static/css/estudos.css">
</head>
<body>

    <header class="topo">
        <div class="marca">ESTAÇÃO <span>DE ESTUDOS</span></div>
        <p>
            Olá, {{usuario.nome}}!
            <a href="/logout">Sair da conta</a>
        </p>
    </header>

    <main class="container">

        <a href="/restrito" class="botao-voltar">← Voltar à área restrita</a>

        <section class="apresentacao">
            <p class="etiqueta">ORGANIZAÇÃO</p>
            <h1>Minhas <span>Tarefas.</span></h1>
            <p class="descricao">
                Cadastre e organize suas atividades de estudo
                em um só lugar.
            </p>
        </section>

        <section class="painel">

            <div class="painel-titulo">
                <div>
                    <p class="etiqueta">NOVA ATIVIDADE</p>
                    <h2>Cadastrar tarefa</h2>
                </div>
                <span class="icone">✎</span>
            </div>

            <form action="/tarefas/adicionar" method="POST" class="form-tarefa">

                <input
                    type="text"
                    name="titulo"
                    placeholder="Título da tarefa"
                    required
                >

                <textarea
                    name="descricao"
                    placeholder="Descrição da tarefa"
                ></textarea>

                <input
                    type="text"
                    name="disciplina"
                    placeholder="Disciplina"
                    required
                >

                <button type="submit">Adicionar tarefa</button>

            </form>

        </section>

        <section class="painel gerenciamento">

            <div class="painel-titulo">
                <div>
                    <p class="etiqueta">SEU ORGANIZADOR</p>
                    <h2>Tarefas cadastradas</h2>
                </div>
                <span class="icone">✓</span>
            </div>

            <div class="lista-tarefas">

                % if tarefas:
                    % for tarefa in tarefas:

                        <article class="tarefa-cadastrada">

                            <h3>{{tarefa.titulo}}</h3>

                            <p>{{tarefa.descricao}}</p>

                            <p>
                                <strong>Disciplina:</strong>
                                {{tarefa.disciplina}}
                            </p>

                            <p>
                                <strong>Status:</strong>
                                {{tarefa.status}}
                            </p>

                            <div class="acoes-tarefa">

                                <form action="/tarefas/atualizar" method="POST" class="form-editar">

                                    <input
                                        type="hidden"
                                        name="id"
                                        value="{{tarefa.id}}"
                                    >

                                    <h4>Editar tarefa</h4>

                                    <input
                                        type="text"
                                        name="titulo"
                                        value="{{tarefa.titulo}}"
                                        placeholder="Título"
                                        required
                                    >

                                    <textarea
                                        name="descricao"
                                        placeholder="Descrição"
                                    >{{tarefa.descricao}}</textarea>

                                    <input
                                        type="text"
                                        name="disciplina"
                                        value="{{tarefa.disciplina}}"
                                        placeholder="Disciplina"
                                        required
                                    >

                                    <select name="status">

                                        % if tarefa.status == "Pendente":
                                            <option value="Pendente" selected>
                                                Pendente
                                            </option>
                                            <option value="Concluida">
                                                Concluída
                                            </option>
                                        % else:
                                            <option value="Pendente">
                                                Pendente
                                            </option>
                                            <option value="Concluida" selected>
                                                Concluída
                                            </option>
                                        % end

                                    </select>

                                    <button type="submit" class="botao-editar">
                                        Salvar alterações
                                    </button>

                                </form>

                                <form action="/tarefas/excluir" method="POST">

                                    <input
                                        type="hidden"
                                        name="id"
                                        value="{{tarefa.id}}"
                                    >

                                    <button type="submit" class="excluir">
                                        Excluir tarefa
                                    </button>

                                </form>

                            </div>

                        </article>

                    % end

                % else:

                    <p class="sem-tarefas">
                        Nenhuma tarefa cadastrada ainda.
                        Comece adicionando sua primeira atividade!
                    </p>

                % end

            </div>

        </section>

        <section class="lembrete">
            <span class="aspas">“</span>
            <p>
                Cada tarefa concluída é mais um passo
                em direção aos seus objetivos.
            </p>
        </section>

    </main>

    <footer>
        <p>ESTAÇÃO DE ESTUDOS · Aprender é construir o futuro.</p>
    </footer>

</body>
</html>
