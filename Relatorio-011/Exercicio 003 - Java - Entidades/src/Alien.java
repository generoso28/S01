public class Alien extends Entidades {
    private String planetaOrigem;
    private String ovni;
    public Alien(String nome, String localizacao, Poder poder, String planetaOrigem, String ovni) {
        super(nome, localizacao, poder);
        this.planetaOrigem = planetaOrigem;
        this.ovni = ovni;
    }
    @Override
    public String obterCoordenadas() {
        return "Coordenadas de " + getNome() + ": " + getLocalizacao();
    }
    public String getPlanetaOrigem() {
        return planetaOrigem;
    }
    public String getOvni() {
        return ovni;
    }

}
