package main

import "fmt"

func Fibonacci(number int) int {
	if number <= 1 {
		fmt.Println(number)
		return number
	}

	cache := make(map[int]int)
	cache[0] = 0
	cache[1] = 1

	for currentIndice := 2; currentIndice <= number; currentIndice++ {
		lastIndice := currentIndice - 1
		penultIndice := currentIndice - 2

		cache[currentIndice] = cache[lastIndice] + cache[penultIndice]
		fmt.Println(cache[currentIndice])
	}

	return cache[number]

}

func main() {
	var numero int
	fmt.Println("Digite um número: ")
	fmt.Scan(&numero)
	Fibonacci(numero)
}
