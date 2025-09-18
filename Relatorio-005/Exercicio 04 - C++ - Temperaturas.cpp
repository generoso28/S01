/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>

#include <iostream>

double celsiusParaFahrenheit(double celsius){
    return (celsius*9.0/5.0)+32.0;
}
double celsiusParaKelvin(double celsius){
    return celsius+273.15;
}

int main()
{
    int opcao;
    double temp;
    
    do{
        std::cout << "1- Celsius para Fahrenheit\n";
        std::cout << "2- Celsius para Kelvin\n";
        std::cout << "3- Sair\n";
        std::cout << "Digite a opção desejada: ";
        std::cin >> opcao;
        switch(opcao){
            case 1:
                std::cout << "Digite a temperatura em Celsius: ";
                std::cin >> temp;
                std::cout<<celsiusParaFahrenheit(temp)<<"\n";
            break;
            case 2:
                std::cout << "Digite a temperatura em Celsius: ";
                std::cin >> temp;
                std::cout<<celsiusParaKelvin(temp)<<"\n";
            break;
        }
            
    }
    while(opcao!=3);
}