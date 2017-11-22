from turtle import *


tracer(4,0)
def mieszanina(k1, k2, a):
  r1 = k1[0]
  g1 = k1[1]
  b1 = k1[2]
  
  r2,g2,b2 = k2
  
  r3 = (1-a) * r1 + a * r2
  g3 = (1-a) * g1 + a * g2
  b3 = (1-a) * b1 + a * b2
  
  return (r3,g3,b3)

def kwadrat(bok, kolor):
	fillcolor(kolor)
	begin_fill()
	for i in range(4):
		fd(bok)
		rt(90)
	end_fill()
	fd(bok) 
	

wielkosc = 2 
wielkosc2 = wielkosc + 17 

while wielkosc <= wielkosc2:
	a = wielkosc / 30
	for i in range (wielkosc):
		kwadrat(10, mieszanina((1,1,0), (1,0,1), a))
	rt(90)
	wielkosc = wielkosc + 1
	


a = exitonclick()
