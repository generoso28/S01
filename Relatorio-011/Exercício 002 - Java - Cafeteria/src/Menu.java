import java.util.ArrayList;

public class Menu {
    private ArrayList<Cafe> itens;
    public Menu(ArrayList<Cafe> itens) {
        this.itens = itens;
    }
    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }
}
