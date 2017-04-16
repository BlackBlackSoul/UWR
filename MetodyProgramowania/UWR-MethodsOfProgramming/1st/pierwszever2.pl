dzdzownica(X) :- fail. 
ptak(Y) :- fail.
ryba(Y) :- fail.
lubi(X, Y) :-
 dzdzownica(X),
 ptak(Y).
lubi(X, Y) :-
 kot(X),
 ryba(Y).
lubi(X, Y) :- przyjaciel(X, Y).
lubi(X, Y) :- przyjaciel(Y, X). 
jada(mycat, X) :-
 lubi(mycat, X).
kot(mycat).
przyjaciel(mycat, me).
