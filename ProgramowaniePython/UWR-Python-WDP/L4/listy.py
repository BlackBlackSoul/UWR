import random

"""
W tym programie znajduje sie kilka prostych funkcji demonstrujacych operacje na listach.

[!] oznacza, ze w danym miejscu konieczne jest dopisanie (ew. zmiana) istniejacego kodu.

Prawidlowy wynik dzialania programu znajduje sie na stronie KNO
"""

def parzysta(n):
	if (n % 2 == 0): return True


#
# Funkcje, ktore licza cos dla listy
#

def suma1(L):
	wynik = 0
	for element in L:
		wynik += element
	return wynik

def suma2(L):
	wynik = 0
	for index in range(len(L)):
		wynik += L[index]
	return wynik

def sumaParzystych(L):
	wynik = 0
	for element in L:
		if parzysta(element):
			wynik += element
	return wynik

#
# Funkcje (procedury), ktore robia cos dla listy (ale nie modyfikuja listy)
#

def zeSpacjami(n,k):
	s = str(n)
	if len(s) < k:
		for i in range (k - len(s)):
			s += "_"  
	return s  

def histogram(L):
	for liczba in L:
		print (zeSpacjami(liczba, 3)+ "*" * liczba) #[!]

#
# Funkcje (procedury), ktore modyfikuja liste, bedaca argumentem
#

def powiekszLiczby(L):
	for index in range(len(L)):
		L[index] += 1
		

def normalizuj(L):
	srednia = int(suma1(L) / len(L))
	for i in range (len(L)):
		L[i] = float(L[i])
	for i in range (len(L)):
		L[i] -= srednia;

def znormalizowana(L):
	return L           


#
# Funkcje, ktore tworza nowe listy
#   

def powiekszoneParzysteZZerami(L):
	wynik = []
	for n in L:
		if parzysta(n):
			wynik.append(n+1)  # Jesli wolisz: wynik += [n+1]
			wynik.append(0)    # Znowu, mozna: wynik += [0]
	return wynik      

def madrzejsza(L): #[!]

	madreSlowa = ["istotnie", "zasadniczo", "rudymentalnie", "rustykalnie", "radykalnie", "hej"]

	wynik = []
	wynik += L
	for index in range(len(L)):
		if len(L[index]) <= 3:
			wynik.remove(L[index])
	i = 1
	while i < len(wynik) + 1: 
		wynik.insert(i, (random.choice(madreSlowa)))
		i += 2
	return wynik


###################################################################################
# Demonstracja dzialania
###################################################################################

L = [1,2,3,4,5]

print ("Dla listy " + str(L) + " suma elementow rowna sie")
print (suma1(L))
print (suma2(L))
print ("Jak zsumujemy tylko parzyste, to otrzymamy")
print (sumaParzystych(L))
print ("")         

H = [1,2,3,4,5,6,7,4,8,4,8,2,2,1,10]
print ("Histogram dla listy " + str(H))
histogram(H)
print ("")         

print ("Zaczynamy od " + str(L) + " i zwiekszamy 4 razy")

powiekszLiczby(L); print (L) # raczej nie uzywamy srednikow, ale tu nie moglem sie powstrzymac
powiekszLiczby(L); print (L)
powiekszLiczby(L); print (L)
powiekszLiczby(L); print (L)

L = [1,2,3,4,5]
L2 = L[:]
print ("")         
print ("Zaczynamy od " + str(L2) + " i normalizujemy 3 razy")

normalizuj(L2); print (L2)
normalizuj(L2); print (L2)
normalizuj(L2); print (L2)

print ("Dlaczego ciagle to samo?")

print ("O, i znowu:")

normalizuj(L2); print (L2)
print ("Oczywiscie mamy " + str(L) + " == [1,2,3,4,5]") 

print ("")         
print ("Powiekszamy parzyste, pomijamy nieparzyste i wstawiamy 0 po")         
print (powiekszoneParzysteZZerami(L))


print ("Cos madrego na zakonczenie:")         
Dane = "nauka programowania w pythonie wcale nie jest taka trudna".split()
print (" ".join(madrzejsza(Dane)))


