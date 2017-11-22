def dzielenie(L):
    if len(L) % 2 != 0:
        dlugosc = len(L) - 1
        dlugosc1 = dlugosc // 2
        dlugosc2 = dlugosc - dlugosc1 + 1
    else:
        dlugosc1 = len(L) // 2
        dlugosc2 = len(L) - dlugosc1
################################################
    lista1 = L[0:dlugosc1]
    lista2 = L[dlugosc1:]
################################################
    return lista1, lista2

L = [-23,-43,-15,128,65]

def scal(A,B):
    K = list(range(len(A)+len(B)))
    i = 0
    j = 0
    k = 0
    while i < len(A) and j < len(B):
        if A[i] < B[j]:
            K[k] = A[i]
            i = i + 1
        else:
            K[k] = B[j]
            j = j + 1
        k = k + 1

    while i < len(A):
        K[k] = A[i]
        i = i + 1
        k = k + 1

    while j < len(B):
        K[k] = B[j]
        j = j + 1
        k = k + 1

    return K


def sort(L):
    if len(L) <= 1:
        return L
    K = []

    L1, L2 = dzielenie(L)
    P1 = sort(L1)
    P2 = sort(L2)
    return scal(P1, P2)



print (sort(L))
