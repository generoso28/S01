public class Main {
    public static void main(String[] args) throws Exception {
        Batalha batalha = new Batalha();

        Boss boss1 = new Boss("Golem de Pedra", 1, "Ponto Fraco: Cristal");
        boss1.adicionarAtaque(new Ataque("Soco de Pedra", 50));
        boss1.adicionarAtaque(new Ataque("Lançar Pedras", 70));

        BossMagico boss2 = new BossMagico("Feiticeiro Sombrio", 2, "Ponto Fraco: Luz");
        boss2.adicionarAtaque(new Ataque("Bola de Fogo", 80));
        boss2.adicionarAtaque(new Ataque("Raio Sombrio", 90));

        batalha.adicionarBoss(boss1);
        batalha.adicionarBoss(boss2);

        batalha.iniciarBatalha("Golem de Pedra");
        batalha.iniciarBatalha("Feiticeiro Sombrio");
        batalha.iniciarBatalha("Dragão de Fogo"); // Teste de boss inexistente
    }
}
