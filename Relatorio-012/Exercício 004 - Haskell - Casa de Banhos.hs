module Main where

data Servico = Servico {
    nomeServico :: String,
    tipoServico :: String,
    precoBase :: Double
} deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq)

data Atendimento = Atendimento {
    servicos :: [Servico],
    statusAtendimento :: StatusAtendimento
} deriving (Show)

subTotalServicos :: [Servico] -> Double
subTotalServicos lista = sum (map precoBase lista)

bonusEspiritual :: [Servico] -> Double
bonusEspiritual listaServicos
    | null listaServicos = 0.0
    | otherwise = totalBase + bonus - desconto
    where
        totalBase = subTotalServicos listaServicos
        
        bonus = if length listaServicos > 3
                then totalBase * 0.25
                else 0.0
        
        desconto = if totalBase > 500
                   then totalBase * 0.10
                   else 0.0

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
    | statusAtendimento atendimento == Cancelado = 0.0
    | otherwise = bonusEspiritual (servicos atendimento)

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico atendimento =
    case servicos atendimento of
        [] -> "Nenhum serviço neste atendimento."
        (primeiro:_) -> nomeServico primeiro ++ " (" ++ tipoServico primeiro ++ ")"

main :: IO ()
main = do
    let banhoErvas = Servico "Banho de Ervas Raras" "Banho" 150.0
    let massagemPedras = Servico "Massagem Pedras Quentes" "Massagem" 200.0
    let banqueteNoFace = Servico "Banquete (No-Face)" "Banquete" 800.0
    let banhoSimples = Servico "Banho Simples" "Banho" 50.0

    -- Caso 1: < 3 serviços, > 500 (Aplica só desconto)
    -- Total: 950.0. Bonus: 0. Desconto: 95.0. Final: 855.0
    let at1 = Atendimento [banhoErvas, banqueteNoFace] Finalizado

    -- Caso 2: > 3 serviços, < 500 (Aplica só bônus)
    -- Total: 300.0. Bonus: 75.0. Desconto: 0. Final: 375.0
    let at2 = Atendimento [banhoErvas, banhoSimples, banhoSimples, banhoSimples] EmAndamento

    -- Caso 3: > 3 serviços, > 500 (Aplica bônus e desconto)
    -- Total: 1200.0. Bonus: 300.0. Desconto: 120.0. Final: 1380.0
    let at3 = Atendimento [banhoErvas, massagemPedras, banqueteNoFace, banhoSimples] Finalizado

    -- Caso 4: Cancelado
    -- Total: 0.0
    let at4 = Atendimento [massagemPedras] Cancelado

    -- Caso 5: Vazio
    -- Total: 0.0
    let at5 = Atendimento [] EmAndamento

    putStrLn "--- Casa de Banhos (Yubaba) ---"
    putStrLn ("Atendimento 1 (Finalizado, >500): R$" ++ show (valorFinalAtendimento at1))
    putStrLn ("Atendimento 2 (Em Andamento, >3 Serv): R$" ++ show (valorFinalAtendimento at2))
    putStrLn ("Atendimento 3 (Finalizado, Ambas Regras): R$" ++ show (valorFinalAtendimento at3))
    putStrLn ("Atendimento 4 (Cancelado): R$" ++ show (valorFinalAtendimento at4))
    putStrLn ("Atendimento 5 (Vazio): R$" ++ show (valorFinalAtendimento at5))

    putStrLn "\n--- Detalhes dos Atendimentos ---"
    putStrLn ("Primeiro Serviço (At 1): " ++ descricaoPrimeiroServico at1)
    putStrLn ("Primeiro Serviço (At 2): " ++ descricaoPrimeiroServico at2)
    putStrLn ("Primeiro Serviço (At 5): " ++ descricaoPrimeiroServico at5)