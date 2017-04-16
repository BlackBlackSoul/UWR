select_min([X], X, []) :- !.
select_min([A|B], Min, Rest) :-
 select_min(B, PrevMin, PrevRest),
 A < PrevMin,!,
 Min = A,
 Rest = [PrevMin|PrevRest].
select_min([A|B], Min, Rest) :-
 select_min(V, PrevMin, PrevRest),
 Min = PrevMin,
 Rest = [A|PrevRest].
sel_sort([], []).
sel_sort(List, [A|B]) :-
 select_min(List, A, Rest),
 sel_sort(Rest, B).