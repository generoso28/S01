using System.Collections.Generic;
using System;

public class Feitico
{
    public string Nome { get; set; }
    public int Nivel { get; set; }

    public Feitico(string nome, int nivel)
    {
        Nome = nome;
        Nivel = nivel;
    }
}
public class Grimorio
{
    private List<Feitico> feiticos;

    public Grimorio()
    {
        feiticos = new List<Feitico>();
    }

    public void AdicionarFeitico(Feitico feitico)
    {
        feiticos.Add(feitico);
    }

    public void ListarFeiticos()
    {
        Console.WriteLine("Feitiços no Grimório:");
        foreach (var feitico in feiticos)
        {
            Console.WriteLine($"- {feitico.Nome} (Nível {feitico.Nivel})");
        }
    }
}

public class Ferramenta
{
    public string Nome { get; set; }

    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}
public class Maga
{
    public Grimorio Grimorio { get; private set; }
    public List<Ferramenta> Ferramentas { get; private set; }

    public Maga(List<Ferramenta> ferramentas)
    {
        Grimorio = new Grimorio();
        Ferramentas = ferramentas;
    }

    public void ListarFerramentas()
    {
        Console.WriteLine("Ferramentas de Sobrevivência:");
        foreach (var ferramenta in Ferramentas)
        {
            Console.WriteLine($"- {ferramenta.Nome}");
        }
    }
}
public class Program
{
    public static void Main(string[] args)
    {
        List<Ferramenta> ferramentas = new List<Ferramenta>
        {
            new Ferramenta("Capacete"),
            new Ferramenta("Lanterna"),
            new Ferramenta("Corda")
        };

        Maga frieren = new Maga(ferramentas);

        frieren.Grimorio.AdicionarFeitico(new Feitico("Bola de Fogo", 3));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Cura", 2));

        frieren.Grimorio.ListarFeiticos();
        frieren.ListarFerramentas();
    }
}