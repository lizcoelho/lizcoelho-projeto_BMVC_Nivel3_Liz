
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entrar | Estação de Estudos</title>
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
            <p class="etiqueta">BEM-VINDA DE VOLTA</p>
            <h1>Acesse sua <span>conta.</span></h1>
            <p class="descricao">
                Entre para continuar organizando suas atividades
                e acompanhando seu progresso.
            </p>
        </section>

        <section class="painel">

            <div class="painel-titulo">
                <div>
                    <p class="etiqueta">LOGIN</p>
                    <h2>Entrar na Estação</h2>
                </div>
                <span class="icone">↗</span>
            </div>

            <form action="/login" method="POST" class="form-tarefa">

                <input
                    type="text"
                    name="usuario"
                    placeholder="Nome de usuário"
                    required
                >

                <input
                    type="password"
                    name="senha"
                    placeholder="Sua senha"
                    required
                >

                <button type="submit">Entrar</button>

            </form>

            <p class="orientacao">
                Ainda não possui uma conta?
                <a href="/cadastro">Cadastre-se</a>
            </p>

        </section>

        <section class="lembrete">
            <span class="aspas">“</span>
            <p>
                Seu próximo avanço começa com um novo passo.
                Continue aprendendo!
            </p>
        </section>

    </main>

    <footer>
        <p>ESTAÇÃO DE ESTUDOS · Aprender é construir o futuro.</p>
    </footer>

</body>
</html>
