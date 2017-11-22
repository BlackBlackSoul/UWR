def rysuj_kwadraty(n, d, m):
	print(n*(d*"#" + m*" "))
	for i in range (d-m):
		print((d-2)*("#" + (d-2)*" " + "#" + m* " "))
	print((d-2)*("#" + (d-2)*" " + "#" + m* "#"))
	for i in range (m-2):
		print ((d-2)*("#" + (d-2)*" " + 2*"#" + (m-2) * " " + "#"))
	print((n*(d+m))*"#")
			
rysuj_kwadraty(6,8,4)
