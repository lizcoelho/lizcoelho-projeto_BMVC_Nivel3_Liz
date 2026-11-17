
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Área Restrita | Estação de Estudos</title>
    <link rel="stylesheet" href="/static/css/estudos.css">
</head>
<body>

    <header class="topo">
        <div class="marca">ESTAÇÃO <span>DE ESTUDOS</span></div>
        <p>Seu espaço para aprender com propósito.</p>
    </header>

    <main class="container">

        <section class="apresentacao">
            <p class="etiqueta">ÁREA RESTRITA</p>

            <h1>Bem-vinda, <span>{{usuario.nome}}.</span></h1>

            <p class="descricao">
                Seu ambiente de estudos está disponível.
                Organize suas atividades e acompanhe seu progresso.
            </p>
        </section>

        <section class="painel">

            <div class="painel-titulo">
                <div>
                    <p class="etiqueta">ACESSO AUTENTICADO</p>
                    <h2>Seu espaço pessoal</h2>
                </div>
                <span class="icone">✓</span>
            </div>

            <p class="orientacao">
                Você entrou no sistema com sucesso.
                Escolha uma das opções abaixo para continuar.
            </p>

            <div class="opcoes-menu">

                <a href="/plano" class="opcao-menu">
                    <span class="icone">✦</span>
                    <h3>Plano e Progresso</h3>
                    <p>
                        Organize suas atividades e acompanhe
                        seu desenvolvimento.
                    </p>
                    <span class="acessar">Acessar →</span>
                </a>

                <a href="/tarefas" class="opcao-menu">
                    <span class="icone">✎</span>
                    <h3>Minhas Tarefas</h3>
                    <p>
                        Cadastre, consulte, edite e exclua
                        suas tarefas de estudo.
                    </p>
                    <span class="acessar">Acessar →</span>
                </a>

            </div>

            <p class="orientacao">
                Quando terminar seus estudos, lembre-se de sair da conta.
            </p>

            <a href="/logout" class="botao-voltar">Sair da conta</a>

        </section>

    </main>

    <footer>
        <p>ESTAÇÃO DE ESTUDOS · Aprender é construir o futuro.</p>
    </footer>

</body>
</html>
