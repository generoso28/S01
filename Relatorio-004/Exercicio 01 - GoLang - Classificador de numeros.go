package main

import "fmt"

func classificar_numero(numero int) {
	if numero > 0 {
		fmt.Println("O número é positivo")
	} else if numero < 0 {
		fmt.Println("O número é negativo")
	} else {
		fmt.Println("O número é zero")
	}
}

func main() {
	var numero int
	fmt.Println("Digite um número: ")
	fmt.Scan(&numero)
	classificar_numero(numero)
}
