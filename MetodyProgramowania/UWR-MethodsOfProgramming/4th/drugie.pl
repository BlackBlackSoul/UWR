polaczenie(wroclaw, rogoznica).
polaczenie(wroclaw, krakow).
polczaenie(krakow, rogoznica).
polaczenie(krakow, poznan).
polaczenie(poznan, malbork).
polaczenie(malbork, lublin).
polaczenie(lublin, rogoznica).
polaczenie(lublin, wroclaw).

trip(M,M,A,A).
trip(Poczatek, Koniec, Trasa, A):-
	polaczenie(X,Koniec),
	\+ member(X,A),
	trip(Poczatek, X, Trasa, [X|A]).

trip(P,K,T):-
	trip(P,K,T,[K]).