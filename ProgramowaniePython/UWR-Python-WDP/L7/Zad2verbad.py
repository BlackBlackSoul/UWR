from turtle import *
colormode(255)
def rysunek(n):
    for i in range (n):
        pencolor("black")
        for i in range (4):
            fd(5)
            rt(90)
        fd(5)
def strtotuple(n):
    n = n[1:-1]
    s = n.split(",")
    return (int(s[0])), int(s[1]), int(s[2])


i = 1
tracer(0,10)
speed('fastest')
pencolor("white")
setpos(100,125)
pencolor("black")
rt(90)
for wiersz in open('rysunek.txt'):
    w = wiersz[:-1]
    W = w.split(" ")
    for i in range (len(W)):
        colore = strtotuple(W[i])
        fillcolor (colore)
        pencolor(colore)
        begin_fill()
        for i in range (4):
            fd(5)
            rt(90)
        end_fill()
        fd(5)
    rt(90)
    fd(5)
    rt(90)
    fd(5*len(W))
    lt(180)
exitonclick()
