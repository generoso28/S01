from abc import ABC, abstractmethod
from typing import List

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self) -> str:
        pass

class Implante:
    def __init__(self, custo: float, funcao: str):
        self._custo = custo
        self._funcao = funcao
    def __repr__(self) -> str:
        return f"Implante de {self._funcao} (Custo: {self._custo})"

class NetRunner(Cibernetico):
    def __init__(self, nome: str, funcao_implante: str, custo_implante: float):
        self._nome = nome
        self._implante = Implante(custo=custo_implante, funcao=funcao_implante)
    def realizar_hack(self) -> str:
        return f"{self._nome} está realizando um hack usando {self._implante._funcao}!"
    
class Faccao:
    def __init__(self, nome: str, membros: List[Cibernetico]):
        self._nome = nome
        self._membros = membros
        
    def realizar_hack_faccao(self):
        print(f"--- Fação {self._nome} iniciando hack coletivo! ---")
        for membro in self._membros:
            print(membro.realizar_hack())
        print("--------------------------------------------------")

def main():
    netrunner1 = NetRunner(nome="Neo", funcao_implante="Infiltração de Dados", custo_implante=5000.0)
    netrunner2 = NetRunner(nome="Trinity", funcao_implante="Criptografia Avançada", custo_implante=7500.0)
    membros_hackers = [netrunner1, netrunner2]
    faccao_cyber_phantoms = Faccao(nome="CyberPhantoms", membros=membros_hackers)
    faccao_cyber_phantoms.realizar_hack_faccao()

if __name__ == "__main__":
    main()