public class MembroDaSociedade
{
    private string nome;
    private string raca;
    private string funcao;
	
    public MembroDaSociedade(string nome, string raca, string funcao)
    {
        this.nome = nome;
        this.raca = raca;
        this.funcao = funcao;
    }

    public void Descrever()
    {
        Console.WriteLine("--------------------------");
        Console.WriteLine($"Nome: {this.nome}");
        Console.WriteLine($"Raça: {this.raca}");
        Console.WriteLine($"Função: {this.funcao}");
        Console.WriteLine("--------------------------");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("Detalhes dos Membros da Sociedade do Anel:");

        MembroDaSociedade aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardião");

        MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");
		
        aragorn.Descrever();
        legolas.Descrever();
    }
}