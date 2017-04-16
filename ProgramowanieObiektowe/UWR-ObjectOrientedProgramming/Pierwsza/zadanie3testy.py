from zadanie3 import dodawanie, odejmowanie, mnozenie, dzielenie

#Liczby zespolone reprezentujemy jako parę (krotkę), w której pierwsza 
#liczba to część rzeczywista, a druga to część urojona.

def testy_dodawania():  
 print ("DODAWANIE")
 L1 = (12, 55)
 L2 = (12, 77)
 L3 = (-12, 66)
 L4 = (1020121, 1212)
 L5 = (-12, 44)
 L6 = (12, 22)
 print (L1,'+', L2, '=', dodawanie(L1, L2))
 print (L3,'+', L4, '=', dodawanie(L3, L4))
 print (L5,'+', L6, '=', dodawanie(L5, L6))	
 print ()

def testy_odejmowanie():  
 print ("ODEJMNOWANIE")
 L1 = (12, 55)
 L2 = (12, 77)
 L3 = (-12, 66)
 L4 = (1020121, 1212)
 print (L1,'-', L2, '=', odejmowanie(L1, L2))
 print (L3,'-', L4, '=', odejmowanie(L3, L4))
 print () 

def testy_mnozenie():
 print ("MNOŻENIE")
 L1 = (0,1)
 L2 = (0,1)
 print (L1, '*', L2, '=', mnozenie(L1, L2)) 
 print ()

def testy_dzielenie():
 print ("DZIELENIE")
 L1 = (12,3)
 L2 = (44,3)
 print (L1, '/', L2, '=', dzielenie(L1, L2))
 print ()

print ("Liczby zespolone postaci: (czesc_rzeczywista, czesc_urojona)")
print ()
testy_dodawania()
testy_odejmowanie()
testy_mnozenie()
testy_dzielenie()
