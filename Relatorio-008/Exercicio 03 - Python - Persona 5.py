from typing import List

class ArmaCorpoACorpo:
    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = dano
    def __str__(self):
        return f"{self.nome} (Dano: {self.dano})"

class PhantomThief:
    def __init__(self, nome: str, arma: ArmaCorpoACorpo):
        self._nome = nome
        self._arma = arma

class Joker:
    def __init__(self, nome: str, companheiros: List[PhantomThief]):
        self._nome = nome

        self._arma = ArmaCorpoACorpo("Adaga Veloz", 120)
        
        self._companheiros = companheiros

    def mostrar_equipe(self):
        print("="*35)
        print("Equipe Phantom Thieves of Hearts")
        print("="*35)
        print(f"- {self._nome} (Líder) | Arma: {self._arma}")
        
        print("\nMembros:")
        for companheiro in self._companheiros:
            print(f"- {companheiro._nome} | Arma: {companheiro._arma}")
        print("="*35)

def main():
    arma_ryuji = ArmaCorpoACorpo("Cano de Aço", 150)
    arma_ann = ArmaCorpoACorpo("Chicote de Couro", 130)

    ryuji = PhantomThief(nome="Ryuji Sakamoto", arma=arma_ryuji)
    ann = PhantomThief(nome="Ann Takamaki", arma=arma_ann)

    equipe_inicial = [ryuji, ann]
    joker = Joker(nome="Ren Amamiya", companheiros=equipe_inicial)

    joker.mostrar_equipe()
if __name__ == "__main__":
    main()