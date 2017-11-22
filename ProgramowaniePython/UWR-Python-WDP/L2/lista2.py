""" def szachownica(n,k):
	for i in range(n):
		for j in range(k):
			print (n*(k* " " + k * "#"))
		for j in range(k):
			print (n*(k*"#" + k*" "))

szachownica(4,3)

def koperta(n):
	print ((2*n+1)*"*")
	for i in range(n-1):
		print("*" + i*" " + "*" + (2*n-3-2*i)*" " + "*" + i*" " + "*")
	print("*" + (n-1)*" " + "*" + (n-1)*" " + "*")
	for i in range(n-1):
		print("*" + (n-i-2)*" " + "*" + (2*i +1)*" " + "*" + (n-i-2)*" " + "*")
	print ((2*n+1)*"*")
	

koperta(30)

D=2
for i in range(9):
	s = sin(0.1*i)/2 + 1/2
	h = int(D * s)
	if h == 0:
		h = 1
	print ( (D-h) * ' ' + 2 * h * '*')
from math import sin
def kolko(n):
	k = (n-1)/2
	D=n
	for i in range(n-4):
		s = sin(0.5*3.141592653*(i+2)/k)
		h = int(D * s)
		if h == 0:
			h = 3
		print ( (D-h-2)/2 * ' ' + (h+2) * '*')
		
kolko(28) """ 
from duze_cyfry import dajCyfre
 
numer = str(input())
L = list(numer)
 
liczba = ""
 
for i in range(5):
    for z in L:
        liczba += dajCyfre(int(z))[i] + " "
    liczba += "\n"
 
print (liczba)