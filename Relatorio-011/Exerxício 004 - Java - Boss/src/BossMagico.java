public class BossMagico extends Boss{
    public BossMagico(String nome, int idBoss, String pontoFraco) {
        super(nome, idBoss, pontoFraco);
    }
    @Override
    public void iniciarFase(){
        System.out.println("Boss Magico " + nome + " iniciou a fase!");
    }
}
