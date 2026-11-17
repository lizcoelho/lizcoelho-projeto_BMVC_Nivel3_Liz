
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar conta | Estação de Estudos</title>
    <link rel="stylesheet" href="/static/css/estudos.css">
</head>
<body>

    <header class="topo">
        <div class="marca">ESTAÇÃO <span>DE ESTUDOS</span></div>
        <p>Seu espaço para aprender com propósito.</p>
    </header>

    <main class="container">

        <a href="/" class="botao-voltar">← Voltar</a>

        <section class="apresentacao">
            <p class="etiqueta">NOVA CONTA</p>
            <h1>Comece sua <span>jornada.</span></h1>
            <p class="descricao">
                Crie sua conta para organizar seus estudos
                e acompanhar seu desenvolvimento.
            </p>
        </section>

        <section class="painel">

            <div class="painel-titulo">
                <div>
                    <p class="etiqueta">CADASTRO</p>
                    <h2>Criar minha conta</h2>
                </div>
                <span class="icone">✦</span>
            </div>

            <form action="/cadastro" method="POST" class="form-tarefa">

                <input
                    type="text"
                    name="nome"
                    placeholder="Seu nome"
                    maxlength="80"
                    required
                >

                <input
                    type="text"
                    name="usuario"
                    placeholder="Escolha um nome de usuário"
                    maxlength="30"
                    required
                >

                <input
                    type="password"
                    name="senha"
                    placeholder="Crie uma senha (mínimo 8 caracteres)"
                    minlength="8"
                    required
                >

                <button type="submit">Criar conta</button>

            </form>

            <p class="orientacao">
                Já possui uma conta?
                <a href="/login">Entrar</a>
            </p>

        </section>

        <section class="lembrete">
            <span class="aspas">“</span>
            <p>
                Cada jornada começa com uma decisão.
                Dê o primeiro passo!
            </p>
        </section>

    </main>

    <footer>
        <p>ESTAÇÃO DE ESTUDOS · Aprender é construir o futuro.</p>
    </footer>

</body>
</html>
