S - smok
Z - zwierze
C - czlowiek

1) nieszczesliwy(S) :-
    smok(S),
    mieszka_w_zoo(S).

2) szczesliwe(Z) :-
    zwierze(Z),
    spotykasie_z(Z, C),
    czlowiek(C),
    mily(C).

3) mily(C) :-
    czlowiek(C),
    odwiedza_zoo(C).

4) spotykasie_z_czlowiekiem(Z, C) :-
    zwierze(Z),
    mieszka_w_zoo(Z),
    czlowiek(C),
    odwiedza_zoo(C).

Brakuje: 
 - nie wiadomo czy jest jakis smok: smok -> zwierze
 - nie wiadomo czy jest jakis czlowiek: czlowiek -> odwiedza zoo