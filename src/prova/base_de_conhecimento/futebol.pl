joga(neymar, santos).
joga(veiga, palmeiras).
joga(ganso, fluminence).
joga(pedro, flamengo).
joga(estevao, palmeiras).
joga(arrascaeta, flamengo).

capitao(neymar).
capitao(ganso).
capitao(arrascaeta).

falta(veiga).
falta(neymar).
falta(arrascaeta).

cobrador_faltas_oficial(Time,Jogador) :-
    joga(Jogador,Time),
    falta(Jogador),
    !.

lider(Time,Jogador) :-
    joga(Jogador,Time),
    capitao(Jogador),
    !.