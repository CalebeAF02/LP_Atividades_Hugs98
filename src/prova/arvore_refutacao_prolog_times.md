# Questão 21 — Prolog COMPLETA (VERSÃO IDEAL)

---

# Programa Prolog

```prolog
% Banco de conhecimento misturado

joga(veiga, palmeiras).
joga(bruno_henrique, flamengo).
joga(gomez, palmeiras).
joga(pedro, flamengo).
joga(estevao, palmeiras).
joga(arrascaeta, flamengo).

% Jogadores especialistas em falta

falta(veiga).
falta(gomez).
falta(arrascaeta).

% Regra para definir cobrador oficial

cobrador_oficial(Time,Jogador) :-
    joga(Jogador,Time),
    falta(Jogador),
    !.
```

---

# Query

```prolog
?- cobrador_oficial(flamengo,X).
```

---

# O QUE A QUERY PERGUNTA?

> Quem será o cobrador oficial de faltas do Flamengo?

---

# PROCESSO COMPLETO DE RESOLUÇÃO

---

# ETAPA 1 — META INICIAL

A meta inicial é:

```prolog
cobrador_oficial(flamengo,X)
```

O Prolog procura uma regra compatível com:

```prolog
cobrador_oficial(...)
```

Encontra:

```prolog
cobrador_oficial(Time,Jogador) :-
    joga(Jogador,Time),
    falta(Jogador),
    !.
```

---

# ETAPA 2 — UNIFICAÇÃO

O Prolog unifica:

```prolog
cobrador_oficial(flamengo,X)
```

com:

```prolog
cobrador_oficial(Time,Jogador)
```

Então:

```prolog
Time = flamengo
Jogador = X
```

A regra torna-se:

```prolog
joga(X,flamengo),
falta(X),
!.
```

---

# ETAPA 3 — PRIMEIRA SUBMETA

O Prolog resolve:

```prolog
joga(X,flamengo)
```

A busca ocorre:
- da esquerda para direita
- de cima para baixo
- utilizando busca em profundidade

---

# PRIMEIRA TENTATIVA

O primeiro fato do banco é:

```prolog
joga(veiga,palmeiras).
```

Esse fato NÃO serve.

Porque a query exige:

```prolog
flamengo
```

Então ocorre falha de unificação.

---

# SEGUNDA TENTATIVA

Novo fato:

```prolog
joga(bruno_henrique,flamengo).
```

Agora:

```prolog
X = bruno_henrique
```

O Prolog tenta provar:

```prolog
falta(bruno_henrique)
```

Esse fato NÃO existe.

❌ Falha.

---

# BACKTRACKING

O Prolog retorna para:

```prolog
joga(X,flamengo)
```

e procura nova alternativa.

---

# TERCEIRA TENTATIVA

Novo fato:

```prolog
joga(gomez,palmeiras).
```

Não serve.

Falha de unificação novamente.

---

# QUARTA TENTATIVA

Novo fato:

```prolog
joga(pedro,flamengo).
```

Então:

```prolog
X = pedro
```

Agora tenta:

```prolog
falta(pedro)
```

Esse fato NÃO existe.

❌ Falha.

---

# NOVO BACKTRACKING

O Prolog volta novamente.

---

# QUINTA TENTATIVA

Novo fato:

```prolog
joga(estevao,palmeiras).
```

Não serve para Flamengo.

❌ Falha de unificação.

---

# SEXTA TENTATIVA

Novo fato:

```prolog
joga(arrascaeta,flamengo).
```

Agora:

```prolog
X = arrascaeta
```

O Prolog tenta provar:

```prolog
falta(arrascaeta)
```

Esse fato existe.

✅ Sucesso.

---

# ETAPA 4 — EXECUÇÃO DO CUT

Agora executa:

```prolog
!
```

O operador cut elimina:
- pontos de backtracking
- alternativas restantes
- novas buscas

Assim:
- nenhuma nova tentativa será realizada
- a busca termina imediatamente

---

# RESULTADO FINAL

```prolog
X = arrascaeta
```

---

# ÁRVORE DE RESOLUÇÃO

```text
cobrador_oficial(flamengo,X)
                |
        joga(X,flamengo)
                |
-------------------------------------------------------------------------
|                  |                |               |                   |
veiga          bruno_henrique     gomez         pedro            estevao
(palmeiras)      (flamengo)     (palmeiras)    (flamengo)      (palmeiras)
|                  |                                |
falha          falta(bruno_henrique)           falta(pedro)
                   |                                |
                 FALHA                           FALHA

                 X = arrascaeta
                        |
                joga(arrascaeta,flamengo)
                        |
                  falta(arrascaeta)
                        |
                        !
                        |
                     SUCESSO
```

---

# EXPLICAÇÃO DA ÁRVORE

O Prolog percorre o banco de conhecimento:
- linha por linha
- de cima para baixo

Tentando satisfazer:

```prolog
joga(X,flamengo)
```

Diversas alternativas falham:
- algumas por unificação incorreta
- outras por ausência do fato `falta(...)`

Após vários backtrackings:
- Arrascaeta é encontrado
- a condição `falta(arrascaeta)` é satisfeita
- o operador cut (`!`) é executado

---

# SUBÁRVORES NÃO PERCORRIDAS

Após o cut:
- quaisquer alternativas restantes
- e novos pontos de backtracking

não serão percorridos.

Isso ocorre porque:
- o operador `!`
- elimina as alternativas restantes
- encerrando a busca.

---

# CONCLUSÃO

Na resolução de queries Prolog:
- ocorre unificação entre query e regras
- as submetas são resolvidas da esquerda para direita
- a busca é realizada em profundidade
- em caso de falha ocorre backtracking
- o operador cut (`!`) elimina alternativas e impede novas tentativas após sua execução.
