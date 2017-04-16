sublist([],[]).
sublist([X|Y], [X|Z]):-
    sublist(Y,Z).
sublist([H|T],Y):-
    sublist(T,Y).