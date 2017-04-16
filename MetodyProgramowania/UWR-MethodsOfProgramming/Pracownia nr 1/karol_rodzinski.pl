%:- module(karol_rodzinski, [solve/2]).

% Definiujemy operatory negacji i alternatywy
:- op(200, fx, ~).
:- op(500, xfy, v).

% Podstawowe predykaty do generowania listy zmiennych w klauzulach 
zmienna(X) :- X \= _ v _, X \= ~_.
czy_nie_literal(X) :- X \= _ v _.
zmienne_w_literalach(A,[A]) :- zmienna(A).
zmienne_w_literalach(~A,[A]) :- zmienna(A). 
zmienne_w_literalach(A v B,[A|X2]) :- zmienna(A), zmienne_w_literalach(B,X2), \+ member(A, X2), !.
zmienne_w_literalach(A v B,[C|X2]) :- czy_nie_literal(A), A = ~C, zmienne_w_literalach(B,X2), \+ member(C,X2), !.
zmienne_w_literalach(A v B,X) :- zmienna(A), zmienne_w_literalach(B,X), !.
zmienne_w_literalach(A v B,X) :- czy_nie_literal(A), zmienne_w_literalach(B,X).
lista_zmiennych_zdaniowych([],[]).
lista_zmiennych_zdaniowych([H|T],X):- zmienne_w_literalach(H,Y1), lista_zmiennych_zdaniowych(T,Y2), append(Y1,Y2,X).

% Predykaty do usuwania zmiennych, ktore juz maja swoje wartosciowanie
usun_zmienna(H,[],[]):- !.
usun_zmienna(H,[X|Pozostale],Pozostale_zmienne1):-
	szukanie_zmiennych(H,X),!,
	usun_zmienna(H,Pozostale,Pozostale_zmienne1).
usun_zmienna(H,[X|Pozostale],[X|Pozostale_zmienne1]):-
	usun_zmienna(H,Pozostale,Pozostale_zmienne1).
szukanie_zmiennych(X,X):- !.
szukanie_zmiennych(X,X v Y):- !.
szukanie_zmiennych(X,_ v Y):- szukanie_zmiennych(X,Y).
szukanie_zmiennych_negacja(X,~X):- !.
szukanie_zmiennych_negacja(X,~X v Y):- !.
szukanie_zmiennych_negacja(X,_ v Y):- szukanie_zmiennych_negacja(X,Y).
usun_zmienna_negacja(H,[],[]):- !.
usun_zmienna_negacja(H,[X|Pozostale],Pozostale_zmienne1):-
	szukanie_zmiennych_negacja(H,X), !,
	usun_zmienna_negacja(H,Pozostale,Pozostale_zmienne1).
usun_zmienna_negacja(H,[X|Pozostale],[X|Pozostale_zmienne1]):-
	usun_zmienna_negacja(H,Pozostale,Pozostale_zmienne1).

% Main, w którym rozpatrujemy przypadki wartosciowan np. (p, t), (p, f).
solve(Clauses,Solution):-
	lista_zmiennych_zdaniowych(Clauses,X),
	delete(X, [], X),
	sort(X,Zmienne),
	solve(Clauses,Zmienne,Solution).
solve([],[],[]) :- !.
solve([],[H|T],[(H,x)|T1]) :- solve([],T,T1), !.
solve(Clauses,[H|Pozostale_zmienne],[(H,t)|Solution]):-
	usun_zmienna(H,Clauses,Clauses1),
	solve(Clauses1,Pozostale_zmienne,Solution).
solve(Clauses,[H | Pozostale_zmienne],[(H,f)|Solution]):-
	usun_zmienna_negacja(H,Clauses,Clauses1),
	solve(Clauses1,Pozostale_zmienne,Solution).
