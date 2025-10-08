using System;
public class MonstroSombrio
{
    protected string Nome;

    public MonstroSombrio(string nome)
    {
        this.Nome = nome;
    }

    public virtual void Mover(){
		Console.WriteLine($"{Nome} se move de uma forma misteriosa.");
	}
}

public class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome)
    {
    }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} se move lentamente, arrastando os pés.");
    }
}

public class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome)
    {
    }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} flutua rapidamente, quase sem fazer barulho.");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        MonstroSombrio[] horda = new MonstroSombrio[2];
        horda[0] = new Zumbi("Zumbi Lento");
        horda[1] = new Espectro("Espectro Rápido");

        foreach (var monstro in horda)
        {
            monstro.Mover();
        }
    }
}