def dodawanie(a, b): #Funkcja, która zwraca nowoutworzony element
  czesc_rzeczywista = a[0] + b[0]
  czesc_urojona = a[1] + b[1]
  return (str(czesc_rzeczywista)+'+'+str(czesc_urojona)+'i')

def odejmowanie(a, b): #Funkcja, która zwraca nowoutworzony element
  czesc_rzeczywista = a[0] - b[0]
  czesc_urojona = a[1] - b[1]
  return (str(czesc_rzeczywista)+'+'+str(czesc_urojona)+'i')

def mnozenie(a, b): #Funkcja, która zwraca nowoutworzony element
  czesc_rzeczywista = a[0]*b[0]-a[1]*b[1]
  czesc_urojona = a[0]*b[1] + a[1]*b[0]
  return (str(czesc_rzeczywista)+'+'+str(czesc_urojona)+'i')

def dzielenie(a, b): #Funkcja, która zwraca nowoutworzony element
  czesc_rzeczywista = (a[0]*b[0] + a[1]*b[1])/(b[0]**2 + b[1]**2)
  czesc_urojona = (a[1]*b[0] - a[0]*b[1])/(b[0]**2 + b[1]**2)
  return (str(czesc_rzeczywista)+'+'+str(czesc_urojona)+'i')

#----------------------------------------------------------------------#
# Poniżej analogiczne funkcje do powyższych, jednak modyfkiują one tylko
# drugi argument (zgodnie z treścią zadania), a nie zwracają niczego. 
# Print w tych funkcjach wypisz None.

def odejmowanie1(a, b): #Funkcja, która modyfikuje drugi z arguemntów.
  pom_a = a[0] - b[0]
  pom_b = a[1] - b[1]
  b = pom_b

def dodawanie1(a, b): #Funkcja, która modyfikuje drugi z arguemntów.
  pom_a = a[0] + b[0]
  pom_b = a[1] + b[1]
  b = pom_b

def mnozenie1(a, b): #Funkcja, która modyfikuje drugi z arguemntów.
  pom_a = a[0]*b[0]-a[1]*b[1]
  pom_b = a[0]*b[1] + a[1]*b[0]
  b = pom_b

def dzielenie1(a, b): #Funkcja, która modyfikuje drugi z arguemntów.
  if b[0] == 0 or b[1] == 0:
    return "Nie można dzielić przez 0!!" 
  else:
    a_pom = (a[0]*b[0] + a[1]*b[1]) / (b[0]**2 + b[1]**2)
    b_pom = (a[0]*b[0] - a[1]*b[1]) / (b[0]**2 + b[1]**2)
    b = b_pom
