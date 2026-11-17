
from app.controllers.application import Application
from bottle import (
    Bottle,
    run,
    request,
    response,
    static_file,
    redirect
)

app = Bottle()
ctl = Application()

CHAVE_SECRETA = "estacao_estudos_chave_privada_2026"


# Recuperar o usuário autenticado
def usuario_logado():
    id_usuario = request.get_cookie(
        "usuario_id",
        secret=CHAVE_SECRETA
    )

    if not id_usuario:
        return None

    try:
        return ctl.buscar_usuario_por_id(int(id_usuario))
    except (ValueError, TypeError):
        return None


# Proteger páginas e operações
def exigir_login():
    usuario = usuario_logado()

    if not usuario:
        redirect("/login")

    return usuario


# Arquivos estáticos
@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')


# Página original do BMVC
@app.route('/helper')
def helper():
    return ctl.render('helper')


# Página inicial
@app.route('/')
def inicio():
    return ctl.render('inicio')


# Página de cadastro
@app.route('/cadastro')
def cadastro():
    return ctl.render('cadastro')


# Processar cadastro
@app.route('/cadastro', method='POST')
def cadastrar_usuario():
    nome = request.forms.get('nome', '').strip()
    usuario = request.forms.get('usuario', '').strip()
    senha = request.forms.get('senha', '')

    if not nome or not usuario or not senha:
        return "Preencha todos os campos."

    if len(senha) < 8:
        return "A senha deve ter pelo menos 8 caracteres."

    resultado = ctl.cadastrar_usuario(nome, usuario, senha)

    if not resultado:
        return "Esse nome de usuário já está cadastrado."

    redirect('/login')


# Página de login
@app.route('/login')
def login():
    return ctl.render('login')


# Processar login
@app.route('/login', method='POST')
def autenticar():
    usuario = request.forms.get('usuario', '').strip()
    senha = request.forms.get('senha', '')

    resultado = ctl.autenticar_usuario(usuario, senha)

    if resultado:
        response.set_cookie(
            'usuario_id',
            str(resultado.id),
            secret=CHAVE_SECRETA,
            path='/',
            max_age=3600,
            httponly=True,
            samesite='Lax'
        )

        redirect('/restrito')

    return "Usuário ou senha inválidos. Volte e tente novamente."


# Encerrar sessão
@app.route('/logout')
def logout():
    response.delete_cookie('usuario_id', path='/')
    redirect('/')


# Página restrita
@app.route('/restrito')
def restrito():
    usuario = exigir_login()
    return ctl.pagina_restrita(usuario)


# Página Plano e Progresso
@app.route('/plano')
def plano():
    usuario = exigir_login()
    return ctl.plano(usuario)


# Página Minhas Tarefas
@app.route('/tarefas')
def tarefas():
    usuario = exigir_login()
    return ctl.pagina_tarefas(usuario)


# Cadastrar tarefa
@app.route('/tarefas/adicionar', method='POST')
def adicionar_tarefa():
    usuario = exigir_login()

    titulo = request.forms.get('titulo', '').strip()
    descricao = request.forms.get('descricao', '').strip()
    disciplina = request.forms.get('disciplina', '').strip()

    if not titulo or not disciplina:
        return "Preencha o título e a disciplina."

    ctl.adicionar_tarefa(
        titulo,
        descricao,
        disciplina,
        usuario.id
    )

    redirect('/tarefas')


# Excluir tarefa
@app.route('/tarefas/excluir', method='POST')
def excluir_tarefa():
    usuario = exigir_login()

    try:
        id_tarefa = int(request.forms.get('id'))
    except (ValueError, TypeError):
        return "Identificador de tarefa inválido."

    ctl.excluir_tarefa(id_tarefa, usuario.id)

    redirect('/tarefas')


# Atualizar tarefa
@app.route('/tarefas/atualizar', method='POST')
def atualizar_tarefa():
    usuario = exigir_login()

    try:
        id_tarefa = int(request.forms.get('id'))
    except (ValueError, TypeError):
        return "Identificador de tarefa inválido."

    titulo = request.forms.get('titulo', '').strip()
    descricao = request.forms.get('descricao', '').strip()
    disciplina = request.forms.get('disciplina', '').strip()

    status_recebido = request.forms.get('status', '').strip()

    # O formulário envia o status sem acento
    if status_recebido == 'Pendente':
        status = 'Pendente'

    elif status_recebido == 'Concluida':
        status = 'Concluída'

    else:
        print("STATUS RECEBIDO:", repr(status_recebido))
        return "Status inválido."

    if not titulo or not disciplina:
        return "Preencha o título e a disciplina."

    ctl.atualizar_tarefa(
        id_tarefa,
        titulo,
        descricao,
        disciplina,
        status,
        usuario.id
    )

    redirect('/tarefas')


# Iniciar servidor
if __name__ == '__main__':
    print("\nEstação de Estudos iniciada!")
    print("Acesse: http://localhost:8080/\n")

    run(app, host='0.0.0.0', port=8080, debug=True)
