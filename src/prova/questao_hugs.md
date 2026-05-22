# Questão 22 - Hugs / Haskell

## Conteúdo

Este arquivo descreve exemplos completos de:

- `let-in`
- `where`
- função anônima
- guardas
- avaliação preguiçosa

---

## 1. Expressão `let-in`

O `let` cria variáveis locais para te ajudar no meio do cálculo, e o `in` entrega o resultado final.

### Exemplo

```haskell
pontosTime vitorias empates =
    let pontosVit = 3
        pontosEmp = 1
    in (vitorias * pontosVit) + (empates * pontosEmp)
```
Exemplo de uso

```Haskell
pontosTime 3 2
```
Processo
vitorias = 3, empates = 2


pontosVit = 3

pontosEmp = 1

(3 * 3) + (2 * 1)

9 + 2

Resultado
```
11
```
## 2. Expressão `where`
O `where` cria definições auxiliares na parte de baixo da função para serem utilizadas pela fórmula principal no topo.

Exemplo
```Haskell
aproveitamento vitorias jogos = (pontosGanhos / pontosPossiveis) * 100
    where pontosGanhos = vitorias * 3
          pontosPossiveis = jogos * 3
```

Exemplo de uso
```Haskell
aproveitamento 2 3
```

Processo
```
1) vitorias = 2, jogos = 3

2) pontosGanhos = 2 * 3 -> 6.0

3) pontosPossiveis = 3 * 3 -> 9.0

4) (6.0 / 9.0) * 100

5) 0.6666666666666666 * 100
```

Resultado: 66.66666666666666

## 3. Função anônima (lambda)
Função sem nome criada dinamicamente usando a barra invertida \.

Exemplo
```Haskell
triplicarGols listaGols = map (\x -> x * 3) listaGols
```
Exemplo de uso
```Haskell
triplicarGols [1, 2, 4]
```
Processo
```
1) A função anônima (\x -> x * 3) é aplicada pelo map em cada elemento da lista:

2) 1 * 3 -> 3

3) 2 * 3 -> 6

4) 4 * 3 -> 12
```

Resultado: [3,6,12]

## 4. Comando guardado (guardas)
As guardas (|) funcionam como testes condicionais de cima para baixo, substituindo o if-else.

Exemplo
```Haskell
resultadoJogo golsPro golsContra
    | golsPro > golsContra  = "Vitoria do Mengao!"
    | golsPro == golsContra = "Empatou o jogo"
    | otherwise             = "Derrota"
```

Exemplos de uso
```Haskell
resultadoJogo 3 1
```

Resultado:
"Vitoria do Mengao!"

```Haskell
resultadoJogo 2 2
```
Resultado: "Empatou o jogo"

```Haskell
resultadoJogo 0 2
```
Resultado: "Derrota"

## 5. Avaliação preguiçosa (Lazy Evaluation)
Haskell utiliza avaliação preguiçosa. Isso significa que as expressões só são calculadas/avaliadas quando o valor delas é realmente obrigatório para o resultado.

Exemplo
```Haskell
camisa x = 10
```

Exemplo de uso
```Haskell
camisa (5/0)
```

Processo
```
1) O Hugs entra na função camisa.

2) Ele vê que o retorno é fixo em 10 e que o parâmetro x não é chamado em nenhum momento no corpo da função.

3) Portanto, a operação matemática ilegal (5/0) é completamente ignorada e nem chega a ser calculada.
```

Resultado: 10