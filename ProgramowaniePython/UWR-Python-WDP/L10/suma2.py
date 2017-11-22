def zbior_p(K):
	if K:
		reszta = zbior_p(K[1:])
		return reszta + [[K[0]] + x for x in reszta]
	return [[]]

L = set()

for e in zbior_p([1,2,3,100]):
	L.add(sum(e))

print (set(sorted(L)))

