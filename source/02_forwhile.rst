Week 2: Loops with `for` and `while`
====================================
Outcome: Students will learn basic control flow structures, `for` and `while` for repeating code execution under certain conditions. Students will also be exposed to basic cryptography, and its strong relationship to computation. 

.. Instructor notes
.. Message: for / while loops for iteration, use code to calculate wayy faster than humans on problems that can be iterated, intro to cryptography as a field greatly assisted by coding. 

What we will do:
	* Concept of `for` loops and `while` loops
	* Exercise: ASCII Animation
	* Exercise: Prime solver
	* Exercise: Caesar cipher
	.. * (Adv Exercise: Brute force guessing)

Concept of `for` loops and `while` loops 
----------------------------------------
.. Instructor notes
.. Estimated time: 20 mins
.. Section objective: 
	[X] Redo last weeks exercise with a very long list of numbers,  but with the power of 'for' loops. Use this example to walk through for loops. In the process, show range() constructor.
	[-] Show list comprehension, which is for loops in lists, specific for Python.
	[X] Show while loops

To start off, let's recap on some printing exercises. Picture what you need to do to print these numbers on your console.
::
	0
	1
	2
	3
	...
	...
	99
	100

You will need to type `print(n)` for each number `n`. Imagine doing this for numbers 0 to 100. Doing this can get exhausting and does take more time that we would want. Here, we'll introduce for loops! 

`for` loops
^^^^^^^^^^^

For loops are amazing in a sense that they make repetitive tasks a piece of cake. First, type this into the editor:
::
	for n in range(6):
	    print(n)

As we can see, it gives the same exact output that we wanted to achieve without us typing `print(n)` for each and every number `n`. 

.. note :: 
	The `range` constructor allows you to iterate over an integer *range*. The format is `range(start, stop)` or `range(stop)`, with the latter beginning from 0. For more info, Google it :) 

Now, remember how we created lists?
::
	my_zoo = ['elephant', 'tiger', 'dinosaur', 'dolphin', 'flamingo']

And how we printed lists before was:
::
	print(my_zoo)

Which gives:
::
	['elephant', 'tiger', 'dinosaur', 'dolphin', 'flamingo']

Now, let's say we want to print out the contents of our list, but with each item on its own line:
::
	elephant
	tiger
	dinosaur
	dolphin
	flamingo

In short, we want to look at each number process them separately. We can achieve this by typing into Spyder as follows:
::
	for animal in my_zoo:
	    print(animal)

At this point, have you pieced together the syntax for `for` loops? Here is the breakdown. 
::
	for var in iterable:
	    # This indent is important! Use the Tab key to indent
	    # It tells Python to loop over the chunk of code here
	    # 'var' is a variable that exists within the loop
	    # it refers to the nth item in the iterable, in the nth loop
	    # Do something with 'var', such as the following
	    print(var)

You will want to be careful with your variable names inside and outside the `for` loop. Try the following: 
::
	# We define x outside the for loop
	x = 'I am x outside the for loop!'
	list_of_x = ['I am x!', 'I am also x!!', 'Me three x!!!']
	print(x)

	# We re-use 'x' as the loop variable:
	for x in list_of_x:
	    print(x)

	# So ... what is 'x' now?
	print(x)

You should see the following:
:: 
	I am x outside the for loop!
	I am x! 
	I am also x!!
	Me three x!!!
	Me three x!!!

Therefore, we see that loop variables will persist i.e. still remain after the loop is completed. For this reason, we conventionally like to reserve `i` as a loop variable. 

Nested for loops
^^^^^^^^^^^^^^^^
What if we want to do a `for` loop in a `for` loop? These are what we call *nested* `for` loops.

Let's say you want to open a potion shop, and want all potions to have a bipartite name (i.e. two parts). You think of a list of words that are suitable in front, and a list of words suitable at the back. You want to see all combinations of words and choose your potion names from there. The fact that your newfound knowledge in Python will come in handy fills you with determination. 
::
	words_in_front = ['lemongrass', 'eternal', 'kampung-style', 'unbelievable', 'gypsy']
	words_at_back = ['zing', 'spice', 'danger', 'espresso']
	## YOUR CODE HERE

.. Instructor solution follows:
	for i in words_in_front:
	    for j in words_at_back:
	        print(i, ' ', j)

`while` loops
^^^^^^^^^^^^^
We've seen how you can use `for` loops to iterate over a known range. But ... what if you don't know the range in advance? 

There is another way to write loops, by using the `while` loop. If you know how many times you want to loop, by all means use `for` loops. However, if you don't know exactly how many times to loop, then it's best to use `while` loops. `while` loops ends when a specific condition is met while `for` loops end when the number of iterations are met. Now, let's look at the syntax of while loops to see what this means. 

Let's use the same objective we had before with the for loop, i.e to print all numbers from 0 to 100. This is how we would put it in a `while` loop:
:: 
	# We need to instantiate, i.e. create 'i'
	# Last time the 'for' loop created it for us
	i = 0 

	# While the condition is True, keep going!
	while(i < 100):
	    # Do something
	    print(i)

	    # In this case, we keep a counter
	    # 'for' loops do this automatically
	    # What happens if we don't have a counter?
	    i = i + 1

.. Note that:
	1. i is already defined in the for loops syntax, that means we don't have to instantiate i before we do the for loop. This is different with while loop in which we have to clearly instantiate i before the while loop or it won't work.
	2. In the for loop, there is no condition, we loop until we finish the amount of repetition. This is different with the while loop in which we have to clearly state the condition (i<6) so that it will end when i>=6.
	3. In the for loop, we don't have to increase the i number as a counter. It again follows the fundamental of repitition. However, in the while loop, we have to clearly increase the counter of i otherwise, we might go into an infinite loop.

The danger with `while` loops is that your loop *might* never end, as the end state is never met. Wonder what will happen if you try the following? 
::
	while(True):
	    print('.', end='')

.. note :: Press `Ctrl` + `C` to interrupt the console. This is equivalent to pressing the red stop square above Spyder's IPython console. If the console still does not respond, restart the console in Spyder from the menu bar. If somehow nothing is working, turn your computer off and on again. 

Exercise: ASCII Animation I
---------------------------
.. Instructor notes
.. Estimated time: 20 mins
.. Section objective: Get students thinking on how to solve problems with for loops. Requires string manipulation learnt from Week 1. 
.. Remarks: 
	* Unplanned exercise, suddenly came across this idea a few days before class. Thought it too good to pass up. 
	* Will need to actively check in w/ students to guide progress. 
	* Before moving on, review multiple solutions to this problem. 
	* Encourage those who finish early to move onto the next one. 

Use Python to animate the ball moving from the left to right by printing the ball's position on console. We want the code to output the following:
::
	[O___________________]
	[_O__________________]
	[__O_________________]
	[___O________________]
	[____O_______________]
	[_____O______________]
	[______O_____________]
	[_______O____________]
	[________O___________]
	[_________O__________]
	[__________O_________]
	[___________O________]
	[____________O_______]
	[_____________O______]
	[______________O_____]
	[_______________O____]
	[________________O___]
	[_________________O__]
	[__________________O_]
	[___________________O]

The output shown above has the character 'O' move from left to right, for every next line printed. 

There are many methods to solve this problem. Hint: You can do `5 * '_'` to output `_____`, which is 5 underscores in a row. 

Begin with the following template, and pay attention to the comments:
::
	LENGTH = 20 # Use this as length of animation
	PAUSE = 0.1

	import time
	# Use `time.sleep(PAUSE)` after printing a line 
	# to prevent the computer from going too fast! 

	## YOUR CODE HERE

Exercise: ASCII Animation II
----------------------------
.. Instructor notes
.. Estimated time: 15 mins
.. Section objective: Get students thinking further on how to solve problems with for loops, with while loops thrown into the mix. 
.. Remarks: 
	* Continuation of ASCII Animation I. 
	* Again, need to be on the move talking to students to stimulate their thinking. 
	* Review solutions before proceeding. 

Repeat ASCII Animation I, following the instructions below carefully:
	i. make your code print on the same line:
	::
		# `line` contains your string to print
		
		# Original
		# print(line)

		# Change to the following
		# You actually only need to introduce the line carraige character at the end,
		# shouldn't matter how you do it. Spyder has known issues with this though:
		# https://github.com/spyder-ide/spyder/issues/195
		# 
		# To see this in Spyder, select in the menu bar: 
		# Tools -> Preferences -> Run -> Execute in an external system terminal
		# 
		# To revert to normal, do: 
		# Tools -> Preferences -> Run -> Execute in current console

		print(line, end='\r')

	ii. make the ball rebound from the right to left, and
	iii. make the animation loop indefinitely.

.. note :: 
	* `\\r` is the carriage return character. It moves the cursor to the beginning of the line. 
	* `print` automatically ends with `\\n`, the newline character, making each `print` call begin on its own line. Thus, Specifying `end = '\r'` in `print` means the cursor will be moved to the front of the line for the next line.
	* Combined, this causes each successive call to `print` to overwrite the existing line, giving the impression of animation! 

Exercise: Prime finder
----------------------
.. Instructor notes
.. Estimated time: 15 mins
.. Section objective: More problem solving with for loops! Dipping into basic number theory. 
.. [X]Segue into the topic by talking about the applications of looping, which is anywhere that needs to iterate (repeat) through stuff. Checking whether a number is a prime number is a good way. 
.. [X]Explain what is a prime number. 
.. [X]Explain one simple way to determine if a number is prime or not. For each number, loop to check if it is divisible by all integers smaller than it, except for 1. If at any point it is fully divisible, can return status as not prime. If we go through the whole loop and no divisor works, it is therefore prime. 
.. [X]Note: Need to write instructor solution and show at the end
.. [X]Note: From instructor solution, extract skeleton code for if/else, since we've not touched on it yet. 
.. [X]Ask students to find all primes up to 100 as class exercise. Note time required. 

To repeat the message at the beginning of today's class, using loops is great when it comes to *iterating*, or in other words, repeating. One useful application is to check whether a number is a prime number. 

A prime number is an integer greater than 1 that can only be divided by 1 and itself. A simple method to determine whether a number is prime or not, is to check all potential divisors one by one. All potential divisors for a number are basically all integers smaller than it, up to one. If the number is fully divisible by any number, we then know it is not a prime number. If we go through all possible divisors, and no divisor works, the number is therefore prime. 

Given the description above, find all primes up to 1000 using the following tips:
	* `%` is the modulo operator. If `a % b == 0`, this means that `a` can be fully divisible by `b`. Keep in mind the definition of a prime number. 
	* For your reference, first eight primes are: 2, 3, 5, 7, 11, 13, 17, 19. If you can get these eight right, then your code should be okay. 

Use the boilerplate code below as we haven't covered `if/else` yet:
::
	NUM = 100

	## YOUR CODE HERE
	# For loop to iterate over each number
		is_prime = True

		## YOUR CODE HERE
		# Logic for prime checking

		if is_prime is True:
			print(str(i) + ' is prime')

.. Instructor solution:
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
			print(i)

.. [ ] Then do it again for 10000 primes and note down time required.
.. Message: Speed is the whole point of doing it using computers compared to humans. Code enables computation at speeds way faster than humans. Code helps us to solve problems that we can frame as a coding problem. 

Exercise: Caesar cipher
------------------------
.. Instructor notes
.. Estimated time: 20 mins
.. Section objective: Link the concept of iteration to real-world applications, in this case cryptography! 

.. [X]Move on to next class exercise, segue into cryptography, one of the fields in computer science. Code breaking. Very calculation-intensive, greatly assisted by coding. Computers had essential roles. Note down historical importance - Allies in WW2 breaking the Enigma cipher - security in encryption where algorithms are mathematically designed that computers CANNOT break them! Ahaa ... Establish that computation is key to modern digital society. 

As we get to the end of the class, let's look at one field that has greatly relied on computation: cryptography. In oversimplified terms, it is the art of sending coded messages. 

Just to show a peek into the field, from `Wikipedia <https://en.wikipedia.org/wiki/Key_size>`_:

	A key should, therefore, be large enough that a brute-force attack (possible against any encryption algorithm) is infeasible – i.e. would take too long to execute. Shannon's work on information theory showed that to achieve so-called perfect secrecy, the key length must be at least as large as the message and only used once (this algorithm is called the one-time pad). In light of this, and the practical difficulty of managing such long keys, modern cryptographic practice has discarded the notion of perfect secrecy as a requirement for encryption, and instead focuses on computational security, under which the computational requirements of breaking an encrypted text must be infeasible for an attacker. 

.. [X]Today we will be looking at one of the earliest cryptographic methods - Caesar cipher. Intro on Caesar. Find pictures. Give students text strings input, and have them run nested for loops to print out all 26 shifts, shifting character by character. Visually identify the correct unscrambled sentence. 
.. [X]Also need to supply text strings and decoded examples. 
.. [ ]Definitely need to work out an instructor solution for this to see how this is going to work. 

Today, we will be looking at one of the earliest cryptographic methods: the Caesar cipher, best known to be used by Julius Caesar. It works by shifting all letters in the message by a set number down the alphabet. For example, to encode "roses are red" with a shift of 3, we replace A with D, B with E, C with F, etc. 

	Plaintext:  ROSES ARE RED
	
	Ciphertext: URVHV DUH UHG

To translate ciphertext back to plaintext, we simply shift the letters back to the left by three letters. 

In this exercise, use `for` loops to decipher the following ciphertext, as well as identify the shift. Run the following code for hints:
::
	# Converting letters to their integer representation
	print(ord('a'))
	print(ord('b'))
	print(ord('c'))
	print(ord('a') + 2)
		
	# Converting integers to letters
	print(chr(97))
	print(chr(98))
	print(chr(99))

	# Example: Shifting 'g' to the right by 4 to get 'k'
	shift = 4
	k_num = ord('g') + shift
	print(chr(k_num))

	# Example: Shifting 'x' to the right by 5 to get 'c'
	shift = 5
	x_num = ord('x') + shift
	print(chr(x_num))

	# Oops! 
	# Pay attention to where the alphabets begin and end!
	print(ord('a'))
	print(ord('z'))

	# One more time! 
	# Remember that we have 26 letters in the alphabet
	# Example: Shifting 'x' to the right by 5 to get 'c'
	shift = 5
	x_num = (ord('x') - ord('a') + shift) % 26 + ord('a')
	print(chr(x_num))

	# Printing each character in a string
	# Remember that a string is basically a list of characters?
	for i in 'this should be printed on a single line!':
		print(i, end='')
	
	# Note that a blank space has a number too! 
	# You will want to skip spaces to not confuse yourselves
	print(ord(' '))

	# This is how to skip spaces
	string_with_spaces = 'this is how to skip spaces'
	for i in string_with_spaces:
		if i == ' ':
			continue
		else:
			print(i, end='')

Go ahead and get started with the ciphers below:
::
	cipher1 = "jhlzhy jpwolyz jhu il jyhjrlk if mylxblujf huhsfzpz"
	cipher2 = "lo yv yorqb clozfkd xii mlppfyib pefcq zljyfkxqflkp"
	cipher3 = "fsqoxobo mszrobc swzbyfo ezyx mkockb mszrobc li"
	cipher4 = "caqvo i lqnnmzmvb apqnb ib mikp xwaqbqwv qv bpm bmfb"
	cipher5 = "sldmprslyrcjw uc ugjj lm em mtcp rfc bcrygjq md tgeclcpc agnfcpq"
	cipher6 = "qtrpjht rdktgxcv iwtb lxaa gtfjxgt sdjqat iwt pkpxapqat raphh ixbt"
	cipher7 = "exw wkdwv zkb zh kdyh d olvw ri olqnv xqghu wkh ixuwkhu uhdglqj vhfwlrq"

.. Instruction solution: 
	cipher1 is a to h, shift 7
	cipher2 is a to x, shift 23
	cipher3 is a to k, shift 10
	cipher4 is a to i, shift 8
	cipher5 is a to y, shift 24
	cipher6 is a to p, shift 15
	cipher7 is a to d, shift 3
	plaintext1 = "caesar ciphers can be cracked by frequency analysis"
	plaintext2 = "or by brute forcing all possible shift combinations"
	plaintext3 = "vigenere ciphers improve upon caesar ciphers by"
	plaintext4 = "using a different shift at each position in the text"
	plaintext5 = "unfortunately we will no go over the details of vigenere ciphers"
	plaintext6 = "because covering them will require double the available class time"
	plaintext7 = "but thats why we have a list of links under the further reading section"

Conclusion
----------
.. Instructor notes
.. Estimated time: <5 mins
.. Section objective: Recap and re-emphasize message

Take-away message for these week: Problems that can be iterated can be solved by looping, which allows us to make use of the computational advantage of computers :)

Further Reading
---------------
* Prime numbers: `https://en.wikipedia.org/wiki/Prime_number <https://en.wikipedia.org/wiki/Prime_number>`_ 
* Wikipedia article discussing key size for encryption: `https://en.wikipedia.org/wiki/Key_size <https://en.wikipedia.org/wiki/Key_size>`_
* More about the Enigma machine, which Germany used in World War II to secure their military transmissions: `https://en.wikipedia.org/wiki/Enigma_machine <https://en.wikipedia.org/wiki/Enigma_machine>`_
* The Ultra programme, wherein the Allies were able to crack the Enigma machine's encryption: `https://en.wikipedia.org/wiki/Ultra <https://en.wikipedia.org/wiki/Ultra>`_ 
* Caesar cipher: `http://practicalcryptography.com/ciphers/caesar-cipher/ <http://practicalcryptography.com/ciphers/caesar-cipher/>`_
* Vigenere cipher: `https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher <https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher>`_
* Looping operations can be sped up through vectorization: `https://en.wikipedia.org/wiki/Array_programming <https://en.wikipedia.org/wiki/Array_programming>`_