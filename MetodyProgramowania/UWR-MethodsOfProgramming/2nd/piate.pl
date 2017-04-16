head(H, [H|_]).

last([H|[]], H).
last([_|L], H) :-
 last(L, H).

tail(T, [_|T]).

init([], [_]).
init([H|X], [H|T]) :-
 init(X, T).

prefix([], _).
prefix([H|X], [H|Y]) :-
 prefix (X,Y).

sufix(X, X).
sufix([_|T], S) :-
 sufix(T, S). 