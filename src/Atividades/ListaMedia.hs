module Atividades.ListaMedia where

-- LISTA MÉDIA (Peso 1,0)

-- 1. Escreva uma função que receba uma lista de 4 elementos e verifique se todos os elementos são iguais. (1,0)
questao_1 :: [Int] -> Bool
questao_1 [a,b,c,d] = (a==b) && (b==c) && (c==d)
questao_1 _ = False

-- 5. Crie uma função que retorne a lista de todos os divisores de um dado número. (1,0)
questao_5 :: Int-> [Int]
questao_5 0 = []
questao_5 n = [x | x <- [1..n], n `mod` x == 0]

-- 6. Escreva uma função que verifique se duas listas possuem os mesmos elementos (a ordem não importa). (1,0)

-- Função auxiliar manual (corrigindo os nomes das variáveis)
verifica_em :: Int -> [Int] -> Bool
verifica_em x [] = False
verifica_em x (y:ys) = (x == y) || verifica_em x ys

questao_6 :: [Int] -> [Int] -> Bool
questao_6 [] [] = True        -- Se ambas acabaram juntas, são iguais
questao_6 [] _  = False       -- Se a primeira acabou e a segunda não, são diferentes
questao_6 (x:xs) lista2

    | verifica_em x lista2 = questao_6 xs [y | y <- lista2, y /= x]
    | otherwise            = False

-- 7. Escreva uma função que retorne o número de vezes que um dado elemento aparece numa lista. (1,0)

-- 10. Escreva uma função que verifique se um ponto (x,y) está dentro de uma circunferência de raio R e com centro localizado num ponto (a,b). (1,0)

-- 12. Escreva uma função que receba uma lista e a transforme em palíndrome. (1,0)

-- 15. Escreva uma função que receba uma lista e retorne a posição de um dado elemento nessa lista, iniciando da posição 0. (1,0)
