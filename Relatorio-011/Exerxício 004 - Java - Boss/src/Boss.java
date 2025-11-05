
import java.util.LinkedHashSet;

public class Boss {
    public String nome;
    private int idBoss;
    private String pontoFraco;
    private LinkedHashSet<Ataque> moveset;
    public Boss(String nome, int idBoss, String pontoFraco) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = pontoFraco;
    }
    public void adicionarAtaque(Ataque ataque) {
        if (moveset == null) {
            moveset = new LinkedHashSet<>();
        }
        moveset.add(ataque);
    }
    public void iniciarFase(){
        System.out.println("Boss " + nome + " iniciou a fase!");
    }
}


