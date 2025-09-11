package main

import "fmt"

func verificarLogin(usuario, senha string) bool {
	const usuario_valido = "senha"
	const senha_valida = "admin"
	if usuario == usuario_valido && senha == senha_valida {
		fmt.Println("login bem sucedido")
		return true
	}
	fmt.Println("Usuário ou senha inválidos. Tente novamente.")
	return false
}

func main() {
	var senha string
	var usuario string
	var verificado bool = false
	for !verificado {
		fmt.Print("Digite seu usuário: ")
		fmt.Scan(&usuario)
		fmt.Print("Digite sua senha: ")
		fmt.Scan(&senha)
		verificado = verificarLogin(usuario, senha)
	}
}
