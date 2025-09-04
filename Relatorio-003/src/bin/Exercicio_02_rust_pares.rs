fn is_even(n: i32) -> bool {
    n % 2 == 0
}

fn main() {
    enum Choice {
        Even,
        Odd,
    }

    let mut input = String::new();

    println!("Jogador 1, insira um número inteiro: ");
    std::io::stdin().read_line(&mut input).expect("Falha ao ler a linha");
    let num_player1: i32 = input.trim().parse().expect("Por favor, insira um número válido");

    println!("Jogador 1, você escolhe par ou ímpar? (p/i):");
    input.clear();
    std::io::stdin().read_line(&mut input).expect("Falha ao ler a linha");

    let even_player1 = match input.trim() {
        "p" => Choice::Even,
        "i" => Choice::Odd,
        _ => {
            println!("Escolha inválida, assumindo PAR por padrão.");
            Choice::Even
        }
    };

    println!("Jogador 2, insira um número inteiro:");
    input.clear();
    std::io::stdin().read_line(&mut input).expect("Falha ao ler a linha");
    let num_player2: i32 = input.trim().parse().expect("Por favor, insira um número válido");

    let soma = num_player1 + num_player2;
    println!("\nJogador 1 jogou: {}", num_player1);
    println!("Jogador 2 jogou: {}", num_player2);
    println!("A soma dos números é: {}", soma);

    let soma_is_even = is_even(soma);

    let player1_wins = match even_player1 {
        Choice::Even => soma_is_even,
        Choice::Odd => !soma_is_even,
    };

    if player1_wins {
        println!("Resultado: DEU PAR! Jogador 1 vence!");
    } else {
        println!("Resultado: DEU ÍMPAR! Jogador 2 vence!");
    }
}