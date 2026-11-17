
class Tarefa:

    def __init__(
        self,
        id,
        titulo,
        descricao,
        disciplina,
        status="Pendente",
        usuario_id=None
    ):
        self.id = id
        self.titulo = titulo
        self.descricao = descricao
        self.disciplina = disciplina
        self.status = status
        self.usuario_id = usuario_id

    def concluir(self):
        self.status = "Concluída"

    def alterar(self, titulo, descricao, disciplina, status):
        self.titulo = titulo
        self.descricao = descricao
        self.disciplina = disciplina
        self.status = status
