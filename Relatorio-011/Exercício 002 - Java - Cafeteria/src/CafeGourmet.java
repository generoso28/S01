public class CafeGourmet extends Cafe {
    public double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }
    public double calcularPrecoFinal() {
        return super.calcularPrecoFinal() + bonusAroma;
    }
}
