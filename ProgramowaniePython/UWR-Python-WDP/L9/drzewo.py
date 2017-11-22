from turtle import *
speed('fastest')
tracer(2,0)
pencolor('white')
setpos(-250,0)
def serweta(d, poziom):
	if poziom == 0:
		fd(d/2)
	else:
		pencolor('blue')
		serweta(d-15, poziom -1)
		lt(90)
		serweta(d-20, poziom -1)
		rt(90)
		serweta(d-20, poziom -1)
		rt(90)
		serweta(d-20, poziom -1)
		lt(90)
		serweta(d-15, poziom -1)
fillcolor('red')
begin_fill()
for k in range(4):
	for j in range(2):
		for i in range(2):
			serweta(60, 2)
			lt(90)
		rt(180)
	fd(10)
	rt(90)
end_fill()
pencolor('red')
fd(121)

rt(90)
fd(1.23)
pencolor('red')
lt(90)
pencolor('red')

fillcolor('green')
begin_fill()

for k in range(4):
	for l in range(2):
		for m in range(2):
			serweta(46.83,2)
			lt(90)
		rt(180)
	fd(5)
	rt(90)
end_fill()

pencolor('green')
fd(63)
pencolor('green')
rt(90)
fd(1)
pencolor('green')
lt(90)
pencolor('green')

fillcolor('blue')
begin_fill()
for x in range(4):	
	for y in range(2):
		for z in range(2):
			serweta(39.8,2)
			lt(90)
		rt(180)
	fd(5)
	rt(90)
end_fill()
exitonclick()
