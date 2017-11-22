def czy_pierwsza(x):
	for n in range(2, int(x)):
		if (int(x) % n == 0):
			return False
			break
	else:
		return True
	

a = '7'
a = 3 * a
licz = 0
for i in range (100000):
	i = i + 2
	i = str(i)
	if any(a in i for x in a):
		if (czy_pierwsza(i)):
			licz += 1
			print (i, "jest liczbą pierwszą")
		else:
			print ("", end = "")

print("Liczba szęśliwych i zarazem pierwszych liczb to:", licz)		
