from math import *


def pierwsza(n):
    czy_pierwsza = True
    for i in range(2, int(sqrt(n)) + 1):
        if n % i == 0:
            czy_pierwsza = False
            break
    if czy_pierwsza:
        return True
    else:
        return False


Liczby = []


for i in range(1, 334):
    napis = str(1000 - i) + "7777777"
    if (pierwsza(int(napis))):
        Liczby.append(int(napis))


for i in range(1, 34):
    for j in range(10):
        napis = str(100 - i) + "7777777" + str(9 - j)
        if pierwsza(int(napis)):
            Liczby.append(int(napis))

for i in range(1, 4):
    for j in range(100):
        napis = str(10 - i) + "7777777" + str(99 - j)
        if pierwsza(int(napis)):
            if len(napis) != 10:
                break
            Liczby.append(int(napis))

Liczby = sorted(Liczby)

i = 0
while i < len(Liczby):
    print (Liczby[i])
    i += 1
print ("Tych liczb jest " + str((len(Liczby))))
print ("A największa z nich to: " + str(max(Liczby)))
