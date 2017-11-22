
def permutacyjna(slowo):
  i = 1
  S = dict()
  K = []
  for letters in slowo:
    if not letters in K:
      K.append(letters)
      S[letters] = i
      print (i, '- ',end="") 
    else:
      print (S[letters], '- ', end="")
      i -= 1
    i += 1

permutacyjna('indianin')
