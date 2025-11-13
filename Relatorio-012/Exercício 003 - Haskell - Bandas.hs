module Main where

data Banda = Banda {
    nomeBanda :: String,
    genero :: String,
    cache :: Double
} deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado
    deriving (Show, Eq)

data Evento = Evento {
    bandas :: [Banda],
    statusEvento :: StatusEvento
} deriving (Show)

subTotalCaches :: [Banda] -> Double
subTotalCaches listaBandas = sum (map cache listaBandas)

custoTotalEvento :: Evento -> Double
custoTotalEvento evento
    | statusEvento evento == Cancelado = 0.0
    | otherwise = totalCaches * 1.20
    where
        totalCaches = subTotalCaches (bandas evento)

bandaAbertura :: Evento -> String
bandaAbertura evento =
    case bandas evento of
        (b:_) -> nomeBanda b
        []    -> "Nenhuma banda programada."

bandaFechamento :: Evento -> String
bandaFechamento evento =
    let listaBandas = bandas evento
    in
        if null listaBandas
        then "Nenhuma banda programada."
        else nomeBanda (last listaBandas)

main :: IO ()
main = do
    let bandaRock = Banda "Os Pedras" "Rock" 5000.0
    let bandaPop = Banda "Pop X" "Pop" 8000.0
    let bandaIndie = Banda "IndieGentes" "Indie" 3500.0

    let eventoCompleto = Evento [bandaIndie, bandaPop, bandaRock] Ativo
    let eventoPassado = Evento [bandaRock] Encerrado
    let eventoCancelado = Evento [bandaPop, bandaRock] Cancelado
    let eventoVazio = Evento [] Ativo

    putStrLn "--- Custos Totais dos Eventos ---"
    putStrLn ("Custo Evento Completo (Ativo): R$" ++ show (custoTotalEvento eventoCompleto))
    putStrLn ("Custo Evento Passado (Encerrado): R$" ++ show (custoTotalEvento eventoPassado))
    putStrLn ("Custo Evento Cancelado: R$" ++ show (custoTotalEvento eventoCancelado))
    putStrLn ("Custo Evento Vazio (Ativo): R$" ++ show (custoTotalEvento eventoVazio))

    putStrLn "\n--- Lineup dos Eventos ---"
    putStrLn "\nEvento Completo:"
    putStrLn ("  Banda de Abertura: " ++ bandaAbertura eventoCompleto)
    putStrLn ("  Banda de Fechamento: " ++ bandaFechamento eventoCompleto)

    putStrLn "\nEvento Passado:"
    putStrLn ("  Banda de Abertura: " ++ bandaAbertura eventoPassado)
    putStrLn ("  Banda de Fechamento: " ++ bandaFechamento eventoPassado)
    
    putStrLn "\nEvento Vazio:"
    putStrLn ("  Banda de Abertura: " ++ bandaAbertura eventoVazio)
    putStrLn ("  Banda de Fechamento: " ++ bandaFechamento eventoVazio)