from turtle import *
from random import randint

speed('fastest')
tracer(4,0)
BOK = 20

def kwadrat(bok, kolor):
  fillcolor(kolor)
  begin_fill()
  for i in range(4):
    fd(bok)
    rt(90)
  end_fill()

def zlicz(znak, napis):
  licznik = 0
  for z in napis:
    if z == znak:
      licznik += 1
  return licznik
kolory = ['red', 'green', 'blue', 'pink', 'yellow', 'black', 'orange', 'violet', 'brown', 'grey', 'white']
#kolory od 0 do 2

def murek(program, kolory):
  N = zlicz('f', program)
  pozycja = 0

  for x in program:
    if x == '0':
      kolor = kolory[0]
    elif x == '1':
      kolor = kolory[1]
    elif x == '2':
      kolor = kolory[2]
    elif x == '3':
      kolor = kolory[3]
    elif x == '4':
      kolor = kolory[4]
    elif x == '5':
      kolor = kolory[5]      
    elif x == '6':
      kolor = kolory[6]
    elif x == '7':
      kolor = kolory[7]
    elif x == '8':
      kolor = kolory[8]
    elif x == '9':
      kolor = kolory[9]
    elif x == '10':
      kolor = kolory[10]      
    elif x == 'f':
      a = pozycja / N
      kwadrat(BOK, kolor)
      pozycja += 1
      fd(BOK)
    elif x == 'r':
      rt(90)
      fd(BOK)
    elif x == 'l':
      bk(BOK)
      lt(90)  
    elif x == 'u':
      penup()
    elif x == 'd':
      pendown()
    elif x == 'b':
      for j in range (3):
        rt(90)
        fd(BOK)
      rt(90) 

def pokaz(N):
  murek('1f' ,kolory)
  for i in range (N):
    murek(str(randint(0,11)) + (i) * 'f', kolory)
    murek('r', kolory)
pokaz(14)

exitonclick()
