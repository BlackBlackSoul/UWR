my_length([], 0).
my_length([_|T], N) :- 
     	nonvar(N),
        N > 0, 
        my_length(T, X), N is 1 + X, !.
my_length([_|T], N) :-
        my_length(T, X), N is 1 + X.