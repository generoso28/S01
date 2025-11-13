
module Main where

data Bebida = Bebida {
    nome :: String,
    tipo :: String,
    preco :: Float
} deriving (Show)

data StatusPedido = Aberto | Entregue | Cancelado
    deriving (Show, Eq)
    
data Pedido = Pedido {
    bebidas :: [Bebida],
    status :: StatusPedido
} deriving (Show)


valorTotalPedido :: Pedido -> Float
valorTotalPedido pedido =
    case status pedido of
        Cancelado -> 0.0
        _         -> taxaServico + sumPrecos
    where
        taxaServico = 5.0
        listaBebidas = bebidas pedido
        listaPrecos = map preco listaBebidas
        sumPrecos = sum listaPrecos

primeiraBebida :: Pedido -> String
primeiraBebida pedido =
    case bebidas pedido of
        []     -> "Pedido vazio"
        (b:bs) -> nome b

main :: IO ()
main = do
    let cafeBlend = Bebida "Blend da Casa" "Café" 12.50
    let chaGelado = Bebida "Chá de Pêssego Gelado" "Chá" 9.00
    let sucoLaranja = Bebida "Suco de Laranja Natural" "Suco" 10.00

    let pedido1 = Pedido [cafeBlend, sucoLaranja] Aberto
    let pedido2 = Pedido [chaGelado] Entregue
    let pedido3 = Pedido [cafeBlend] Cancelado
    let pedido4 = Pedido [] Aberto

    putStrLn "--- Valor Total dos Pedidos (com taxa de R$5.00) ---"
    putStrLn ("Pedido 1 (Aberto): R$" ++ show (valorTotalPedido pedido1))
    putStrLn ("Pedido 2 (Entregue): R$" ++ show (valorTotalPedido pedido2))
    putStrLn ("Pedido 3 (Cancelado): R$" ++ show (valorTotalPedido pedido3))
    putStrLn ("Pedido 4 (Vazio): R$" ++ show (valorTotalPedido pedido4))

    putStrLn "\n--- Primeira Bebida do Pedido ---"
    putStrLn ("Pedido 1: " ++ primeiraBebida pedido1)
    putStrLn ("Pedido 2: " ++ primeiraBebida pedido2)
    putStrLn ("Pedido 3: " ++ primeiraBebida pedido3)
    putStrLn ("Pedido 4: " ++ primeiraBebida pedido4)