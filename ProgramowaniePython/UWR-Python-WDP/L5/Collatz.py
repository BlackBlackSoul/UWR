def Collatz(n):
	i = 0
	while n != 1:
		if n % 2 == 0:
			n = n / 2
		else:
			n = 3 * n + 1
		i += 1
	return i 

def AnalizaCollatza(a, b):
    L = []
    suma = Collatz(a)
    minimum = Collatz(a)
    maksimum = minimum
    suma = 0
    roznica = b - a
    dzielniksredniej = roznica + 1
    for i in range (a, b+1):
        y = Collatz(i)
        if minimum > y:
            minimum = y
        if maksimum < y:
            maksimum = y
        L.append(Collatz(i))
        suma = suma + y
    mediana = 0
    srednia = 0
    srednia = suma / dzielniksredniej
    L2 = L[:]
    L = sorted(L)
    dlugosc = len(L)
    if (dlugosc % 2 == 0):
        mediana = (L[int(dlugosc / 2 - 1)] + L[int(dlugosc / 2)]) / 2
    else:
        mediana = L[int(dlugosc/2)]
    print ("Oto nasza lista energii od liczby " + str(a) + " do " + str(b) + ":", end =" ")
    print (L2)
    print ("A tutaj ją posortowaliśmy do wyliczenia mediany:", end = " ")
    print (L)
    print ("Maksymalna wartość energii to: " + str(maksimum))
    print ("Minimalna wartość energii to: " + str(minimum))
    print ("Mediana z energii: " + str(mediana))
    print ("Srednia z tyh energii: " + str(srednia))


AnalizaCollatza(10,30)
