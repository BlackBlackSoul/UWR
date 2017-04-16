%split
split([],_,AccS, AccS, AccB, AccB).
split([H|T], Med, AccS, Small, AccB, Big):-
	H<Med, !,
	split(T,Med,[H|AccS],Small,AccB, Big).

split([H|T], Med,AccS, Small, AccB, Big):-
	split(T,Med,AccS,Small,[H|AccB],Big).

split(List,Med,Small, Big):-
	split(List,Med,[],Small,[],Big).

%qsort
qsort(List, Sorted):-
	qsort(List, Sorted, []).

qsort([], Sorted, Sorted).

qsort([H|T], Sorted, Acc):-
	split(T, H, Small, Big),
	qsort(Big, NextAcc, Acc),
	qsort(Small, Sorted, [H|NextAcc]).