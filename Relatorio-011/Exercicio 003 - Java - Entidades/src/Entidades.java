public class Entidades implements IRastreavel {
    public String nome;
    private String localizacao;
    private Poder poder;
    public String getLocalizacao() {
        return localizacao;
    }
    public String getNome() {
        return nome;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }
    public Poder getPoder() {
        return poder;
    }
    public Entidades(String nome, String localizacao, Poder poder) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.poder = poder;
    }

    @Override
    public String obterCoordenadas() {
        return "Coordenadas de " + nome + ": " + localizacao;
    }
}
