import math

def kółko(n):
	for i in range (n):
		print (int(i//2) * " " + (n-i)*"#")
		print (int(i//2) * " " + (n-i)*"#")
	
kółko(10)
