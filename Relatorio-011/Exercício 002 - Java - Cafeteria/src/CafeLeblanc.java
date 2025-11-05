public class CafeLeblanc {
    private Menu menu;

    public CafeLeblanc(Menu menu) {
        this.menu = menu;
    }
    public void receberPedido(Cafe cafe) {
        double precoFinal = cafe.calcularPrecoFinal();
        System.out.println("Pedido recebido: " + cafe.nome + ". Preço final: R$ " + precoFinal);
    }
}
