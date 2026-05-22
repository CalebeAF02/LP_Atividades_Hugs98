# Questão 21 — Prolog

## Pergunta

Explique todo o processo de resolução de uma query Prolog.
Construa um programa que contenha um cut (`!`) e uma query Prolog.
Utilize uma árvore de resolução para ilustrar o processo de avaliação da query.
Indique quais subárvores não serão percorridas.

---

# Resposta Completa

## Base de Conhecimento

```prolog
joga(neymar, santos).
joga(ganso, santos).
joga(arrascaeta, flamengo).

capitao(neymar).
capitao(ganso).
capitao(arrascaeta).

lider(Time,Jogador) :-
    joga(Jogador,Time),
    capitao(Jogador),
    !.
```

---

# Explicação do Programa

Os fatos:

```prolog
joga(neymar, santos).
```

significam que Neymar joga no Santos.

Os fatos:

```prolog
capitao(neymar).
```

significam que Neymar é capitão.

A regra:

```prolog
lider(Time,Jogador)
```

determina que um jogador será líder de um time caso:
1. jogue naquele time
2. seja capitão

O operador `!` (cut) impede que o Prolog volte para buscar novas alternativas após sua execução.

---

# Query

```prolog
?- lider(santos,X).
```

A pergunta feita é:

> Quem é o líder do Santos?

---

# Processo de Resolução

## Etapa 1 — Meta inicial

A meta inicial é:

```prolog
lider(santos,X)
```

O Prolog procura uma regra compatível.

Encontra:

```prolog
lider(Time,Jogador) :-
    joga(Jogador,Time),
    capitao(Jogador),
    !.
```

---

## Etapa 2 — Unificação

O Prolog realiza unificação entre:

```prolog
lider(santos,X)
```

e:

```prolog
lider(Time,Jogador)
```

Logo:

```prolog
Time = santos
Jogador = X
```

A regra torna-se:

```prolog
joga(X,santos),
capitao(X),
!.
```

---

## Etapa 3 — Primeira submeta

O Prolog resolve primeiro:

```prolog
joga(X,santos)
```

A busca ocorre:
- da esquerda para a direita
- de cima para baixo
- em profundidade

O primeiro fato encontrado é:

```prolog
joga(neymar,santos).
```

Então:

```prolog
X = neymar
```

---

## Etapa 4 — Segunda submeta

Agora o Prolog verifica:

```prolog
capitao(neymar)
```

O fato existe.

A submeta é satisfeita.

---

## Etapa 5 — Execução do cut

O Prolog executa:

```prolog
!
```

O cut impede o backtracking para alternativas posteriores desta execução da regra.

Assim, o Prolog não tentará:
- outros jogadores
- novas alternativas

---

# Resultado Final

```prolog
X = neymar
```

---

# Árvore de Resolução

```text
lider(santos,X)
        |
joga(X,santos)
        |
X = neymar
        |
capitao(neymar)
        |
!
        |
SUCESSO
```

---

# Subárvores Não Percorridas

Após a execução do cut:
- a subárvore referente ao jogador `ganso`
- e quaisquer alternativas posteriores

não serão percorridas.

Isso ocorre porque o operador `!` impede o backtracking após a solução encontrada.
