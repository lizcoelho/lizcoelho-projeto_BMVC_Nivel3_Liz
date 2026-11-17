
from bottle import template

from app.models.tarefa import Tarefa
from app.models.usuario import Usuario


class Application:

    def __init__(self):
        self.pages = {
            'inicio': self.inicio,
            'cadastro': self.pagina_cadastro,
            'login': self.pagina_login,
            'plano': self.plano,
            'tarefas': self.pagina_tarefas
        }

        self.usuarios = []
        self.tarefas = []

        self.proximo_usuario_id = 1
        self.proximo_tarefa_id = 1

    # Páginas
    def render(self, page):
        content = self.pages.get(page, self.helper)
        return content()

    def helper(self):
        return template('app/views/html/helper')

    def inicio(self):
        return template('app/views/html/inicio')

    def pagina_cadastro(self):
        return template('app/views/html/cadastro')

    def pagina_login(self):
        return template('app/views/html/login')

    def plano(self, usuario):
        return template(
            'app/views/html/estudos',
            usuario=usuario
        )

    def pagina_tarefas(self, usuario):
        return template(
            'app/views/html/tarefas',
            tarefas=self.listar_tarefas(usuario.id),
            usuario=usuario
        )

    def pagina_restrita(self, usuario):
        return template(
            'app/views/html/restrito',
            usuario=usuario
        )

    # Cadastro de usuários
    def cadastrar_usuario(self, nome, usuario, senha):
        if self.buscar_usuario(usuario):
            return False

        novo_usuario = Usuario(
            self.proximo_usuario_id,
            nome,
            usuario,
            senha
        )

        self.usuarios.append(novo_usuario)
        self.proximo_usuario_id += 1

        return novo_usuario

    # Buscar usuário pelo nome de usuário
    def buscar_usuario(self, nome_usuario):
        for usuario in self.usuarios:
            if usuario.usuario == nome_usuario:
                return usuario

        return None

    # Autenticação
    def autenticar_usuario(self, nome_usuario, senha):
        usuario = self.buscar_usuario(nome_usuario)

        if usuario and usuario.verificar_senha(senha):
            return usuario

        return None

    # Buscar usuário pelo ID
    def buscar_usuario_por_id(self, usuario_id):
        for usuario in self.usuarios:
            if usuario.id == usuario_id:
                return usuario

        return None

    # CREATE - Cadastrar tarefa
    def adicionar_tarefa(
        self,
        titulo,
        descricao,
        disciplina,
        usuario_id
    ):
        tarefa = Tarefa(
            self.proximo_tarefa_id,
            titulo,
            descricao,
            disciplina,
            usuario_id=usuario_id
        )

        self.tarefas.append(tarefa)
        self.proximo_tarefa_id += 1

        return tarefa

    # READ - Listar tarefas de um usuário
    def listar_tarefas(self, usuario_id):
        return [
            tarefa for tarefa in self.tarefas
            if tarefa.usuario_id == usuario_id
        ]

    # READ - Buscar tarefa pertencente ao usuário
    def buscar_tarefa(self, id, usuario_id):
        for tarefa in self.tarefas:
            if (
                tarefa.id == id
                and tarefa.usuario_id == usuario_id
            ):
                return tarefa

        return None

    # UPDATE - Atualizar tarefa
    def atualizar_tarefa(
        self,
        id,
        titulo,
        descricao,
        disciplina,
        status,
        usuario_id
    ):
        tarefa = self.buscar_tarefa(id, usuario_id)

        if tarefa:
            tarefa.alterar(
                titulo,
                descricao,
                disciplina,
                status
            )
            return True

        return False

    # DELETE - Excluir tarefa
    def excluir_tarefa(self, id, usuario_id):
        tarefa = self.buscar_tarefa(id, usuario_id)

        if tarefa:
            self.tarefas.remove(tarefa)
            return True

        return False
