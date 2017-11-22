from random import *
def jedna_partia():
	W = { "A" : 4, "K" : 3, "Q" : 2, "J" : 1}
	C = { 0 : 3, 1: 2, 2: 1}
	
	Talia = {c + v for c in "234567890JQKA" for v in "CWDŻ"}
	wynik = 0
	czerwo = 0
	wino = 0
	dzwonek = 0
	żołądź = 0
	for e in sample(Talia, 13):
		#print (e)
		if e[0] in W:
			wynik = wynik + (W[e[0]])
		if e[1] == "C":
			czerwo += 1
		if e[1] == "W":
			wino += 1
		if e[1] == "D":
			dzwonek += 1	
		if e[1] == "Ż":
			żołądź += 1
		else:
			continue
	ilosc_kolorow = [czerwo, wino, dzwonek, żołądź]
	for element in ilosc_kolorow:
		if element in C:
			wynik += C[element]
		else:
			continue
	return wynik



licznik = 0
for i in range (100000):
	if jedna_partia() >= 12:
		licznik += 1
print (licznik/100000)

