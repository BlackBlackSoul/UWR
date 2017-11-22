A = int(input("Podaj pierwszą liczbę: "))
B = int(input("Podaj drugą liczbę: "))
N = int(input("Podaj długość ciągu: "))
lista = list(range(A, B+1))

def ciagi(listeczki, n):
	if n==0: 
		yield []
	else:
		for i in range(len(listeczki)):
			for j in ciagi(listeczki[i:],n-1):
				yield [listeczki[i]]+j
print ('Pierwsza wersja')  
for e in ciagi(lista, N):
	print (e,"", end = " ")
print (" ")
def ciagutek(n, a, b):
	if n == 0:
		return [[]]
	else:
		return [[e] + rest for e in range(a,b+1) for rest in ciagutek(n-1, e, b)]
print ('Druga wersja: ')
print (ciagutek(N, A, B))
