import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        Mago mago = new Mago("Gandalf", 2019, "Fogo");
        System.out.println(mago.lancarFeitico());
        ArrayList<Divisao> divisoes = new ArrayList<>();
        Divisao divisao1 = new Divisao("Torre de Magia");
        Divisao divisao2 = new Divisao("Salão de Reuniões");
        divisoes.add(divisao1);
        divisoes.add(divisao2);
        Castelo castelo = new Castelo("Castelo de Gondor", divisoes);
        Divisao novaDivisao = new Divisao("Biblioteca Secreta");
        castelo.adicionarDivisao(novaDivisao);
    }
}