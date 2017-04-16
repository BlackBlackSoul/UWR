iterator(X,0,X):-!.
iterator([_|X],N,Y):-
	NN is N-1,
	iterator(X,NN,Y).