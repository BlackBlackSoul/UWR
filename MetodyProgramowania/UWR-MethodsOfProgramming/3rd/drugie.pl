%Lista pusta nie ma elementów - podstawa.
filter([],[]). 
%Lista niepusta H|T, unifikuje sie z lista z elementami dodatnimi. 
filter([H|T],[H|S]):-
	H >= 0,
	!,
	filter(T,S).
%Lista niepusta, która przeszukuje listę, gdy natrafi na liczby ujemne. 
filter([H|T],S):-
	H < 0,
	filter(T,S).
count(_, [], 0).
count(X, [X|L], N):-
	count(X, L, C), !,
	N is C+1.

count(X, [_|L], N):-
	count(X, L, N).
exp(Base,Exp,Res):-
	Res is Base^Exp.