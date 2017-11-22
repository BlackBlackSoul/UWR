from random import choice
letters = "a ą á b c ć d e ę é f g h i í j k l ł m n ń o ó p q r s ś š t u ü w v x y z ź ż".split(" ")
prob_letters = {(a,b): [] for a in letters for b in letters}
i = 0
for name in open('imiona.txt').read().split('\n'):
	name = list(name)
	name.append('$')
	for i in range(len(name)-2):
		prob_letters[(name[i],name[i+1])].append(name[i+2])

def make_name():
	name = []
	name.append(choice(letters))
	name.append(choice(letters))
	i = 1
	while name[i] != '$':
		i+= 1
		list_to_find = prob_letters[(name[i-2],name[i-1])]
		if list_to_find == []:
			break
		to_append = choice(list_to_find)
		name.append(to_append)
	if name != [] and len(name) < 5:
		return make_name()
	else:
		name = name[:-1]
		return "".join(name)
	
for i in range(10):
	print (make_name())
		
	
