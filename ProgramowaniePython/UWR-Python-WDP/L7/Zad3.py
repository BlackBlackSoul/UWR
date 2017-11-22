
def zamianaS(S):
    K = {}
    for e in S:
        if e in K:
            K[e] += 1
        else:
            K[e] = 1
    return K


def imiona(K):
    f = open('plik.txt')
    zbior_slow = list(f.read().splitlines())
    b = zamianaS(K)
    bkeys = sorted(list(b.keys()))
    S = []
    for element in zbior_slow:
        i = 0
        slownik_e = zamianaS(element)
        keyselem = sorted(list(slownik_e.keys()))
        for e in keyselem:
            if e not in bkeys:
                continue
            else:
                i += 1
        if i == len(element):
           S.append(element)

    #print (K)
    permutacje = []
    for x in range(len(S)):
        b = S[x]
        for j in range(len(S)):
            a = S[j]
            if a == b:
                continue
            for k in range(len(b)-2):
                c = b[0:k + 1] + a + b[k + 1:]
                if len(c) < len(K):
                    continue
                else:
                    permutacje.append(c)

imiona("bolesław prus")
