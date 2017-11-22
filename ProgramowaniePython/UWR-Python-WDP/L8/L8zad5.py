from random import shuffle
def zamianaS(S):
	K = {}
	for e in S:
		if e in K:
			K[e] += 1
		else:
			K[e] = 1
	return K
#####################33

def unikalneslowa():
	Alfabet = ['a','ą', 'b', 'c', 'ć', 'd', 'e', 'ę', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'ł', 'm', 'n', 'ń', 'o', 'p', 'q', 'r', 's', 'ś', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'ź', 'ż']
	Alfabet_p = Alfabet [:]
	K = []
	for wiersz in open('plik.txt'):
		w = wiersz[:-1]
		K.append(w)
	K = set(K)
	X = []
	for e in K:
		i = 0
		e = e.lower()
		dlugosc = len(e)
		kand = zamianaS(e)
		for element in kand.values():
				if element == 1:
					i += 1
		if i == dlugosc:
			X.append(e)
	shuffle(X)
	B = []
	for m in range (len(X)):
		p = 0
		wyraz = zamianaS(X[m])
		for el in wyraz.keys():
			if el in Alfabet:
				p += 1
				if p == len(X[m]):
					for t in range (len(X[m])):
						Alfabet.remove((X[m][t]))
					B.append(X[m])
				else:
					continue
	print (B)
	return Alfabet
	def zliczanie():
	Alfabet = ['a','ą', 'b', 'c', 'ć', 'd', 'e', 'ę', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'ł', 'm', 'n', 'ń', 'o', 'p', 'q', 'r', 's', 'ś', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'ź', 'ż']
	Alfabet_pom = {k: 0 for (k) in Alfabet}
	for y in range (1):
		for e in unikalneslowa():
			if e in Alfabet_pom:
				Alfabet_pom[e] += 1
	print (Alfabet_pom)
	O = []
	for k in Alfabet_pom.values():
		O.append(k)
	maximum = max(O)	
	K = []
	for d in Alfabet_pom:
		if Alfabet_pom[d] >= maximum:
			K.append(d)
	print (K) 
		
		
zliczanie()
