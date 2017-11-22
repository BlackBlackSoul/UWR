def mset(L):
	wynik = {}

	for e in L:
		if not e in wynik:
			wynik[e] = 1
		else:
			wynik[e] += 1
	return wynik

def sprawdzenie_slow1(A,B):
	A = A.lower()
	B = B.lower()
	if not set(A) <= set(B):
		return False
	else:
		A_zbior = mset(A)
		B_zbior = mset(B)
		Bool_check = True
		for i in A_zbior.keys():
			if A_zbior[i] > B_zbior[i]:
				Bool_check = False
				break
		return Bool_check

def sprawdzenie_slow2(A,B):
	A = A.lower()
	B = B.lower()
	if not set(A) == set(B):
		return False
	else:
		A_zbior = mset(A)
		B_zbior = mset(B)
		Bool_check = True
		for i in A_zbior.keys():
			if not A_zbior[i] == B_zbior[i]:
				Bool_check = False
				break
		return Bool_check


L = set(open('plik.txt').read().split('\n'))

dane = input("Podaj imię i nazwisko do sprawdzenia: ")
dane = dane.lower()
dane_zbior = set(dane) - {" "}

def slowa_slownika(name):
	slowa = set()
	for x in open('plik.txt'):
		wiersz = x[:-1]
		if sprawdzenie_slow1(wiersz, dane):
			slowa.add(wiersz)
	return slowa

wszystkie_wyrazy = slowa_slownika(dane)
wyrazy_bez_par = set()

for element in wszystkie_wyrazy:
	for e in wszystkie_wyrazy:
		element = element.lower()
		e = e.lower()
		if sprawdzenie_slow2(element+" "+e, dane):
			dane = dane.lower()
			slowo_sample = element + " "+ e
			slowo_odwrocone = e + " "+ element
			if slowo_odwrocone not in wyrazy_bez_par:
				wyrazy_bez_par.add(slowo_sample)
wyrazy_bez_par = list(wyrazy_bez_par)
			
for i in range(len(wyrazy_bez_par)):
	print (str(i) + "-> " + wyrazy_bez_par[i].upper())
