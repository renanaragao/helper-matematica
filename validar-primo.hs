-- Define o módulo principal do programa executável.
module Main where

-- Importa getArgs para ler argumentos passados pela linha de comando.
import System.Environment (getArgs)

-- Define a função principal, que executa ações de entrada/saída (IO).
main :: IO ()
-- Início do bloco principal em notação "do".
main = do
    -- Lê todos os argumentos informados no terminal.
    args <- getArgs
    -- Analisa a lista de argumentos.
    case args of
        -- Caso exista exatamente um argumento, ele será a string do número.
        [nStr] ->
            -- Tenta converter a string para Integer com segurança.
            case reads nStr :: [(Integer, String)] of
                -- Sucesso na conversão e validação de número não negativo.
                [(n, "")] | n >= 0 -> do
                    let limite = floor (sqrt (fromIntegral n :: Double))
                        numerosTestados = [1 .. limite]
                        divisoresAteRaiz = [x | x <- numerosTestados, n `mod` x == 0]
                    putStrLn $ "Numero: " ++ show n
                    -- Exibe a raiz quadrada inteira calculada.
                    putStrLn $ "Raiz quadrada (inteira): " ++ show limite
                    -- Exibe o conjunto de números testados (de 1 até a raiz).
                    putStrLn $ "Conjunto testado: " ++ show numerosTestados
                    -- Exibe os números da lista testada que são divisíveis por n (dividem n).
                    putStrLn $ "Divisores encontrados ate a raiz: " ++ show divisoresAteRaiz

                    putStrLn $ case divisoresAteRaiz of
                        [x] -> "O número informado é PRIMO."
                        _ -> "O número informado é COMPOSTO."
                -- Caso a conversão falhe ou o número seja negativo, mostra erro.
                _ -> putStrLn "Informe um número inteiro não negativo."
        -- Caso a quantidade de argumentos esteja errada, mostra como usar.
        _ -> putStrLn "Uso: runhaskell validar-primo.hs <numero>"
