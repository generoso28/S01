numeros = {}
pares = {}

-- Lê todos os 5 números primeiro
print("Digite 5 números:")
for i = 1, 5 do
    -- io.read() lê um texto. tonumber() converte para número.
    numeros[i] = tonumber(io.read())
end
-- Percorre a lista a partir do SEGUNDO número para comparar
for i = 1, 5 do
    if (numeros[i] % 2 == 0) then
        table.insert(pares, numeros[i])
    end
end

print("Os números pares são: " .. table.concat(pares, ", "))