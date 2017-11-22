import linecache

count = -1
for count, wiersz in enumerate(open('plik.txt', 'rU')):
    pass
count += 1

L = set()
for i in range(1, count + 1):
    wiersz = linecache.getline('plik.txt', i)
    wiersz = wiersz[0:-1]
    L.add(wiersz)

K = []
for slowo in L:
    slowoodwrocone = slowo[::-1]
    if slowoodwrocone in L:
        K.append([slowoodwrocone, slowo])

X = []
Y = []
for i in range(len(K)):
    X.append(K[i][0])
    Y.append(K[i][1])

C = []
for slowo in X:
    slowonowe = slowo[::-1]
    C.append(slowonowe)
V = C + Y

B = list(set(V))
# print (B)
for i in range(len(B)):
    for slowo in B:
        if len(B) <= i:
          break
        if B[i] == slowo[::-1]:
          print ([B[i], slowo])
          B.pop(i)
