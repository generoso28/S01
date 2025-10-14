from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self._nome = nome
        self._funcao = funcao
    
    @abstractmethod
    def usar_ultimate(self):
        pass

class Tanque(Heroi):
    def __init__(self, nome: str, funcao:str, vida_extra: int):
        super().__init__(nome, funcao)
        self._vida_extra = vida_extra

    def usar_ultimate(self):
        return f"{self._nome} ativou a ultimate e ganhou {self._vida_extra} de vida extra!"
    
class Dano(Heroi):
    def __init__(self, nome: str, funcao: str, dano_extra: int):
        super().__init__(nome, funcao)
        self._dano_extra = dano_extra

    def usar_ultimate(self):
        return f"{self._nome} ativou a ultimate e causou {self._dano_extra} de dano extra!"
    
def main():
    lista_herois = [
        Tanque("Reinhardt", "Tanque", 500),
        Dano("Reaper", "Dano", 200)
    ]

    for heroi in lista_herois:
        print(heroi.usar_ultimate())
if __name__ == "__main__":
    main()