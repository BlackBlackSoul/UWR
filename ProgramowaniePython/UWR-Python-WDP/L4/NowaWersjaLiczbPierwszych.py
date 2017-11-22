from math import sqrt


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


L = []


for i in range(100,1000):
        napis = str(i) + "7777777"
        if (pierwsza(int(napis))):
                L.append(int(napis))
                
for i in range(1000):
        if i < 10:
                napis = "777777700" + str(i)
        if i >= 10 and i < 100:
                napis = "77777770" + str(i)
        else:
                napis = "7777777" + str(i)
        if (pierwsza(int(napis))):
                L.append(int(napis))


for i in range(10,100):                         #xy7777777z
        for j in range (10):
                napis = str(i) + "7777777" + str(j)
                if (pierwsza(int(napis))):
                        L.append(int(napis))

for i in range (1, 10):                         #x7777777yz
        for j in range(100):
                if j < 10:
                        napis = str(i) + "77777770" + str(j)
                else:
                        napis = str(i) + "7777777" + str(j)
                if (pierwsza(int(napis))):
                        L.append(int(napis))
L = set(L)
L = sorted(L)
L2 = L[:]
licznik = 0
while licznik < len(L2):
	print (L2[licznik])
	licznik += 1

print ("Wszystkich liczb jest: " + str(len(L)))
