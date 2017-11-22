def zamianaS(S):
    K = {}
    for e in S:
        if e in K:
            K[e] += 1
        else:
            K[e] = 1
    return K

def sprawdzanie(A,B):
    a = zamianaS(A)
    b = zamianaS(B)
    akeys = sorted(list(a.keys()))
    bkeys = sorted(list(b.keys()))
    i = 0
    for element in bkeys:
        if element not in akeys:
            continue
        else:
            print ("Znaleziono literę: " + element + " w słowie "+ A)
            i += 1
    if len(B) == i:
        print ("Całe słowo: " + B.upper() + " zawiera się w słowie: " + A.upper() + ", a zatem można ułożyć drugie z pierwszego :)")
    else:
        print ("Niestety, znalazłem tylko tyle literek: " + str(i) + ". A potrzeba było tyle: " + str(len(B)))

sprawdzanie("Lokomotywa", "kot")


