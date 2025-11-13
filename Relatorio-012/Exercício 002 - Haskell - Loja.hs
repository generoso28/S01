module Main where

data Item = Item {
    nomeItem :: String,
    categoria :: String,
    precoItem :: Double
} deriving (Show)

data CompraZelda = CompraZelda {
    itens :: [Item]
} deriving (Show)

subTotal :: [Item] -> Double
subTotal listaItens = sum (map precoItem listaItens)

calculaDesconto :: [Item] -> Double
calculaDesconto listaItens =
    let total = subTotal listaItens
    in
        if total > 200.0
        then total * 0.10
        else 0.0

valorFinal :: CompraZelda -> Double
valorFinal compra
    | totalItens > 200.0 = totalItens - desconto
    | otherwise          = totalItens + frete
    where
        listaItens = itens compra
        totalItens = subTotal listaItens
        desconto   = calculaDesconto listaItens
        frete      = 15.0

main :: IO ()
main = do
    let masterSword = Item "Master Sword" "Arma" 150.0
    let hylianShield = Item "Hylian Shield" "Equipamento" 80.0
    let redPotion = Item "Poção Vermelha" "Poção" 20.0
    let arrows = Item "Flechas (x10)" "Arma" 30.0
    let ancientCore = Item "Ancient Core" "Equipamento" 100.0

    let compraCara = CompraZelda [masterSword, hylianShield]
    let compraBarata = CompraZelda [redPotion, arrows]
    let compraMedia = CompraZelda [ancientCore, ancientCore]

    putStrLn "--- Loja de Itens de Hyrule ---"

    putStrLn "\nCompra 1 (Cara):"
    print (itens compraCara)
    putStrLn ("Valor Final (Esperado 207.0): " ++ show (valorFinal compraCara))

    putStrLn "\nCompra 2 (Barata):"
    print (itens compraBarata)
    putStrLn ("Valor Final (Esperado 65.0): " ++ show (valorFinal compraBarata))

    putStrLn "\nCompra 3 (Média):"
    print (itens compraMedia)
    putStrLn ("Valor Final (Esperado 215.0): " ++ show (valorFinal compraMedia))