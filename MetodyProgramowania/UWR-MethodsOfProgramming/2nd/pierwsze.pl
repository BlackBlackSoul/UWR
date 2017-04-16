append([], X, X).
append([H|T], X, [H|Y]) :-
	append(T, X, Y).

"""
X = [],
Y = [a, b, c] ;
X = [a],
Y = [b, c] ;
X = [a, b],
Y = [c] ;
X = [a, b, c],
Y = [] ;
false.
"""