num1 = num
num2 = num
operacao = op
function calculadora(num1, num2, operacao)
    if operacao == "+" then
        return num1 + num2
    elseif operacao == "-" then
        return num1 - num2
    elseif operacao == "*" then
        return num1 * num2
    elseif operacao == "/" then
        return num1 / num2
    else
        return "Operação inválida"
    end
end
print("Calculadora Simples")
print("Digite o primeiro número:")
num1=tonumber(io.read())
print("Digite o segundo número:")
num2=tonumber(io.read())
print("Digite a operação (+, -, *, /):")
operacao=io.read()
resultado = calculadora(num1, num2, operacao)
print("O resultado é: " .. resultado)
