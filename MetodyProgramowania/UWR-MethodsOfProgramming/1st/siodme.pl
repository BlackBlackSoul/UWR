"ZŁE ROZWIĄZANIE"
---------------------
lewy_sasiad(1,2).
lewy_sasiad(2,3).
lewy_sasiad(3,4).
lewy_sasiad(4,5).
prawy_sasiad(5,4).
prawy_sasiad(4,3).
prawy_sasiad(3,2).
prawy_sasiad(2,1).

sasiad(X, Y) :-
 numer(X, Z),
 numer(Y, C),
 lewy_sasiad(Z, C).

sasiad(X, Y) :-
 numer(X, Z),
 numer(Y, C),
 prawy_sasiad(Z, C).

mieszka(anglik, czerwony).
ma_zwierze(hiszpan, pies).
pije(ukrainiec, herbata).
numer(norweg, 1).
pali(japonczyk,kenty).
czlowiek(anglik).
czlowiek(norweg).
czlowiek(hiszpan).
czlowiek(ukrainiec).
czlowiek(japonczyk).
zwierze(pies).
zwierze(lis).
zwierze(slon).
zwierze(waz).
zwierze(kon).
kolor(niebieski).
kolor(zolty).
kolor(zielony).
kolor(bialy).
kolor(czerwony).
papieros(koole).
papieros(luckystrike).
papieros(chesterfieldy).
papieros(kenty).
papieros(winstony).
napoj(kawa).
napoj(herbata).
napoj(wodka).
napoj(sok).
napoj(mleko).

pije(X, kawa):-
  mieszka(X, zielony).
mieszka(X, zielony):-
  sasiad(X, Y),
  mieszka(Y, bialy).
pali(X, winstony):-
  ma_zwierze(X, waz).
pali(X, koole):-
  mieszka(X, zolty).
pije(X, mleko):-
  numer(X, 3).
pali(X, chesterfieldy):-
  sasiad(X, Y),
  ma_zwierze(Y, lis).
pali(X, koole):-
  sasiad(X, Y),
  ma_zwierze(Y, kon).
pali(X, luckystrike):-
  pije(X, sok).
mieszka(X, niebieski):-
  sasiad(X,norweg).
