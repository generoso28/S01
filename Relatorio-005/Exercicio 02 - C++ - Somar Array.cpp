/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>

float somarArray(float arr[], int tamanho){
    float soma=0;
    for(int i=0;i<tamanho;i++){
        soma+=arr[i];
    }
    return soma;
}

int main()
{
    int tamanho;
    std::cout<<"Digite um tamanho: ";
    std::cin >> tamanho;
    float arr[tamanho];
    for(int i=0; i<tamanho;i++){
        float valor;
        std::cout<<"Digite um valor: ";
        std::cin >> arr[i];
    }
    std::cout<<somarArray(arr, tamanho);
    return 0;
}