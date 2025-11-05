import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws Exception {
        Cafe cafe1 = new Cafe("Expresso", 5.0);
        CafeGourmet cafe2 = new CafeGourmet("Cappuccino", 7.0, 3.0);

        ArrayList<Cafe> itensMenu = new ArrayList<>();
        itensMenu.add(cafe1);
        itensMenu.add(cafe2);

        Menu menu = new Menu(itensMenu);
        CafeLeblanc cafeteria = new CafeLeblanc(menu);

        cafeteria.receberPedido(cafe1);
        cafeteria.receberPedido(cafe2);
    }
}
