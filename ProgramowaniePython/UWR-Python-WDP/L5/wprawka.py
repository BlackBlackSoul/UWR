from turtle import *
import random
L = ['red', 'orange', 'green', 'blue']
lt(90)
tracer(4,0)
up()
fd(180)
pd()
a = 20
b = -1

for i in range (37):
	if b > 3:	
		fillcolor(L[b-3])
		b = 0
	else:
		fillcolor(L[b])
		b += 1
	begin_fill()
	fd(a)
	rt(90)
	fd(15)
	rt(90)
	fd(a)
	rt(90)
	fd(15)
	rt(90)
	end_fill()
	rt(45)
	rt(45)
	up()
	fd(15)
	pd()
	lt(80)
	a += 2

rt(90)
fillcolor('yellow')
begin_fill()
for j in range(36):
	
	fd(15)
	rt(10)
end_fill()

exitonclick()
