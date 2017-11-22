from turtle import fd, lt, speed, setx, pencolor, sety, begin_fill, end_fill, color, pensize, title, bye, exitonclick, bgcolor
from random import randint

szerokosc = int(input("1) Jaką szerokość wykresu chcesz? "))
ilosc = int(input ("2) Jak wiele słupków chcesz widzieć? "))
mini = int(input("3) Minimalna wysokość słupka: "))
maks = int(input("4) Maksymalna wysokość słupka: "))
colors = input("5) Jaki koloro słupka chcesz? Tylko angielskie nazwy: ")
ps = int(input("6) Jaki rozmiar długopisu chcesz? "))
sped = input("7) Podaj prędkość rysowania. Tylko angielski nazwy: ")
nazwa = input("8) Nazwa Twojego rysnku -> patrz nazwa okienka: ")
tlo = input("9) Jaki kolor tła chcesz?")
bgcolor(tlo)
title(nazwa)	
speed(sped)
pencolor(tlo)
setx(-1000)
sety(-500)
pencolor("black")
pensize(ps)


def slupek(szerokosc, x):
	begin_fill()
	color(colors)
	fd(szerokosc)
	lt(90)
	fd(x)
	lt(90)
	fd(szerokosc)
	lt(90)
	fd(x)
	lt(90)
	fd(szerokosc)
	end_fill()
def wykres(ilosc):
	for i in range (ilosc):
		x = randint(mini, maks)
		slupek(szerokosc, x)
wykres(ilosc)

exitonclick()
