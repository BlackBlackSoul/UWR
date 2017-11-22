def Collatz(n):
    while n! 1:
        if n % 2 == 0:
            n = n / 2
        else:
            n = 3 * n + 1

def AnalizaCollatza(a,b):
    L = []
    suma = Collatz(a)
    minimum = Collatz(a)
    maksimum = minimun
    suma = 0
    roznica = b - a
    dzielniksredniej = roznica + 1
    for i in range (a, b):
        y = Collatz(i)
        if minimum > y:
            minium = y
        if maksimum < y:
            maksimum = y
        L.append(Collatz(i))
        suma = suma + y
    mediana = 0
    srednia = 0
    srednia = suma / dzielniksredniej
    if (dzielniksredniej % 2 == 0):
        mediana = (L[int(roznica - 1)] + L[int(roznica)]) / 2
    else:
        mediana = L[int(roznica)]
    print (mediana)
    print (srednia)
    print (maksimum)
    print (minimum)
AnalizaCollatza(7,10)