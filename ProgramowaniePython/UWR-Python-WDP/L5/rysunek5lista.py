from turtle import fd, rt, exitonclick, tracer, speed, lt, pencolor, begin_fill, end_fill, fillcolor
from random import randint

tracer(3,0)
speed('fastest')

def kwadraty(n):
    for k in range (n):
        for i in range(n):
            fillcolor(randint(0,1), randint(0,1), randint(0,1))
            begin_fill()
            for j in range(4):
                fd(30)
                rt(90)
            end_fill()
            fd(30)
        lt(180)
        fd(n*30)
        rt(180)
        lt(90)
        fd(30)
        rt(90)

kwadraty(10)

pencolor('white')
rt(90)
fd(30)
lt(90)
pencolor('black')


exitonclick()