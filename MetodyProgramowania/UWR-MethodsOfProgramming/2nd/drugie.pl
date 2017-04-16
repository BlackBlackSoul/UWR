select(H, [H|T], T).
select(X, [H|T], [H|S]) :-
	select(X, T, S).

"""
?- select(x, L, [a,b,c]).
L = [x, a, b, c] ;
L = [a, x, b, c] ;
L = [a, b, x, c] ;
L = [a, b, c, x] ;
false.
"""