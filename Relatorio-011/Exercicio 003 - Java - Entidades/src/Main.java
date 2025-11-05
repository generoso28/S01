public class Main {
    public static void main(String[] args) throws Exception {
        Poder poderYoukai = new Poder("Invisibilidade");
        Youkai youkai = new Youkai("Kappa", "34.0522°N, 118.2437°W", poderYoukai);
        System.out.println(youkai.obterCoordenadas());
        System.out.println(youkai.getPoder().getNome());
        Poder poderAlien = new Poder("Teletransporte");
        Alien alien = new Alien("Zorg", "51.5074°N, 0.1278°W", poderAlien, "Zebes", "OVNI-1234");
        System.out.println(alien.obterCoordenadas());
        System.out.println(alien.getPoder().getNome());
        System.out.println(alien.getPlanetaOrigem());
        System.out.println(alien.getOvni());
    }
}
