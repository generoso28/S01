import java.util.ArrayList;

public class Castelo {
    public String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.nome = nome;
        this.divisoes = divisoes;
    }
    public void adicionarDivisao(Divisao divisao){
        // implementar lógica para adicionar divisão
        divisoes.add(divisao);
    }
}
