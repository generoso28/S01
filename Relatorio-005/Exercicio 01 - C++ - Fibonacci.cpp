/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>

int fibonacci(int n){
    if (n==0){
        return 0;
    }else if(n==1){
        return 1;
    }else{
        return fibonacci(n-1)+fibonacci(n-2);
    }
}

int main()
{
    int n;
    std::cout<<"Digite um número: ";
    std::cin >> n;
    std::cout<<fibonacci(n);
    return 0;
}