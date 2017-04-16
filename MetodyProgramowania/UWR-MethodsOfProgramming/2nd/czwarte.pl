even([]).
even([_,_|X]) :- even(X).
singleton([_]).
palindrom(X):-
	Y = X,
	reverse(X,Y).
"""
Reverse:
Is true when the elements of List2 are in reverse order compared to List1.
"""