female(F).
male(M).
parent(Xx, Yy).
sibling(S1, S2) :-
 male(P1),
 female(P2),
 parent(P1, S1),
 parent(P2, S1),
 parent(P1, S2),
 parent(P2, S2).
sister(Sis, Bro) :-
 female(Sis),
 sibling(Sis, Bro).
grandson(Gson, Gfat) :-
 male(Gson),
 parent(Par, Gson),
 parent(Gfat, Par).
cousin(Cous1, Cous2) :-
 male(Cous1),
 parent(Par1, Cous1),
 parent(Par2, Couse2),
 sibling(Par1, Par2).
descend(Des1,Des2) :- parent(Des2, Des1).          
descend(Des1,Des2) :- 
 parent(Des1, Z),          
 descend(Z, Des2).
is_mother(Aa) :-
 female(Aa),
 parent(Aa, X).
is_father(Bb) :-
 male(Bb),
 parent(Bb, Y).