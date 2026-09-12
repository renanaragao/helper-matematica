module Main where

import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    case args of
        [nStr] ->
            case reads nStr :: [(Integer, String)] of
                [(n, "")] | n >= 0 -> do
                    let divisores = [x | x <- [1 .. n], n `mod` x == 0]

                    putStrLn $ "Os divisores de " ++ show n ++ " são: " ++ show divisores
                _ -> putStrLn "Informe um número inteiro não negativo."
        _ -> putStrLn "Uso: runhaskell testar-divisores.hs <numero>"
