from turtle import fd, lt, speed, setx, pencolor, exitonclick
from math import sqrt
x=250
speed('fastest')

for i in range(4):
	fd(x)
	lt(90)
fd(x/2)
lt(45)
for i in range(4):
	fd(sqrt(2)*x/2)
	lt(90)
fd(sqrt(2)*x/4)
lt(45)	
for i in range(4):
	fd(x/2)
	lt(90)
fd(x/4)
lt(45)
for i in range(4):
	fd(sqrt(2)*x/4)
	lt(90)
fd(sqrt(2)*x/8)
lt(45)
for i in range(4):
	fd(x/4)
	lt(90)
fd(x/8)
lt(45)
for i in range(4):
	fd(sqrt(2)*x/8)
	lt(90)
fd(sqrt(2)*x/16)
lt(45)
for i in range(4):
	fd(x/8)
	lt(90)
fd(x/16)
lt(45)
for i in range(4):
	fd(sqrt(2)*x/16)
	lt(90)
fd(sqrt(2)*x/32)
lt(45)
	



exitonclick()
