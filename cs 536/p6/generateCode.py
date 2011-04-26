import random

var = ["gi1", "gi2", "li1", "li2"]
binaryExps = ["+", "-", "*", "*", "&&", "||", "==", "!=", "<", ">", "<=", ">="]
unaryExps  = ["-", "!"]

def genExp(ttl):
	varChoice = random.randint(0,3)
	option = random.randint(1,3)
	if(option == 1 or ttl <= 0):
		return var[random.randint(0,3)]
	elif(option == 2):
		return unaryExps[random.randint(0,1)] +	'(' + genExp(ttl - 1) + ')'
	else:
		return "(" + genExp(ttl - 1) + ") " + binaryExps[random.randint(0,11)] + " (" + genExp(ttl - 1) + ")"

def genIf():
	print '\tif(', genExp(3), '){'
	print '\t\tint k; int l; k=1; l=2;'
	print '\t\tprintf("%d",', var[random.randint(0,3)],');'
	print '\t\tk = ', genExp(3), ';'
	print '\t\tprintf("%d",k);'
	print '\t\tl = ', genExp(3), ';'
	print '\t\tprintf("%d",l);'
	print '\t}'

def genElseIf():
	print '\tif(', genExp(3), '){'
	print '\t\tint k; int l; k=1; l=2;'
	print '\t\tprintf("%d",', var[random.randint(0,3)],');'
	print '\t\tk = ', genExp(3), ';'
	print '\t\tprintf("%d",k);'
	print '\t\tl = ', genExp(3), ';'
	print '\t\tprintf("%d",l);'
	print '\t} else {'	
	print '\t\tint k; int l; k=1; l=2;'
	print '\t\tprintf("%d",', var[random.randint(0,3)],');'
	print '\t\tk = ', genExp(3), ';'
	print '\t\tprintf("%d",k);'
	print '\t\tl = ', genExp(3), ';'
	print '\t\tprintf("%d",l);'
	print '\t}'

def genWhile():
	print '\tli1 = ', random.randint(0,100),';'
	print '\twhile(li1 > 0) {'
	print '\t\tint k; int l; k=1; l=2;'
	print '\t\tprintf("%d",', var[random.randint(0,3)],');'
	print '\t\tk = ', genExp(3), ';'
	print '\t\tprintf("%d",k);'
	print '\t\tl = ', genExp(3), ';'
	print '\t\tprintf("%d",l);'
	print '\t\tli1--;'
	print '\t}'

def genProg(rettype, name, callables, doDecl):
	print rettype, ' ', name, ' {'
	if doDecl:
		print '\tint li1; int li2; '
		print '\tli1 = 3; li2 = 4;'
	print '\tgi1 = 1; gi2 = 2;'		

	# Simple tests
	for i in range(0,11):
		chosenVar = 'gi1'
		print '\t', chosenVar, ' = ', var[random.randint(0,3)], binaryExps[i], var[random.randint(0,3)], ';'
		print '\tprintf("%d", ', chosenVar, ');'
		print '\t', chosenVar, ' = 1;'
	
	print '\tprintf("\\nEnd ', name, ' simple\\n");'

	# Nested tests
	for i in range(1,2):
		for j in range(1,2):
			chosenVar = var[random.randint(0,3)]
			print '\t', chosenVar, ' = ', genExp(3), ';'
			print '\tprintf("%d", ', chosenVar, ');'
		print '\tprintf("\\n");'

	print '\tprintf("\\nEnd ', name, ' nested\\n");'

	for i in range(1,2):
		genIf()

	print '\tprintf("\\nEnd ', name, ' if\\n");'

	for i in range(1,2):
		genElseIf()

	print '\tprintf("\\nEnd ', name, ' else\\n");'

	for i in range(1,2):
		genWhile()

	print '\tprintf("\\nEnd ', name, ' while\\n");'

	for i in range(1,10):
		if(len(callables) > 0):
			fn = callables[random.randint(0, len(callables)-1)]
			print '\tli1 = ', fn, ';'
			print '\tprintf("%d", li1);'

	print '\tprintf("\\nEnd ', name, ' call\\n");'

	if (rettype == 'int'):
		print '\treturn ', genExp(5), ';'
	print '}'


print 'int gi1; int gi2;'
genProg('int', 'one()', [], True)
genProg('int', 'two(int li1, int li2)', ['one()'], False)
genProg('int', 'three(int li1, int li2)', ['one()', 'two(li1, li2)'], False)
genProg('void', 'main()', ['one()', 'two(li1, li2)', 'three(li1, li2)'], True)
