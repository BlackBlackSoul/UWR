append([], X, X).
append([H|T], X, [H|Y]) :-
	append(T, X, Y).
select(H, [H|T], T).
select(X, [H|T], [H|S]) :-
	select(X, T, S).

"""
-------1--------
?- append(X, X, Y).
X = Y, Y = [] ;
X = [_G1430],
Y = [_G1430, _G1430] ;
X = [_G1430, _G1436],
Y = [_G1430, _G1436, _G1430, _G1436] 
itd.
--------2--------
?- select(X, [a,b,c,d], [a,c,d]).
X = b ;
false.
--------3--------
?- append([a,b,c],X, [a,b,c,d,e]).
X = [d, e].
"""