using System;

public abstract class Pokemon
{
    private string nome;

    public Pokemon(string nome)
    {
        this.nome = nome;
    }

    public abstract void Atacar();
}
public class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine("Lança um jato de fogo!");
    }
}
public class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine("Lança um jato de água!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {

        Pokemon[] pokemons = new Pokemon[2];
        Pokemon charizard = new PokemonDeFogo("Charizard");
        Pokemon blastoise = new PokemonDeAgua("Blastoise");
        pokemons[0] = charizard;
        pokemons[1] = blastoise;

        foreach (var pokemon in pokemons)
        {
            pokemon.Atacar();
        }
    }
}