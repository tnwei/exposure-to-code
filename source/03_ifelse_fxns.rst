Week 3: If/else, Functions
==========================
Outcome: Students will continue to learn basic control flow structures, specifically `if`/`else` statements. Students will also learn how to package repeatable code in functions.

.. Instructor notes
.. Message: Functions are really powerful when it comes to solving problems. Not different from copy-pasting code, but ease of use! Remember that code is to make things faster and easier! Writing good code makes you a lot more effective than writing bad code!

What we will do:
    * If, else and elif
    * Functions
    * Exercise: Fizz buzz
    * Exercise: Morse code reader
    .. * (Adv Exercise: Morse code writer)

If, else, and elif
------------------
.. Instructor notes:
.. Estimated time: 20 mins
.. Section objective: Introduce students to the concepts of if, else and elif
.. [ ] How to do things depending on how things go? If and else! Evaluates True / False - Can use any conditional statement

Today, we'll be introducing a new topic. The conditional statement of if and else. Picture this! It's a hot and sunny Saturday and it's lunchtime. You have two things you usually do. 1. Make hot water and fill up your handy Maggi TomYam Cup OR 2. Go downstairs to the Dewan Makan and eat like everyone else.

However, we know that you'll choose those two options depending on what the situation is. Let's say it is exactly 1.15pm and usually the Dewan Makan is full of people at that time. You don't like to wait, but you need to line up like everyone else to get your food. In this case, you'll just make you Maggi HotCup.
But, if it is not 1.15pm, the line would be far less shorter, so you could go to the Dewan Makan and just eat instead of a Maggi.

This is an example of a conditional statement. Easily put:

If it is 1.15pm
  Then Make Maggi
Else Go eat @ Dewan Makan.


.. [ ] Format of if-else (indent after colon, un-indent to signify end) - add some examples

Here's how we do it in Python!

if (TIME==1.15pm):
  print("Eat Maggi")
else:
  print("Eat food at Dewan Makan")


.. [ ] Perform in-class exercise that leads to students realizing you can nest if-elses! Phrase a problem in word form and have them practice translating it into code.

Now, the previous example is quite simple right? But, what if our thought process is more complicated than that? (Most often it is!). Let's extend from the previous example.

If it is 1.15pm, you have two choices of foods to eat. If Weather is Sunny, eat Maggi Asam Laksa. If Weather is Rainy, eat TomYam.
  Else, if not 1.15pm, eat at Dewan Makan

solution blueprint:

# These variable can be changed
TIME=1.15
WEATHER=RAINY


if(TIME==1.15):
  if(WEATHER==SUNNY):
    print("Eat Maggi Asam Laksa")
  if(WEATHER==RAINY):
    print("Eat Maggi TomYam")
else:
  print("Eat At Dewan Makan")

.. [ ] Have students do exercise that would be great with elif, using only if-else. After experiencing the hassle, then students will be able to appreciate elif!

Hope this example helps Nian Wei

Now, let's say we want to build a computer program that compares if number x is bigger than a few conditions.
Here are our few conditions. Let's try programming it to find out!

Condition 1: If x > 5 print larger than 5, else print not
Condition 2: If x <= -1 print less than or equal to -1, else print Not
Condition 3: If x > 7 print larger than 7, else print not
Condition 4: If x > 9 print larger than 9, else print not.

From what you have learnt, you would produce 4 separate if elses to compare each one. But, did you know there's an easier way.

Introducing elif! Our savior

elif which means 'else if' gives us the ability to make comparisons in the same block of code instead of having 4 separate block doing 4 separate things. This is how the code would look like

x=0

if x>5:
  print ("larger than 5")
elif x<=-1:
  print ("less than or equal to -1")
elif x>7:
  print ("larger than 7")
elif x>9:
  print ("larger than 9")
else:
  print ("x is 0 to 5")

.. [ ] Show how above's repeated comparisons can be reduced by using elif

As we can see from above, we need far less comparisons than before to achieve similar(not exactly same) results.

Functions
---------
.. Instructor notes:
.. Estimated time: 20 mins
.. Section objective: Introduce students to the concepts of functions, and the value of abstraction
.. [ ] Get students to do hands-on example, where the same code chunk needs to be repeated multiple times to do something slightly different every time.

Now, we are going to do introduce functions, but as always, let's see how hard is it to do things without functions first so we can appreciate a little.
Remember, no copy and pasting allowed in this section.

Print My name is Abu
Print My name is Chan
Print My name is Priya
Print My name is Roman
Print My name is Shaspreet
Print My name is R2-D2

.. [ ] Solve the problem again but w/ functions. Demonstrate how simple it is to change things up on the fly through parameters.

Now, it took some time to type ALL that down right. Now, let's introduce our all helpful functions!
But, before that, what are functions? Function are a section of code to help with doing things certain things that you use a lot in code. Our previous example was a repetition of My name is + name. Surely there should be an easier way to do this than going through print statements one by one. Here's an example:

Solution 1:

def my_funtion(name):
  print ("My name is " + name)

my_function("Abu")
my_function("Chan")
my_function("Priya")
my_function("Roman")
my_function("Shaspreet")
my_function("R2-D2")

Now, the previous function is a good implementation in solving the problem. However, is there an easier way to solve this? (Hint: Combine lists and for loop)
Solution 2:

def my_function(name):
  print ("My name is " + name)

names = ["Abu","Chan","Priya","Roman","Shaspreet", "R2-D2"]

for x in names:
    my_function(x)

This looks really simple and elegant! It uses several things we learnt in the past: lists, for loops and now functions!



.. [ ] Format of functions (def keyword, indentation) - small example to show what does the return keyword do

Note that when we start a function, we have to define it first! Hence the word 'def'. The indentation of what is contained in the function is exactly the same as everything we've done before this. Everything should be indented if it is meant to be under the function.
But, what if we want to use a function for a calculation and return the number being calculated. Is there anything special we need to write down. Yes, there is!

Introducing return!

Let's try creating a function that accepts a number and return the number * 5

def times_five(number):
  return number * 5

By typing return, the function will return to whatever code that called it the number * 5. It is important to note that by typing return, code that is written after return does not get executed.
We can run this code to look at what actually happens

def return_five(number):
    return number * 5
    number = 1

print(return_five(10))

This will return 50 and not 1. This is because we returned the number * 5, and any code after return will not be executed.



.. [ ] Little in-class exercise on what to phrase as inputs to function, and what to return
.. [ ] In-class exercise, phrase a problem in word form and have students build a function to solve it.

Here's a little exercise. Write a function called number_identification that evaluates and prints if a number is negative or positive or equals to zero. Here are the numbers to evaluates

1
2
7
-3
100
-100000
0
69420

Here's what we're aiming to achieve in our console:

1  is positive
2  is positive
7  is positive
-3  is negative
100  is positive
-100000  is negative
0  is zero
69420  is positive


#Solution:
def number_identification(number):
    if(number<0):
        print(number , " is negative")
    elif(number==0):
        print(number , " is zero")
    else:
        print(number , " is positive")

numbers =[1,2,7,-3,100,-100000,0,69420]

for x in numbers:
    number_identification(x)




.. [ ] Expand the problem, and show that by breaking problems down into functions, things are much easier to handle! Perhaps this just show, not do.

Now, let's say we want to expand the previous problem. Don't worry, you don't have to do this. In our number_identification function, before we identify the numbers, let's try seeing if a number is prime first, if it is prime, we can print it and skip number identification, if it is not prime, we can print not prime and continue with the number identification. Let's look at this!

def isPrime(number):
  #insert code here to evaluate prime with bool prime

  if(prime==True):
    print(number ," is Prime")
  else:
    print(number , " is not Prime")


def number_identification(number):
  if(isPrime(number)):
    continue
  else:
    if(number<0):
        print(number , " is negative")
    elif(number==0):
        print(number , " is zero")
    else:
        print(number , " is positive")

numbers =[1,2,7,-3,100,-100000,0,69420]

for x in numbers:
    number_identification(x)


Note that since isPrime function is called in number_identification function, isPrime has to be defined BEFORE number_identification, otherwise this error will appear
'NameError: name 'is_Prime' is not defined'


.. [] Btw, would it be nice to introduce recursion in this topic since we are talking about functions? Or is that a little too advanced at this point?

Exercise: Fizz Buzz
-------------------
.. Instructor notes:
.. Estimated time: 20 mins
.. Section objective: Introduce students to a classic programming problem that requires good understanding of if/else to solve, and put into practice combining applications of if/else and functions in the same exercise.
.. [ ] Fizz buzz problem statement
.. [ ] Fizz buzz instructor solution

Exercise: Morse code reader
-------------------------------
.. Instructor notes:
.. Estimated time: 30 mins
.. Section objective: Cement if/else and function concepts with an un-orthodox exercise!
.. [ ] Provide context: what is morse code? How does it work?
.. [ ] Problem statement: Given morse code, convert to alphabet.
.. [ ] Need to provide the conversion table and example, else everyone's format is going to be different! We should stick to using letters and spaces only.
.. [ ] Instructor solution for taking in alphabets and translating them into Morse code. String samples can only contain alphabets and spaces.
.. [ ] Instructor solution needed to check that the morse code reader from above works!!
.. [ ] Write next few emails for the course in Morse code (???) --> Safwan: Hahahaha, this would be cool!, however it's important to note that not everyone has laptops so their solutions from this exercise might still be in the computers in the lab

Conclusion
----------
.. Instructor notes
.. Estimated time: <5 mins
.. Section objective: Recap and re-emphasize message
.. [ ] Recap and re-emphasize message of the day

Further reading
---------------
_Python Crash Course: A Hands-on, Project-based Introduction to Programming_. Eric Matthes.
    * Chapter 5: If Statements
    * Chapter 8: Functions



.. Kept in reserve due to time constraints!
.. Exercise: Quadratic solver
.. --------------------------
.. Instructor notes:
.. Estimated time: 20 mins
.. Section objective: Combine application of if-else and functions on a topic familiar for high schoolers
.. [ ] Problem description
.. [ ] Instructor solution on solving quadratic eqn. Takes a, b, c and outputs roots. Gotta try because not sure how the system deals w/ imaginary roots!
