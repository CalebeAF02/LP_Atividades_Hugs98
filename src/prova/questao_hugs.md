# Questão 22 - Hugs / Haskell

## Conteúdo

Este arquivo descreve exemplos completos de:

- `let-in`
- `where`
- função anônima
- guardas

---

## 1. Expressão `let-in`

A expressão `let` cria variáveis locais utilizadas apenas dentro do `in`.

### Exemplo

```haskell
salarioFinal =
    let salario = 2000
        bonus = 500
    in salario + bonus
```

### Processo

- `salario = 2000`
- `bonus = 500`
- `salario + bonus`
- `2000 + 500`

### Resultado

```text
2500
```

---

## 2. Expressão `where`

O `where` cria definições auxiliares utilizadas pela função.

### Exemplo

```haskell
totalGols golsAssistencias =
    soma
    where soma = golsAssistencias + 10
```

### Exemplo de uso

```haskell
totalGols 5
```

### Processo

- `soma = 5 + 10`

### Resultado

```text
15
```

---

## 3. Função anônima (lambda)

Função sem nome criada dinamicamente.

### Exemplo

```haskell
dobroGols = (\gols -> gols * 2) 4
```

### Processo

- `gols = 4`
- `gols * 2`
- `4 * 2`

### Resultado

```text
8
```

---

## 4. Comando guardado (guardas)

Guardas funcionam como condições.

### Exemplo

```haskell
nivelJogador gols
    | gols >= 30 = "Craque"
    | gols >= 10 = "Bom jogador"
    | otherwise = "Iniciante"
```

### Exemplos

```haskell
nivelJogador 35
```

Resultado:

```text
"Craque"
```

```haskell
nivelJogador 15
```

Resultado:

```text
"Bom jogador"
```

```haskell
nivelJogador 2
```

Resultado:

```text
"Iniciante"
```

---

## 5. Avaliação preguiçosa

Haskell utiliza avaliação preguiçosa. Expressões só são avaliadas quando necessário.

### Exemplo

```haskell
camisa x = 10
```

```haskell
camisa (5/0)
```

### Resultado

```text
10
```

### Observação

O valor `(5/0)` não é avaliado, porque a variável `x` não é utilizada.
