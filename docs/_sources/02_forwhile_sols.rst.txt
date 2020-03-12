Week 2: Class Exercise solutions
====================================

Nested for loops
----------------
Code:
::
	# Nested For Loops (Instructor Solution)
	# Created: Mar 12, 2020 Thu
	# Author: Tan Nian Wei

	words_in_front = ['lemongrass', 'eternal', 'kampung-style', 'unbelievable', 'gypsy']
	words_at_back = ['zing', 'spice', 'danger', 'espresso']
		
	## YOUR CODE HERE
	for i in words_in_front:
		for j in words_at_back:
			print(i + ' ' + j)

Output:
:: 
	lemongrass zing
	lemongrass spice
	lemongrass danger
	lemongrass espresso
	eternal zing
	eternal spice
	eternal danger
	eternal espresso
	kampung-style zing
	kampung-style spice
	kampung-style danger
	kampung-style espresso
	unbelievable zing
	unbelievable spice
	unbelievable danger
	unbelievable espresso
	gypsy zing
	gypsy spice
	gypsy danger
	gypsy espresso

Exercise: ASCII Animation I
---------------------------
Code:
::
	# ASCII Animation I (Instructor Solution)
	# Created: Mar 12, 2020 Thu
	# Author: Tan Nian Wei

	LENGTH = 20 # Use this as length of animation
	PAUSE = 0.1
	
	import time
	# Use `time.sleep(PAUSE)` after printing a line 
	# to prevent the computer from going too fast! 
	
	## YOUR CODE HERE

	for i in range(LENGTH+1):
		# Realize that with each line, we are simply moving 
		# underscores on the left of 'O' to the right of 'O'
		# one by one! 
		# We need to iterate to LENGTH + 1, because 
		# range(n) generates 0 to (n-1)! 
		
		before_ball = '_' * i
		after_ball = '_' * (LENGTH - i)
		
		# In Week 1, we've established that you can add strings! 
		line = '[' + before_ball + 'O' + after_ball + ']'
		print(line)
		
		# Slow down terminal printout
		time.sleep(0.1)

Output:
::
	[O____________________]
	[_O___________________]
	[__O__________________]
	[___O_________________]
	[____O________________]
	[_____O_______________]
	[______O______________]
	[_______O_____________]
	[________O____________]
	[_________O___________]
	[__________O__________]
	[___________O_________]
	[____________O________]
	[_____________O_______]
	[______________O______]
	[_______________O_____]
	[________________O____]
	[_________________O___]
	[__________________O__]
	[___________________O_]
	[____________________O]

Exercise: ASCII Animation II
----------------------------
Code:
::
	# ASCII Animation II (Instructor Solution)
	# Created: Mar 12, 2020 Thu
	# Author: Tan Nian Wei

	LENGTH = 20
	PAUSE = 0.1
	
	import time

	while True:
		
		# Run left-to-right ...
		for i in range(LENGTH+1):
			before_ball = '_' * i
			after_ball = '_' * (LENGTH - i)
			line = '[' + before_ball + 'O' + after_ball + ']'
			print(line, end='\r')
			time.sleep(0.1)
			
		# Then run right-to-left ...
		for i in range(LENGTH+1):
			before_ball = '_' * (LENGTH - i)
			after_ball = '_' * i
			line = '[' + before_ball + 'O' + after_ball + ']'
			print(line, end='\r')
			time.sleep(0.1)
		
		# And put it in a loop to run forever! 
Output:

.. figure:: images/week2-ascii2.svg
   :alt: GIF not found

   TODO: Still need this GIF! 

Exercise: Prime finder
----------------------
Code:
::
	# Prime finder (Instructor Solution)
	# Created: Mar 12, 2020 Thu
	# Author: Tan Nian Wei

	NUM = 1000

	for i in range(2, NUM):
		is_prime = True
	
		## YOUR CODE HERE
		for j in range(2, i):
			# If i can be fully divisible by j
			# Means i cannot be prime
			if i % j == 0:
				is_prime = False
		## YOUR CODE ABOVE

		if is_prime is True:
			print(str(i))

Output:
::
	2
	3
	5
	7
	11
	13
	17
	19
	23
	29
	31
	37
	41
	...
	...
	937
	941
	947
	953
	967
	971
	977
	983
	991
	997

Exercise: Caesar Cipher
-----------------------
Code:
::
	# Caesar Cipher (Instructor Solution)
	# Created: Mar 12, 2020 Thu
	# Author: Tan Nian Wei	

	cipher1 = "jhlzhy jpwolyz jhu il jyhjrlk if mylxblujf huhsfzpz"
	cipher2 = "lo yv yorqb clozfkd xii mlppfyib pefcq zljyfkxqflkp"
	cipher3 = "fsqoxobo mszrobc swzbyfo ezyx mkockb mszrobc li"
	cipher4 = "caqvo i lqnnmzmvb apqnb ib mikp xwaqbqwv qv bpm bmfb"
	cipher5 = "sldmprslyrcjw uc ugjj lm em mtcp rfc bcrygjq md tgeclcpc agnfcpq"
	cipher6 = "qtrpjht rdktgxcv iwtb lxaa gtfjxgt sdjqat iwt pkpxapqat raphh ixbt"
	cipher7 = "exw wkdwv zkb zh kdyh d olvw ri olqnv xqghu wkh ixuwkhu uhdglqj vhfwlrq"

	# For each possible shift value
	for i in range(26):
		shift = i + 1
		print('Shift number: ' + str(shift))
		
		# For each character in the string
		for j in cipher1:
			
			# If it's a space ...
			if j == ' ':
				# Print space again! 
				print(' ', end='')
				
			# If it's a character ...
			else:
				# Print the shifted character!
				num = (ord(j) - ord('a') + shift) % 26 + ord('a')
				print(chr(num), end='')
				
		# Print a new line to keep it tidy
		print()

Just showing `cipher1` only:
::
	Shift number: 1
	kimaiz kqxpmza kiv jm kziksml jg nzmycmvkg ivitgaqa
	Shift number: 2
	ljnbja lryqnab ljw kn lajltnm kh oanzdnwlh jwjuhbrb
	Shift number: 3
	mkockb mszrobc mkx lo mbkmuon li pboaeoxmi kxkvicsc
	Shift number: 4
	nlpdlc ntaspcd nly mp nclnvpo mj qcpbfpynj lylwjdtd
	Shift number: 5
	omqemd oubtqde omz nq odmowqp nk rdqcgqzok mzmxkeue
	Shift number: 6
	pnrfne pvcuref pna or penpxrq ol serdhrapl nanylfvf
	Shift number: 7
	qosgof qwdvsfg qob ps qfoqysr pm tfseisbqm obozmgwg
	Shift number: 8
	rpthpg rxewtgh rpc qt rgprzts qn ugtfjtcrn pcpanhxh
	Shift number: 9
	squiqh syfxuhi sqd ru shqsaut ro vhugkudso qdqboiyi
	Shift number: 10
	trvjri tzgyvij tre sv tirtbvu sp wivhlvetp rercpjzj
	Shift number: 11
	uswksj uahzwjk usf tw ujsucwv tq xjwimwfuq sfsdqkak
	Shift number: 12
	vtxltk vbiaxkl vtg ux vktvdxw ur ykxjnxgvr tgterlbl
	Shift number: 13
	wuymul wcjbylm wuh vy wluweyx vs zlykoyhws uhufsmcm
	Shift number: 14
	xvznvm xdkczmn xvi wz xmvxfzy wt amzlpzixt vivgtndn
	Shift number: 15
	ywaown yeldano ywj xa ynwygaz xu bnamqajyu wjwhuoeo
	Shift number: 16
	zxbpxo zfmebop zxk yb zoxzhba yv cobnrbkzv xkxivpfp
	Shift number: 17
	aycqyp agnfcpq ayl zc apyaicb zw dpcosclaw ylyjwqgq
	Shift number: 18
	bzdrzq bhogdqr bzm ad bqzbjdc ax eqdptdmbx zmzkxrhr
	Shift number: 19
	caesar ciphers can be cracked by frequency analysis
	Shift number: 20
	dbftbs djqifst dbo cf dsbdlfe cz gsfrvfodz bobmztjt
	Shift number: 21
	ecguct ekrjgtu ecp dg etcemgf da htgswgpea cpcnauku
	Shift number: 22
	fdhvdu flskhuv fdq eh fudfnhg eb iuhtxhqfb dqdobvlv
	Shift number: 23
	geiwev gmtlivw ger fi gvegoih fc jviuyirgc erepcwmw
	Shift number: 24
	hfjxfw hnumjwx hfs gj hwfhpji gd kwjvzjshd fsfqdxnx
	Shift number: 25
	igkygx iovnkxy igt hk ixgiqkj he lxkwaktie gtgreyoy
	Shift number: 26
	jhlzhy jpwolyz jhu il jyhjrlk if mylxblujf huhsfzpz