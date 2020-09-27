Week 3: If/else, Functions
==========================
Outcome: Students will continue to learn basic control flow structures, specifically `if`/`else` statements. Students will also learn how to package repeatable code in functions.

.. Instructor notes
.. Message: Functions are really powerful when it comes to solving problems. Not different from copy-pasting code, but ease of use! Remember that code is to make things faster and easier! Writing good code makes you a lot more effective than writing bad code!

What we will do:
    * If, else and elif
    * Functions
    * Exercise: Quadratic solver
    * Exercise: Fizz buzz


If, else, and elif
------------------
.. Instructor notes:
.. Estimated time: 20 mins
.. Section objective: Introduce students to the concepts of if, else and elif
.. [X]How to do things depending on how things go? If and else! Evaluates True / False - Can use any conditional statement

Today, we'll be introducing a new topic. The conditional statement of if and else. Picture this! It's a sunny Saturday morning, and it's time for breakfast. You have two things you usually do. 1. Make hot water and fill up your handy Maggi TomYam Cup OR 2. Go downstairs to the Dewan Makan and eat like everyone else.

However, we know that you'll choose those two options depending on what the situation is. If you woke up late, the Dewan Makan will already be full of other hungry students like you queuing up for food. Since you don't like to wait, in this case you'll just make your Maggi HotCup. But, if you woke up on time, the queues for breakfast would be far less shorter, so you could go to the Dewan Makan and have breakfast instead of a Maggi.

This is an example of a conditional statement. Easily put:
::

    If you woke up late
        Then Make Maggi
    Else Go eat @ Dewan Makan.

.. [X]Format of if-else (indent after colon, un-indent to signify end) - add some examples

Here's how we do it in Python!
::

    # If the condition to evaluate is True:
    if woke_up_late:
        # Run code indented after the above
        print("Eat Maggi Cup for breakfast")
    # if not true
    else:
        # Run code here instead!
        print("Breakfast at Dewan Makan")

.. note ::
    `else` is an optional keyword! `if` can work on its own. The following code is valid:
    ::
        if woke_up_late:
            print("Eat Maggi Cup for breakfast")

In-class exercise: multiple conditions for if-else
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. [X]Perform in-class exercise that leads to students realizing you can nest if-elses! Phrase a problem in word form and have them practice translating it into code. 

Now, the previous example is quite simple right? But, what if our thought process is more complicated than that? (Most often it is!). Let's extend from the previous example and assume that you have picky taste buds.

If you woke up late and it's a rainy day, you prefer to eat Maggi Tomyam so the spice warms you up. It you woke up late and the morning is sunny, you prefer to have Maggi Asam Laksa instead. If you woke up on time, you don't bother with Maggi and go straight to Dewan Makan. 

Let's take a few minutes to implement this as an if-else, we'll go over the solution in a bit. Start with the code given below:
::
    woke_up_late = True # or False
    weather = "rainy" # or "sunny"
    # YOUR CODE BELOW

elif
^^^^
.. [X]Have students do exercise that would be great with elif, using only if-else. After experiencing the hassle, then students will be able to appreciate elif! 

Now, let's say we want to write a programme to decide how to recycle waste material. Here are our few conditions. Let's try programming it to find out!

* Condition 1: If `item` == "glass", print "Put glass in brown bin"
* Condition 2: If `item` == "paper", print "Put paper in blue bin"
* Condition 3: If `item` == "aluminium", print "Put aluninium cans in orange bin"
* Condition 4: If `item` == "plastic", print "Put plastic in orange bin"
* Condition 5: If `item` == "food waste", print "Food waste is not for recycling!"

Let's take a few minutes to implement this, starting with the code given below:
::

    item = "food waste" # Can be substituted with other items as above
    # YOUR CODE BELOW

.. [ ]Show how above's repeated comparisons can be reduced by using elif (Hidden for live explanation, upload after class, basically explained upon the corresponding solution page)

.. As we can see from above, we need far less comparisons than before to achieve similar(not exactly same) results.

As we can see from above, we need far less comparisons than before to achieve similar(not exactly same) results.

Functions
---------
.. Instructor notes:
.. Estimated time: 20 mins
.. Section objective: Introduce students to the concepts of functions, and the value of abstraction
.. [-]Get students to do hands-on example, where the same code chunk needs to be repeated multiple times to do something slightly different every time. 
.. Notes: Saving some time here by directly going to the concept instead of doing the hands-on.

Now, we are going to do introduce functions, but as always, let's see how hard is it to do things without functions first so we can appreciate a little. Let's say we want to print out the names and favourite hobbies of a group of people:
::

    print("Abu likes to sing")
    print("Chan likes to read")
    print("Priya likes to hike")
    print("Romain likes to go rock climbing")
    print("Shaspreet likes to go cycling")
    print("R2D2 likes to make beeping sounds")

.. [ ]Solve the problem again but w/ functions. Demonstrate how simple it is to change things up on the fly through parameters. 

It looks like we are doing something similar for every line of code. In coding, we try to re-use code whenever possible. Surely there must be an easier way to repeat well-defined behaviour?

Enter functions.

Functions example
^^^^^^^^^^^^^^^^^

Function bundles your code to make it easier to run repeatable logic. Our previous example was a repetition of "`name` likes to `hobby`". We can define a function to do that. 
::

    def introduce(name, hobby):
        print(name + " likes to" + hobby)


.. note ::
    Pay attention to the syntax:
        * The `def` keyword tells Python that you are defining a function.
        * The function name is then written, followed by parentheses.
        * Parentheses contain the name of the arguments to pass to the function. In short, arguments represent information the function needs to perform what it's written to do.
        * Place a colon (`:`) after the parentheses ends, and write the function's code below with one indent.
        * `return` tells the function to finish running, and _return_ the variable right after it.
        * `return` is a keyword specific for functions only. If you don't specify a `return`, the function will automatically return None. 

Thus we can do the following:
::

    introduce("Abu", "sing")
    introduce("Chan", "read")
    introduce("Priya", "hike")
    introduce("Roman", "go rock climbing")
    introduce("Shaspreet", "go cycling")
    introduce("R2-D2", "make beeping sounds")

.. [ ] Format of functions (def keyword, indentation) - small example to show what does the return keyword do

Now let's say we want to get the full sentence and print them later. 
::

    sentence = introduce("Abu", "sing")
    print("The sentence stored is:")
    print(sentence)

Was the output what you expected? What happens if you check in the interpreter the value of `sentence`?

Functions and return
^^^^^^^^^^^^^^^^^^^^

The function above did something, but did not store the value. To be able to pass the output of the function around, we need to use the `return` keyword. Modify the function as follows:

::

    def introduce(name, hobby):
        return name + " likes to" + hobby


.. note ::
    * `return` tells the function to finish running, and _returns_ the variable right after it.
    * `return` is a keyword specific for functions only. If you don't specify a `return`, the function will automatically `return None`. 

Now the code will work:
::

    sentence = introduce("Abu", "sing")
    print("The sentence stored is:")
    print(sentence)

    # Outputs:
    # The sentence stored is:
    # Abu likes to sing

In-class exercise: functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. [-]Little in-class exercise on what to phrase as inputs to function, and what to return --> combined w/ below
.. [X]In-class exercise, phrase a problem in word form and have students build a function to solve it. 

Write a function called `what_int` that takes an integer as input. The function checks if the integer provided is negative, positive, or equal to zero, then prints the corresponding output. We want the function to be able to produce the following output:
::

    >>> what_int(1)
    1 is positive

    >>> what_int(-3)
    -3 is negative

    >>> what_int(0)
    0 is not positive or negative!

Let's take a few minutes to work on this. 


How functions simplify coding
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. [X]Expand the problem, and show that by breaking problems down into functions, things are much easier to handle! Perhaps this just show, not do. 

Now, let's say we want to expand the previous problem. Not only we want to check if the integer provided is positive, negative, or neither, if the number is positive, we also want to know if it is a prime number! 

Given this info, we get to work by writing a function to decide if a number is prime:
::

    def is_prime(x):
        if x < 2:
            print(x, " is not prime")
            break
        for i in range(2, x-1):
            if x % i == 0:
                print(x, " is not prime")
                break
        else:
            print(x, " is prime")

This allows us to be able to run a prime checked in a single line of code. Imagine if we need to copy-paste the logic above for every time we want to use a prime checker!
::
    is_prime(1)
    # Output: 1  is not prime

    is_prime(7)
    # Output: 7  is prime

    is_prime(29)
    # Output: 29  is prime

.. [X]Btw, would it be nice to introduce recursion in this topic since we are talking about functions? Or is that a little too advanced at this point? --> Thought of recursion actually! But yea might not have enough time to cover, so left it as an advanced exercise.

Exercise: Quadratic solver
--------------------------
.. Instructor notes: 
.. Estimated time: 20 mins
.. Section objective: Combine application of if-else and functions on a topic familiar for high schoolers
.. [X]Problem description

Implement a function that solves for the roots of quadratic equations, given the known values of the quadratic equation, `a`, `b` and `c`. As a reminder, the formula is:

.. math::

    x = \frac{-b\pm\sqrt{b^2-4ac}}{2a}

Python can deal with imaginary numbers, so you don't need branching logic to check if the determinant is larger than zero or smaller than zero. However, you will still require some logic to check if the determinant is equal to zero, because in that case there is only one root. 

.. [X]Instructor solution on solving quadratic eqn. Takes a, b, c and outputs roots. Gotta try because not sure how the system deals w/ imaginary roots! --> moved to 03_ifelse_fxns_sols.rst

Exercise: Fizz Buzz
-------------------
.. Instructor notes: Learned about this from https://wiki.c2.com/?FizzBuzzTest. Apparently it's an underdog stumbling block.
.. Estimated time: 20 mins
.. Section objective: Introduce students to a classic programming problem that requires good understanding of if/else to solve, and put into practice combining applications of if/else and functions in the same exercise.
.. [X]Fizz buzz problem statement

Loop to print the numbers from 1 to 100. If the number is a multiple of 3, print "Fizz" instead. If the number is a multiple of 5, print "Buzz". If the number is a multiple of both 3 and 5, print "FizzBuzz". 

.. [X]Fizz buzz instructor solution --> moved to 03_ifelse_fxns_sols.rst


Conclusion
----------
.. Instructor notes
.. Estimated time: <5 mins
.. Section objective: Recap and re-emphasize message
.. [X]Recap and re-emphasize message of the day

Take-away message for this week: If-else allows coders to write branching flow logic, and functions allow re-using code elegantly. 

Further reading
---------------
Python Crash Course: A Hands-on, Project-based Introduction to Programming. Eric Matthes. 
    * Chapter 5: If Statements
    * Chapter 8: Functions
