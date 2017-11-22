import random
 
def losowanie_slow(K):
    slowa = open('slowa.txt')
    wiersz = slowa.readlines()
    iterator = 0
    skladowe_slowa = {}
    wybrana_liczba = []
    while iterator != (2*K):
        x = random.randint(0,9)
        if x not in wybrana_liczba:
            iterator = iterator + 1
            wybrana_liczba.append(x)
 
    slowa_z_pliku = []
    for i in range(len(wybrana_liczba)):                        
        slowa_z_pliku.append(wiersz[wybrana_liczba[i]][:-1])

    permutacje = []
    for x in range(2*K):
        b = slowa_z_pliku[x]
        c = ''
        for j in range(len(slowa_z_pliku)):
            a = slowa_z_pliku[j]
            if a == b:
                continue
            for k in range(len(b)-1):
                c = b[0:k+1] + a + b[k+1:]              
                permutacje.append(c)
                skladowe_slowa[c]=str(b+' i '+a)
    #print (permutacje)
    print(slowa_z_pliku)

    prawslw = []
    f = open('plik.txt')                                      
    zbior_slow = set(f.read().splitlines())
    for c in range(len(permutacje)):
        if permutacje[c] in zbior_slow:
            prawslw.append(permutacje[c])
 
    for d in range(len(prawslw)):
        print(prawslw[d].upper(),'z',skladowe_slowa[prawslw[d]].upper())
 
losowanie_slow(5)
