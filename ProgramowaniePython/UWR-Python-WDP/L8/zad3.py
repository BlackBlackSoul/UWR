def zbiorpotegowy(s):
  zbior_p = [[]]
  for e in s:
    for podzbior in zbior_p:
      zbior_p = zbior_p+[list(podzbior)+[e]]
  return zbior_p

K= list(range(4))
print (len(zbiorpotegowy([1,2,3,4])))
print ((zbiorpotegowy([1,2,3,4])))
