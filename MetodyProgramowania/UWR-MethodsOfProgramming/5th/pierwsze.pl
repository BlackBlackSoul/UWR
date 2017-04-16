%Zrobione bez pomocy akumlatora czy list różnicowych, zatem generuje użytki i może być niewydajne. 
appn([Acc], Acc) :- !.
appn([X, H|T], Y) :-
 append(X, H, NList),
 appn([NList|T], Y).
