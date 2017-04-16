%:- module(karol_rodzinski, [resolve/4, prove/2]).
:- op(200, fx, ~).
:- op(500, xfy, v).

%Predykaty z pierwszej pracowni. Pomagaja w obrobce klauzul. Patrzymy czy zmienna nalezy do klauzuli, usuwamy duplikaty, poniewaz nie wplywaja one na rezolwenty.
zmienna(X) :- X \= _ v _, X \= ~_.
czyNieLiteral(X) :- X \= _ v _.
polaczenieRoznychKlauzul(A, X, A v X) :- czyNieLiteral(A), !. 
polaczenieRoznychKlauzul(H v T, X, H v Y) :-
	polaczenieRoznychKlauzul(T, X, Y).
listaZmiennych(A,[A]) :- zmienna(A), !.
listaZmiennych(~A,[A]) :- zmienna(A), !.
listaZmiennych(A v B,[A|X2]) :- zmienna(A), listaZmiennych(B,X2), \+ member(A, X2), !.
listaZmiennych(~C v B,[C|X2]) :- czyNieLiteral(A), listaZmiennych(B,X2), \+ member(C,X2), !.
listaZmiennych(A v B,X) :- zmienna(A), listaZmiennych(B,X), !.
listaZmiennych(A v B,X) :- czyNieLiteral(A), listaZmiennych(B,X), !.
wszystkieZmienneWLiscie([],[]) :- !.
wszystkieZmienneWLiscie([H|T],X):- listaZmiennych(H,Y1), wszystkieZmienneWLiscie(T,Y2), append(Y1,Y2,X).

zmiennaNegacja(~X) :- X \= _ v _, !.
zmiennaPozytywna(X) :- X \= _ v _, X \= ~_, !.
zmienna1(X) :- zmiennaNegacja(X), !; zmiennaPozytywna(X), !.

samaZmienna(X, X) :- zmiennaPozytywna(X), !.
samaZmienna(~X, X) :- X = X, !. 

zamianaPozNaNeg(X, X1) :- zmiennaPozytywna(X), X1 = ~X.

listaZmiennych1(A,[A]) :- zmienna1(A), !.
listaZmiennych1(~A,[A]) :- zmienna1(A), !.
listaZmiennych1(A v B,[A|X2]) :- zmienna1(A), listaZmiennych1(B,X2), \+ memberchk(A, X2), !.
listaZmiennych1(~C v B,[C|X2]) :- czyNieLiteral(A), listaZmiennych1(B,X2), \+ memberchk(C,X2), !.
listaZmiennych1(A v B,X) :- zmienna1(A), listaZmiennych1(B,X), !.
listaZmiennych1(A v B,X) :- czyNieLiteral(A), listaZmiennych1(B,X), !.
wszystkieZmienneWLiscie1([],[]) :- !.
wszystkieZmienneWLiscie1([H|T],X):- listaZmiennych1(H,Y1), wszystkieZmienneWLiscie1(T,Y2), append(Y1,Y2,X).
singleton(X) :- samaZmienna(X).
%Sprawdzamy czy zmienna istnieje w klauzuli, usuwamy powtorzenia z klauzuli, poniewaz nie wplywaja one na rezolwenty.

czyZmiennaWKlauzuli(X,X) :- !.
czyZmiennaWKlauzuli(X,X v _) :- !.
czyZmiennaWKlauzuli(X,_ v Y):- czyZmiennaWKlauzuli(X,Y).
usuwaniePowtorzen(V, A v V, A) :- czyNieLiteral(V), !.
usuwaniePowtorzen(V,A,A) :- czyNieLiteral(A).
usuwaniePowtorzen(V, V v B, B1) :- !, usuwaniePowtorzen(V,B,B1).
usuwaniePowtorzen(V, A v B, B1) :- czyZmiennaWKlauzuli(A,B), !, usuwaniePowtorzen(V,B,B1).
usuwaniePowtorzen(V, A v B, A v B1) :- usuwaniePowtorzen(V,B,B1).

szukanieSingletonowOPrzeciwnychZnakach([H|T], Res) :- singleton(H), append(H, Res), szukanieSingletonowOPrzeciwnychZnakach(T, Res). 

%Predykat, ktory zwraca rezolwente klauzul wzgledem zmiennej podanej jako pierwszy parametr (bez powtorzen).
%Pierwsza czesc pracowni.
resolve(V,V,~V,[]) :- !.
resolve(V,C1,C2,[]):- usuwaniePowtorzen(V,C1,V), usuwaniePowtorzen(~V,C2,~V), !.
resolve(V,C1,C2,Sol) :- usuwaniePowtorzen(V,C1,S1), usuwaniePowtorzen(~V,C2,S2), polaczenieRoznychKlauzul(S1,S2,CSOL), usuwaniePowtorzen(V,CSOL,CSOL1), usuwaniePowtorzen(~V,CSOL1,Sol), !.

%Predykat prove, ktory ma zwrocic false w przypadku braku dowodu sprzecznosci lub dowod, jesli on istnieje.
%W tej postaci predykat dziala jedynie, jesli nie ma takiego dowodu, czyli potrafi zwrocic tylko false.
%rezolwentyDwochKlauzul, to predykat, ktory zwraca wszystkie rezolwenty dwoch klazul.
%wszystkieRezolwentyZbioruKlauzulAxiomow, to predykat, ktory zwroci wszystkie rezolwenty podanego zbioru klauzul, to jest nie wezmie pod uwage rezolwent klauzul i np. powstalych wczesniej rezolwent.
%wszystkieMozliweRezolwenty, to predykat, ktory zwraca wszystkie rezolwenty klauzul axiomow, a takze rezolwenty powstalych rezolwent itd.

rezolwentyDwochKlauzul(X,Y,Z) :- listaZmiennych(X,VARS),rezolwentyDwochKlauzul(X,Y,VARS,Z).
rezolwentyDwochKlauzul(X,Y,[V1|REST],[L1|Z]) :- czyZmiennaWKlauzuli(V1,X), czyZmiennaWKlauzuli(~V1,Y), resolve(V1,X,Y,L1), rezolwentyDwochKlauzul(X,Y,REST,Z), !.
rezolwentyDwochKlauzul(X,Y,[V1|REST],[L1|Z]) :- czyZmiennaWKlauzuli(~V1,X), czyZmiennaWKlauzuli(V1,Y), resolve(V1,Y,X,L1), rezolwentyDwochKlauzul(X,Y,REST,Z), !.
rezolwentyDwochKlauzul(X,Y,[H|T],[]) :- !.
rezolwentyDwochKlauzul(X,Y,[],[]):- !.
wszystkieRezolwentyZbioruKlauzulAxiomow(X,Y):- wszystkieRezolwentyZbioruKlauzulAxiomow(X,X,Y).
wszystkieRezolwentyZbioruKlauzulAxiomow([],[],[]) :- !.
wszystkieRezolwentyZbioruKlauzulAxiomow([H|CL],[],X1):- wszystkieRezolwentyZbioruKlauzulAxiomow(CL,CL,X1), !. 
wszystkieRezolwentyZbioruKlauzulAxiomow([H|CL],[H1|CL1],X) :- rezolwentyDwochKlauzul(H,H1,L),wszystkieRezolwentyZbioruKlauzulAxiomow([H|CL],CL1,X1), append(L,X1,X).
wszystkieMozliweRezolwenty(A,A):- wszystkieRezolwentyZbioruKlauzulAxiomow(A,A1), append(A,A1,A2), sort(A2,A), !.
wszystkieMozliweRezolwenty(A,B):- wszystkieRezolwentyZbioruKlauzulAxiomow(A,X), append(A,X,X1), sort(X1,X2), wszystkieMozliweRezolwenty(X2,B).

%Druga czesc pracowni, predykat prove. Dziala jedynie, kiedy nie istnieje dowod sprzecznosci zbioru klauzul, a w drugim przypadku zwraca true.
prove(X, [([], axiom)]) :- memberchk([], X), !.

provePom(X, X1) :- sort(X, X1), wszystkieRezolwentyZbioruKlauzulAxiomow(X1, X2), memberchk([], X2), !.

prove(X, [(Var, axiom), (H, axiom), ([], (Var, 1,2))]) :- provePom(X, [H|T]), zmienna1(H), zmiennaNegacja(H), samaZmienna(H, Var), memberchk(Var, T), !.
prove(X, [(H, axiom), (Var, axiom), ([], (H, 1,2))]) :- provePom(X, [H|T]), zmienna1(H), zmiennaPozytywna(H), zamianaPozNaNeg(H, Var), memberchk(Var, T), !.

resolvePom(V, V, ~V, [(V, axiom), (~V, axiom), ([], (V, 1,2))]) :- !.

wspolneZmienne(X, Y, Z) :- listaZmiennych(X, X1), listaZmiennych(Y, Y1), intersection(X1, Y1, Z).


%Niestety nie potrafilem wykonac w pelni zadania, zatem zrobilem tyle ile moglem i takie przypadki jakie potrafilem. 