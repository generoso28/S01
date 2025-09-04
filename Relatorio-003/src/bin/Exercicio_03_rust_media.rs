fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let media = (2.0*nota1 + 3.0*nota2 + 5.0*nota3) / 10.0;
    media
}
fn main() {
    let nota1: f64 = 7.5;
    let nota2: f64 = 8.0;
    let nota3: f64 = 9.2;
    let media = calcular_media(nota1, nota2, nota3);
    println!("A média ponderada é: {:.2}", media);
    if media >= 7.0 {
        println!("Aluno aprovado!");
    } else {
        println!("Aluno reprovado!");
    }
}