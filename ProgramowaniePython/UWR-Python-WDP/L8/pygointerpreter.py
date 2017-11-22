# -*- coding: utf-8 -*-

program = []
omijanie = []
linijka = -1

for x in open('prog.pygo'):
  linijka += 1
  L = x.split()
  if not L[0].startswith('#'):
    if L[0] == 'goto':
      if L[1].isdigit():
        program.append( ('goto', int(L[1])-1))
      else:
        program.append( ('goto', L[1]))
    elif L[0] == 'print':
      program.append( ('print', ' '.join(L[1:])))
    elif L[1] == '=':
      program.append( ('=', L[0], ' '.join(L[2:])))
    elif L[0] == 'if':
      if L[3].isdigit():
        program.append( ('if', ' '.join(L[1:-2]), int(L[-1])-1) )
      else:
        program.append( ('if', ' '.join(L[1:-2]), L[-1]) )
      
    else:
      if L[0].endswith(':'):
        if L[1] == 'goto':
            if L[1].isdigit():
              program.append( ('e', L[0], 'goto', int(L[2])-1))
            else:
              program.append( ('e', L[0], 'goto', L[2]))
        elif L[1] == 'print':
          program.append( ('e', L[0], 'print', ' '.join(L[2:])))
        elif L[2] == '=':
          program.append( ('e', L[0], '=', L[1], ' '.join(L[3:])))
        elif L[1] == 'if':
          if L[4].isdigit():
            program.append( ('e', L[0], 'if', ' '.join(L[2:-2]), int(L[-1])-1) )
          else:
            program.append( ('e', L[0], 'if', ' '.join(L[2:-2]), L[-1]) )   
        else:
          program.append( ('error',-1) )
      else:
        program.append( ('error',-1) )
  else: omijanie.append(linijka)

for p in program:
  print (p)

input()

PC = 0
E = {}

while PC < len(program):
  p = program[PC]
  if p[0] == 'e':
    if p[2] == 'goto':
      if p[3].isdigit():
        PC = p[3]
        while PC in omijanie:
          PC += 1
      else:
        licznik = 0
        for i in program:
          if p[3]+':' == i[1]:
            PC = licznik
            break
          licznik += 1
    elif p[2] == '=':
      E[p[3]] = eval(p[4], E)
      PC += 1
    elif p[2] == 'print':
      print( eval(p[3],E) )
      PC += 1
    elif p[2] == 'if':
      if eval(p[3], E) == True:
          if str(p[4]).isdigit():
            PC = p[4]
          else:
            licznik = 0
            for i in program:
              if str(p[4])+':' == i[1]:
                PC = licznik
                break
              licznik += 1
      else:
        PC += 1
    else:
      print ('Nieznana instrukcja', p) 
  else:
    if p[0] == 'goto':
      if p[1].isdigit():
        PC = p[1]
        while PC in omijanie:
          PC += 1
      else:
        licznik = 0
        for i in program:
          if p[1]+':' == i[1]:
            PC = licznik
            break
          licznik += 1
    elif p[0] == '=':
      E[p[1]] = eval(p[2], E)
      PC += 1
    elif p[0] == 'print':
      print( eval(p[1],E) )
      PC += 1
    elif p[0] == 'if':
      if eval(p[1], E) == True:
          if p[1].isdigit():
            PC = p[2]
          else:
            licznik = 0
            for i in program:
              if p[2]+':' == i[1]:
                PC = licznik
                break
              licznik += 1
      else:
        PC += 1
    else:
      print ('Nieznana instrukcja', p)
  PC = int(PC)
