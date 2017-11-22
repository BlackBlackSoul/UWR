Tabelka = 'balEIN, dROrkA, oPGraW, boRAMO, arutak, szumet'.split(", ")

data = open('data.txt').read().split()
	
def jedna_linijka_normalne(slowo):
	K = []
	slowo = slowo.lower()
	for i in range(len(slowo)):
		for j in range(len(slowo)):
			candi = slowo[i:j+1]
			if candi == "":
				continue
			else: 
				K.append(candi)
	return K
def jedna_linijka_odwrocone(slowo):
	K = []
	slowo = slowo.lower()
	odwrocone = slowo[::-1]
	for i in range(len(odwrocone)):
		for j in range(len(odwrocone)):
			candi = odwrocone[i:j+1]
			if candi == "":
				continue
			else: 
				K.append(candi)
	return K

def jedna_kolumna_normlana(Tabela):
	K = []
	i = 0
	for j in range(len(Tabela)):	
		for e in Tabela:
			K.append(e[j])
		K.append('xxx')
		i+=1
	s = ''.join(K).split('xxx')
	return s
#print (jedna_kolumna_normlana(Tabelka))

S = set()
for k in Tabelka:
	for e in jedna_linijka_normalne(k):
		#print ('x', e)
		if e in data:
			S.add(e)
		else:
			continue

for k in Tabelka:
	for e in jedna_linijka_odwrocone(k):
		#print ('y', e)
		if e in data:
			S.add(e)
		else:
			continue
print (S)
		
