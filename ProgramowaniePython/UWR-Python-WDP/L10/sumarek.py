example = [1,2,3,100]


K = []
def zbiorpotegowy(s):
  zbior_p = [[]]
  for e in s:
    for podzbior in zbior_p:
      zbior_p = zbior_p+[list(podzbior)+[e]]
  for i in range(len(zbior_p)):
	  K.append(sum(zbior_p[i])) 
  return set(K)


print (zbiorpotegowy(example))
			
