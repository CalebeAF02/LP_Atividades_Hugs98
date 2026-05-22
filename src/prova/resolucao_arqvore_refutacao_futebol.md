# Programação Logística (Prolog)
Calebe

# 1) Como o Prolog resolve uma query?
Para resolver uma query, o Prolog usa um esquema baseado em **unificação**, **busca em profundidade** (*depth-first search*) e **backtracking automático**. O interpretador sempre lê a base de conhecimento de forma sequencial:
* **De cima para baixo:** Avalia as linhas (fatos e regras) na ordem exata em que foram escritas.
* **Da esquerda para a direita:** Quando uma regra tem várias condições separadas por vírgula (conjunções), ele tenta resolver a primeira submeta antes de avançar para a próxima.

Quando jogamos uma query no terminal, o Prolog tenta achar um fato ou o cabeçalho de uma regra que dê "match" (unifique) com os argumentos. Se ele entrar em uma regra, ele foca em resolver o corpo dela. Se alguma submeta falhar no meio do caminho, o **backtracking** entra em ação: o interpretador volta ao último ponto de escolha válido, desfaz as amarrações de variáveis que deram errado e tenta a próxima linha disponível na base.

---

# 2) O Programa e a Query

Abaixo está a base de conhecimento estruturada com os fatos e a regra usando o corte (`!`), além da query solicitada:

```prolog
% Fatos: joga(Jogador, Time)
joga(neymar, santos).
joga(veiga, palmeiras).
joga(ganso, fluminence).
joga(pedro, flamengo).
joga(estevao, palmeiras).
joga(arrascaeta, flamengo).

% Fatos: capitao(Jogador)
capitao(neymar).
capitao(ganso).
capitao(arrascaeta).

% Fatos: falta(Jogador)
falta(veiga).
falta(neymar).
falta(arrascaeta).

% Regra oficial com o operador de corte (Cut)
cobrador_faltas_oficial(Time, Jogador) :-
    joga(Jogador, Time),
    falta(Jogador),
    !.
```

Query para rodar no terminal:

?- cobrador_faltas_oficial(flamengo, X).

# 3) Árvore de Resolução da Query
Esta árvore ilustra o fluxo exato que o interpretador Prolog faz por baixo dos panos para avaliar a query:

```ARVORE_DE_REFUTACAO
?- cobrador_faltas_oficial(flamengo, X).
                                          |
                                          | (Match na regra: Time = flamengo, Jogador = X)
                                          v
                          ?- joga(X, flamengo), falta(X), !.
                                          |
   -------------------------------------------------------------------------------------------------
   |                  |                    |                    |                 |                |
X = neymar         X = veiga            X = ganso            X = pedro         X = estevao      X = arrascaeta
joga(neymar,santos) joga(veiga,palmeiras) joga(ganso,fluminence) joga(pedro,flamengo) joga(estevao,palm) joga(arrascaeta,flam)
   |                  |                    |                    |                 |                |
santos != flamengo palmeiras != flamengo fluminence != flamengo [Dá Match]       palmeiras != flamengo [Dá Match]
   |                  |                    |                    |                 |                |
 (FALHA)            (FALHA)              (FALHA)          ?- falta(pedro), !.   (FALHA)       ?- falta(arrascaeta), !.
                                                                |                                      |
                                                         (Não bate falta)                          [SUCESSO]
                                                                |                                      |
                                                          [Backtracking]                             ?- !.
                                                                                                       |
                                                                                                   [Corte !]
                                                                                                       |
                                                                                                 SUCESSO FINAL
                                                                                                 X = arrascaeta
```

## Passo a passo do comportamento da árvore:
- A query aciona a regra cobrador_faltas_oficial, unificando Time = flamengo e deixando Jogador = X como variável livre. O corpo da regra vira a nova meta.

- O Prolog tenta resolver a primeira parte: joga(X, flamengo). Ele varre os fatos do topo para o fim:

- Neymar, Veiga e Ganso falham direto porque os times deles não batem com "flamengo".

- Pedro dá match. O Prolog pausa aqui, assume X = pedro e vai checar a próxima condição.

- Avaliando a segunda submeta: falta(pedro). Como o fato não existe na base de dados, a meta falha.

- O backtracking entra em cena. O Prolog descarta o Pedro, volta para o joga(X, flamengo) e continua a busca de onde parou.

- Ele passa pelo Estêvão (que falha por ser do Palmeiras) e chega no Arrascaeta, dando um novo match (X = arrascaeta).

- Vai para a meta da direita: falta(arrascaeta). Esse fato existe na base! Então a meta dá sucesso.

- Como tudo antes do corte deu certo, o Prolog executa o cut (!), finalizando a busca.

# 4) Quais subárvores não serão percorridas? (O efeito do Cut)
O operador cut (!) funciona como uma parede que bloqueia o backtracking. Assim que o Prolog passa por ele, ele cancela qualquer ponto de escolha que tenha ficado para trás.

No caso desse nosso programa, o corte impede o Prolog de explorar os seguintes caminhos:

Novos fatos de jogadores do Flamengo: Se houvesse qualquer outro jogador do Flamengo cadastrado na base de dados abaixo do Arrascaeta (por exemplo, um fato joga(gabigol, flamengo).), essa ramificação da árvore nunca seria criada ou avaliada.

Outras soluções no terminal: O cut congela a resposta em X = arrascaeta. Isso significa que o interpretador fecha a execução imediatamente e não deixa o usuário apertar ponto e vírgula (;) no terminal para forçar o programa a caçar outros resultados.                                                                                                 