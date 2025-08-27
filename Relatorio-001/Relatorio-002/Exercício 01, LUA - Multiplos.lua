-- Pede e valida a entrada do usuário para 'x'
local x
repeat
  print("Digite o número que você quer encontrar os divisores (x):")
  x = io.read("*n")
  if not x then
    print("Entrada inválida. Por favor, digite um número.")
  end
until x

-- Pede e valida a entrada do usuário para 'm' (início do intervalo)
local m
repeat
  print("Digite o INÍCIO do intervalo de busca (m):")
  m = io.read("*n")
  if not m then
    print("Entrada inválida. Por favor, digite um número.")
  end
until m

-- Pede e valida a entrada do usuário para 'n' (fim do intervalo)
local n
repeat
  print("Digite o FIM do intervalo de busca (n):")
  n = io.read("*n")
  if not n then
    print("Entrada inválida. Por favor, digite um número.")
  end
until n

-- Garante que 'm' seja o menor valor para o laço funcionar corretamente
if m > n then
  print("Aviso: o início do intervalo (m) era maior que o fim (n). Os valores foram invertidos.")
  m, n = n, m -- Inverte os valores de m e n
end

print("\nDivisores de " .. x .. " encontrados no intervalo [" .. m .. ", " .. n .. "], do menor para o maior:")

for i = m, n do
  -- Pula a iteração se 'i' for zero para evitar erro de divisão por zero
  if i ~= 0 then
    -- Verifica se 'i' é um divisor de 'x'
    if x % i == 0 then
      print(i)
    end
  end
end

print("\nBusca finalizada.")