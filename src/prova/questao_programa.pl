% Questão 21 - Programa Prolog com Cut

% Jogadores e times

joga(neymar, santos).
joga(ganso, santos).
joga(arrascaeta, flamengo).

% Capitães

capitao(neymar).
capitao(ganso).
capitao(arrascaeta).

% Regra com cut
% O primeiro capitão encontrado será escolhido.

lider(Time,Jogador) :-
    joga(Jogador,Time),
    capitao(Jogador),
    !.

% Query de exemplo:
%
% ?- lider(santos,X).
%
% Resultado:
% X = neymar.
