male(adam).
female(eve).
parent(adam, helen).
parent(adam, ivonne).
parent(adam, anna).
parent(eve, helen).
parent(eve, ivonne).
parent(eve, anna).
female(helen).
male(john).
male(mark).
female(ivonne).
female(anna).
parent(ivonne, david).
parent(mark, david).
male(david).
parent(john, joshua).
parent(helen, joshua).
male(joshua).
sibling(X, Y) :- parent(Z, X), parent(Z, Y).
sister(Sis, Bro) :- female(Sis), sibling(Sis, Bro).
descend(Des1,Des2) :- parent(Des2, Des1).          
descend(Des1,Des2) :- parent(Des2, Z), descend(Des1, Z).
grandson(Gson, Gfat) :- male(Gson), parent(Par, Gson), parent(Gfat, Par).
cousin(X, Y) :- parent(Z, X), parent(H,Y), sibling(Z, H).
is_mother(Aa) :- female(Aa), parent(Aa, X).
is_father(Bb) :- male(Bb), parent(Bb, Y).
"""
?- descend(john, mark).
false.

?- descend(X, adam).
X = helen ;
X = ivonne ;
X = anna ;
X = joshua ;
X = david ;
false.

?- sister(X, ivonne).
X = helen ;
X = ivonne ;
X = anna ;
false.

?- cousin(X, Y).
X = david ;
X = david ;
X = joshua ;
X = joshua ;
false.

?- cousin(X, david).
X = david ;
X = david ;
X = joshua ;
X = joshua ;
false.

?- cousin(X, joshua).
X = david ;
X = david ;
X = joshua ;
X = joshua ;
false.

"""