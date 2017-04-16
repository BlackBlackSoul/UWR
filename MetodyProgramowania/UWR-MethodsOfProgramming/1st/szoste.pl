polaczenie(wroclaw, warszawa).
polaczenie(wroclaw, krakow).
polaczenie(wroclaw, szczecin).
polaczenie(szczecin, lublin).
polaczenie(szczecin, gniezno).
polaczenie(warszawa, katowice).
polaczenie(gniezno, gliwice).
polaczenie(lublin, gliwice).
connection(X, Y) :-
 polaczenie(X, Y).
connection(X, Y) :-
 polaczenie(X, Z),
 connection(Z, Y).
#polaczenie1przesiadka(X, Y) :-
#polaczenie(X, Z),
# polaczenie(Z, Y).
#polaczenie2przesiadki(X, Y) :-
# polaczenie(X, Y).
#polaczenie2przesiadki(X, Y) :-
# polaczenie1przesiadka(X, Y).
#polaczenie2przesiadki(X, Y) :-
# polaczenie1przesiadka(X, Z),
# polaczenie(Z, Y). 
"""
?- ['szoste.pl'].
true.

?- polaczenie(wroclaw, lublin).
false.

?- polaczenie(wroclaw, X).
X = warszawa ;
X = krakow ;
X = szczecin.

?- polaczenie1przesiadka(X, gliwice).
X = szczecin ;
X = szczecin ;
false.

?- polaczenie2przesiadki(X, gliwice).
X = gniezno ;
X = lublin ;
X = szczecin ;
X = szczecin ;
X = wroclaw ;
X = wroclaw ;
false.
"""
"""
zapytanie o dwie przesiadki:
 (polaczenie(Z, gliwice), polaczenie(Y,Z),polaczenie(X, Y));
 (polaczenie(Z, gliwice),polaczenie(X, Z));
 (polaczenie(X, gliwice)).
zapytanie o jedna przesiadke:
 (polaczenie(Z, gliwice), polaczenie(X, Z)).