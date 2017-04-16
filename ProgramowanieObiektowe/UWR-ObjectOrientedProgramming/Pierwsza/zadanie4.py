def szukanie(e, T): # funckja wyszukujące element 'e' w drzewie 'T'
  if T == None:
    return False
  n,left,right = T
  if e == n:
    return True
  if e < n:
    return szukanie(e, left)
  else:
    return szukanie(e, right)
    
def wstaw(e,T): # funckja wstawiająca element 'e' do drzewa 'T'
  if T == None:
    return (e, None, None)
  n,left,right = T
  
  if e == n:
    return T
    
  if e < n:
    newLeft = wstaw(e, left)
    return (n, newLeft, right)
  else:
    return (n, left, wstaw(e, right))

def liczba_elementow(T): # funkcja zwracająca liczbę elementów drzewa T
  if T is None:
    return 0
  elif T[0] is None:
    return "drzewo puste"
  else:
    for e in T:
      if e is None:
        return 0
      elif type(e) is not None: # Elementy zliczamy po wartości, która jest różna od None, ponieważ tak oznaczamy koniec drzewa.
        return 1 + liczba_elementow(T[1]) + liczba_elementow(T[2])
    
     
        
