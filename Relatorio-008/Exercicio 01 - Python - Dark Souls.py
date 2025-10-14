class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    @property
    def vida(self):
        return self._vida

    @vida.setter
    def vida(self, novo_valor: int):
        if novo_valor < 0:
            self._vida = 0
        else:
            self._vida = novo_valor

    def __str__(self):
        return f'Personagem com {self.vida} de vida.'


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self._armadura_pesada = armadura_pesada

    @property
    def armadura_pesada(self):
        return self._armadura_pesada

    @armadura_pesada.setter
    def armadura_pesada(self, status: bool):
        self._armadura_pesada = status

    def __str__(self):
        return f'Cavaleiro com {self.vida} de vida e armadura pesada: {self.armadura_pesada}.'

def main():
    chosen_undead = Cavaleiro(vida=150, resistencia=70, armadura_pesada=True)

    print("Estado inicial:")
    print(chosen_undead)

    print("-" * 20)

    print(f"Vida atual do cavaleiro: {chosen_undead.vida}")

    print("\nO cavaleiro levou um golpe!")
    chosen_undead.vida -= 40
    print(f"Vida após o golpe: {chosen_undead.vida}")

    print("\nO cavaleiro caiu de um penhasco!")
    chosen_undead.vida = -50
    print(f"Vida após a queda: {chosen_undead.vida}")

    print("-" * 20)

    print("Estado final:")
    print(chosen_undead)
if __name__ == "__main__":
    main()