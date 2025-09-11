package main

import "fmt"

func classificar_pares(numero int) {
	switch {
	case numero%2 == 0:
		fmt.Println("O número é par")
	case numero%2 != 0:
		fmt.Println("O número é ímpar")
	}
}

func main() {
	var numero int
	fmt.Println("Digite um número: ")
	fmt.Scan(&numero)
	classificar_pares(numero)
}
