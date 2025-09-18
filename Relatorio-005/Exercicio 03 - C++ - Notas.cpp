/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>

#include <iostream>

int main()
{
    int tamanho;
    std::cout << "Digite a quantidade de notas que deseja inserir: ";
    std::cin >> tamanho;

    if (tamanho <= 0) {
        std::cout << "Quantidade inválida." << std::endl;
    }
    float soma = 0;
    for (int i = 0; i < tamanho; i++) {
        float nota=-1;
        while (nota < 0 || nota > 10){
            std::cout << "Digite a nota " << i + 1 << " (entre 0 e 10): ";
            std::cin >> nota;

            if (nota < 0 || nota > 10) {
                std::cout << "Nota inválida! Tente novamente." << std::endl;
            }

        } ;
        soma += nota;
    }
    float media = soma / tamanho;
    std::cout << "\nA média final é: " << media << std::endl; 
    if (media >= 7) {
        std::cout << "Resultado: Aprovado" << std::endl;
    } else {
        std::cout << "Resultado: Reprovado" << std::endl;
    }
    return 0;
}