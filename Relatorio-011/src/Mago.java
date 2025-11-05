public class Mago extends Personagem {
    private final String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }
    public String lancarFeitico(){
        return "Lançando o feitiço de " + magia + "!";
    }
}
