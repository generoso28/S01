fn verificar_senha(senha: &str) -> bool {
    let tem_maiuscula = senha.chars().any(|c| c.is_ascii_uppercase());
    let tem_numero = senha.chars().any(|c| c.is_digit(10));

    senha.len() >= 8 && tem_maiuscula && tem_numero
}
fn main() {
    let mut senha: String = String::new();
    loop{
        senha.clear();
        println!("Digite sua senha: ");
        std::io::stdin().read_line(&mut senha).expect("Falha ao ler a linha");
        if verificar_senha(&senha.trim()){
            println!("Senha válida! Acesso concedido.");
            break;
        }else{
            println!("Senha inválida! Tente novamente.");
        }
    }


}