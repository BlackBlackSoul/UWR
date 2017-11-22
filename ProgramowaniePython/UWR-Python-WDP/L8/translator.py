B = []
for x in open('pol_ang.txt'):
	x = x[:-1]
	wiersz = x.split('=')
	if len(wiersz) != 2:
		continue
	pol,ang = wiersz
	B.append(wiersz)


def popularnosc(K):
	S ={}
	for k in  open("brown.txt").read().split():
		if k in S:
			S[k] += 1
		else:
			S[k] = 1
	X = []
	maxi = 0
	slowo = 'kek'
	for e in S:
		if e in K:
			if S[e] > maxi:
				maxi = S[e]
				slowo = e
	return slowo
	

def tlumacz(L):
	S = []
	X = []
	slowo = 'a'
	wynik = []
	for w in L:
		for i in range(len(B)):
			if w == B[i][0]:
				S.append(B[i][1])	
		wynik.append((popularnosc(S)))
		S = []
	return wynik


print (tlumacz(['mąż', 'dolnie', 'chłopak', 'matka', "aberracja", 'liczba']))


