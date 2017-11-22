plik = open('data.txt').read().split()
alfabet = "a ą b c ć d e ę f g h i j k l ł m n ń o ó p q r s ś t u v w x y z ź ż".split(" ")
slownik = dict()

for i in range(len(alfabet)):
	slownik[alfabet[i]] = i

K = []
def zliczanie(slowo):
	suma = 0
	slowo = slowo.lower()
	for j in range(1, len(slowo)):
		suma = slownik[slowo[j]] - slownik[slowo[j-1]]
		if suma < 0:
			break
	if suma < 0:
			return None
	else:
			return slowo

for e in plik:
	e = e.lower()
	if '-' in e or "#" in e or "|" in e or  "_" in e or  "+" in e or ":" in e:
		continue
	elif zliczanie(e) == None:
		continue
	else:
		K.append(zliczanie(e))
K = sorted(K,key = lambda x : -len(x))
print (K)
	
