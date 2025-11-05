import java.util.HashMap;

public class Registros {
    public String nomeEquipe;
    private HashMap<Entidades, String> avistamentos;
    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
    }
    public boolean registrarAvistamento(Entidades entidade, String nome) {
        if (!avistamentos.containsKey(entidade)) {
            avistamentos.put(entidade, nome);
            return true;
        }
        return false;
    }
}
