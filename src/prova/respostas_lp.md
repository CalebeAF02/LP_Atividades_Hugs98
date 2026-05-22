# Respostas das questões de LP

## Instruções

Responda **F** (falso), **V** (verdadeiro) ou **NS** (não sei). Duas respostas erradas anulam uma certa. (0,4 cada).

## Questões em tabela

| Nº | Pergunta | Resposta | Justificativa / observação |
| --- | --- | --- | --- |
| 1 | As razões do estudo comparativo de LP são: aumentar a capacidade para expressar conceitos, aumentar a capacidade de projetar novas linguagens, melhorar a capacidade de selecionar a linguagem mais adequada, permitir desenvolver programas mais eficientes levando em conta a implementação de recursos da linguagem. | V | As razões do estudo comparativo de LP são: ampliar a capacidade de expressar conceitos, projetar novas linguagens, escolher a linguagem mais adequada e desenvolver programas mais eficientes considerando a implementação. |
| 2 | LP para aplicações científicas possuem estruturas de dados simples, facilidade e precisão para cálculo, laços iterativos e seleções, facilidade para produzir relatórios elaborados e capacidade de lidar com aritmética BCD. | F | Em aplicações científicas, o foco é em cálculo e precisão; relatórios elaborados são mais típicos de aplicações comerciais. |
| 3 | Os critérios de legibilidade, qualidade da definição e custos estão associados à produtividade. Confiabilidade, capacidade de escrita, portabilidade e generalidade estão associados à manutenibilidade de uma linguagem. | F | Legibilidade está associada à manutenibilidade, e não à produtividade. Confiabilidade, capacidade de escrita, portabilidade e generalidade também se relacionam à manutenibilidade. |
| 4 | Linguagem compilada utiliza checagem de tipo estática e requer declaração de variáveis. | V | Linguagens compiladas normalmente fazem checagem de tipo estática e exigem declaração de variáveis. |
| 5 | A introdução do protótipo de função na linguagem C pela ANSI permitiu a checagem de tipo dinâmica. | F | O protótipo de função em C pela ANSI permitiu checagem de tipos em tempo de compilação, não dinâmica. |
| 6 | Arquitetura de Von Neumann é caracterizada por programa e dados na memória, periféricos, memória e CPU ligados por barramentos, ciclo busca-decodificação-busca de operandos-execução, e processamento sequencial. | V | A arquitetura de Von Neumann possui programa e dados na memória, periféricos, memória e CPU ligados por barramentos, ciclo busca-decodificação-busca de operandos-execução e processamento sequencial. |
| 7 | No paradigma procedural (ou imperativo) o algoritmo de resolução é definido em detalhes, a ordem de execução dos comandos é definida, sendo admitida a existência de comando de atribuição. | V | No paradigma procedural (imperativo), o algoritmo é descrito em detalhes, a ordem de execução é definida e há comando de atribuição. |
| 8 | No paradigma lógico a máquina de inferência escolhe a ordem de execução das regras quando houver um conjunto de conflito. Assim, não é necessário suporte para recursão direta ou indireta. | F | No paradigma lógico, a ordem de execução não é escolhida pela máquina de inferência em caso de conflito; em Prolog, a busca segue a ordem das cláusulas e em profundidade. |
| 9 | Em sistemas de interpretação pura, se não houver erros, o tradutor analisa o programa fonte e gera um código intermediário que é interpretado, por exemplo, Java que utiliza o compilador javac e a máquina virtual Java. | F | Em interpretação pura, não há conversão do código-fonte para um código intermediário. Java usa compilação para bytecode, então não é interpretação pura. |
| 10 | Uma linguagem que apresenta suporte para abstração de dados possui maior capacidade de escrita do que uma que possui suporte para abstração funcional. | NS | Não há certeza suficiente para afirmar se abstração de dados fornece maior capacidade de escrita do que abstração funcional. |
| 11 | Uma das características de Hugs é ter funções globais tais como as construídas com as expressões let ou where. | F | Hugs não oferece funções globais no sentido usual; o uso de globais é desencorajado. |
| 12 | Uma função em Hugs é definida como um conjunto de equações onde cada equação é uma regra de reescrita que pode conter guardas. | V | Em Hugs, uma função é definida por um conjunto de equações, e cada equação pode conter guardas. |
| 13 | Seja a função zero definida como: zero x = 0. Aplicando a regra de reescrita para avaliar zero (1/0) ocorrerá o seguinte erro: Program execution error: {primDivDouble 1.0/0.0} | F | Pela avaliação preguiçosa, `zero (1/0)` não avalia `1/0`; a função retorna `0` diretamente. |
| 14 | Na avaliação de uma query Prolog quando há uma falha a máquina de inferência tenta satisfazer a meta com alternativas, buscando um casamento a partir de onde a meta falhou, realizando busca em abrangência. | NS | Não tenho certeza suficiente para afirmar como a máquina de inferência trata falhas e backtracking em Prolog sem aprofundar a implementação específica. |
| 15 | Pela hipótese do mundo fechado se um fato não é conhecido ser verdadeiro, assume-se que ele é falso. | V | Pela hipótese do mundo fechado, o que não é conhecido como verdadeiro é assumido como falso. |
| 16 | Uma expressão em Hugs é resolvida utilizando-se a regra de redução que substitui a expressão corrente pela expressão do lado direito, conforme os padrões casados com a instância de argumentos. | V | Em Hugs, uma expressão é resolvida substituindo a expressão corrente pela do lado direito, conforme os padrões de argumentos. |
| 17 | Pela avaliação preguiçosa, uma expressão só é avaliada quando seu valor é requerido e se for cotizada, aparecendo em vários lugares, só é avaliada uma única vez em Prolog. | F | A avaliação preguiçosa só adia o cálculo até ser necessário; ela não garante memoização para reutilização em vários pontos. |
| 18 | O ciclo de execução de Prolog aplica regra de resolução com estratégia linear, na ordem de escrita das cláusulas, com encadeamento de regras para a frente, busca em profundidade, da esquerda para a direita das condições das cláusulas, backtracking quando a unificação falhar, e sem occur-check na unificação. | F | Prolog usa encadeamento para trás, e não para frente. |
| 19 | A função ((^3).(/2)) 10 é avaliada como 500. | F | `((^3).(/2)) 10` equivale a `(10 / 2)^3 = 125`, e não 500. |
| 20 | A função let fiblst = 1:1:[x+y|(x,y) <- (zip fiblst (tail fiblst))] in take 5 fiblst é avaliada como [1,2,3,5,8] | F | A definição da função gera a sequência `[1,1,2,3,5]`, e não `[1,2,3,5,8]`. |

## Resumo rápido

- **Verdadeiros:** 1, 4, 6, 7, 12, 15, 16
- **Falsos:** 2, 3, 5, 8, 9, 11, 13, 17, 18, 19, 20
- **Não sei:** 10, 14
