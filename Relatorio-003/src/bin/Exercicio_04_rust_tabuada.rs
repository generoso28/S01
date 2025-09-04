fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior{
        println!("{} x {} = {}", numero, i, numero * i);
    }
}
fn main() {
    let mut input = String::new();
    println!("Digite um número: ");
    std::io::stdin().read_line(&mut input).expect("Falha ao ler a linha");
    let numero: i32 = input.trim().parse().expect("Por favor, insira um número válido");
    input.clear();
    println!("Digite o limite inferior: ");
    std::io::stdin().read_line(&mut input).expect("Falha ao ler a linha");
    let limite_inferior: i32 = input.trim().parse().expect("Por favor, insira um número válido");
    input.clear();
    println!("Digite o limite superior: ");
    std::io::stdin().read_line(&mut input).expect("Falha ao ler a linha");
    let limite_superior: i32 = input.trim().parse().expect("Por favor, insira um número válido");
    println!("Tabuada de {} de {} a {}:", numero, limite_inferior, limite_superior);
    imprimir_tabuada(numero, limite_inferior, limite_superior);
}