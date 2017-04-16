from zadanie4 import *

# Drzewo reprezentowane jest jako krotka (korzen, lewe poddrzewo, prawe poddrzewo).
# Inicjalizuję drzewo jako wartość None przypisane do wartości zmiennej T.

print ("#------- DRZEWO T ---------#")
T= None
for i in range(3):
	T = wstaw(i, T)
	T = wstaw(-i, T)
print ("Drzewo:", T)
print ("Czy element -1 w drzewie?", szukanie(-1, T))
print ("Czy element 12 w drzewie?", szukanie(12, T))
print ("Czy element 1222 w drzewie?", szukanie(1222, T))
print ("Liczba elementów drzewa:", liczba_elementow(T))
print ("#------- DRZEWO K ----------#")
K = None
K = wstaw(None, K)
print ("Drzewo:", K)
print ("Liczba elementów drzewa: ", liczba_elementow(K))
print ("#------- DRZEWO L ---------#")
L = None
L = wstaw(1, L)
L = wstaw(12, L)
L = wstaw(14, L)
L = wstaw(-12, L)
L = wstaw(-3, L)
L = wstaw(32, L)
print ("Drzewo:", L)
print ("Czy element 144 w drzewie?", szukanie(144, L))
print ("Czy element -3 w drzewie?", szukanie(-3, L))
print ("Czy element 32 w drzewie?", szukanie(32, L))
print ("Liczba elementów drzewa:", liczba_elementow(L))
print ("#------- DRZEWO K ---------#")
K = None
K = wstaw('c', K)
K = wstaw('a', K)
K = wstaw('x', K)
K = wstaw('d', K)
print ("Drzewo:", K)
print ("Liczba elementów drzewa:", liczba_elementow(K))
