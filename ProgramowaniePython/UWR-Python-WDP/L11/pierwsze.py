alfabet = "a ą b c ć d e ę f g h i j k l ł m n ń o ó p r s ś t u w y z ź ż".split(" ")

def szyfrowanie(slowo, klucz):
  K = []
  slowo = slowo.lower()
  for letters in slowo:
    nr_litery = alfabet.index(letters)
    nowy_nr = nr_litery + klucz
    if nowy_nr > 32:
      nowy_nr = nowy_nr - 32
    K.append(alfabet[nowy_nr])
  return K
   
print (szyfrowanie('oopython', 6))

print (ord('ą'))
