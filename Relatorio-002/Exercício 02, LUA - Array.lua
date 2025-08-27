numeros = {}
local maior

-- Lê todos os 5 números primeiro
print("Digite 5 números:")
for i = 1, 5 do
    -- io.read() lê um texto. tonumber() converte para número.
    numeros[i] = tonumber(io.read())
end

-- Inicializa 'maior' com o primeiro número (agora que já temos todos)
maior = numeros[1]

-- Percorre a lista a partir do SEGUNDO número para comparar
for i = 2, 5 do
    if (numeros[i] > maior) then
        maior = numeros[i]
    end
end

print("O maior número é: " .. maior)