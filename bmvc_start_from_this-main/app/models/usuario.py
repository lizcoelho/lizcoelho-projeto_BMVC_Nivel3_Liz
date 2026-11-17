
import hashlib
import secrets


class Usuario:

    def __init__(self, id, nome, usuario, senha):
        self.id = id
        self.nome = nome
        self.usuario = usuario

        self.salt = secrets.token_bytes(16)
        self.senha_hash = self.gerar_hash(senha)

    def gerar_hash(self, senha):
        return hashlib.pbkdf2_hmac(
            "sha256",
            senha.encode("utf-8"),
            self.salt,
            200000
        )

    def verificar_senha(self, senha):
        hash_informado = self.gerar_hash(senha)

        return secrets.compare_digest(
            self.senha_hash,
            hash_informado
        )
