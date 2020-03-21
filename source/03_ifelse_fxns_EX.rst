.. Instructor notes
.. Exercises that synergize w/ existing exercises in the class will be great! I see implementing a lotta if/elses and using pycosat for problems that can be SAT solvers to be a great example of difficult progression. 

Week 3: Advanced Exercises
==========================
Advanced exercises are designed for advanced learners that are ready to take on extra challenges. These exercises are made accessible to all after the class. Note that these exercises typically require more knowledge than what was presented in class.  

Adv Exercise: Finding Fibonacci numbers by recursion
----------------------------------------------------
.. [X] Explain Fibonacci numbers
.. [X] Explain the concept of recursive functions, getting a function to call itself
.. [X] Problem statement: Find Fibonacci numbers up to N, using recursion

Fibonacci
^^^^^^^^^

A number in a Fibonacci sequence is defined by the sum of the previous two numbers before it. The sequence starts with initial terms F(1)=1, and F(2)=1. See example below:
::
    # F(n-2) + F(n-1) = F(n)
    # F(1) + F(2) = F(3)
    # F(2) + F(3) = F(4)
    # F(3) + F(4) = F(5)
    # F(4) + F(5) = F(6)
    
    1 + 1 = 2
    1 + 2 = 3
    2 + 3 = 5
    3 + 5 = 8

For a more detailed definition of Fibonacci numbers, refer to its Wikipedia page: `https://en.wikipedia.org/wiki/Fibonacci_number <https://en.wikipedia.org/wiki/Fibonacci_number>`_

Recursion
^^^^^^^^^
In simple terms, a *recursive* function is a function that can call itself. Writing recursive functions require a bit more thought than usual, as your function needs to be able to handle its own output as input! 

Read this for more info and exapmles on writing recursive functions: `https://www.educba.com/recursive-function-in-python/ <https://www.educba.com/recursive-function-in-python/>`_

If the concept of recursion itself intrigues you, take a look at this Wikipedia page: `https://en.wikipedia.org/wiki/Recursion_(computer_science) <https://en.wikipedia.org/wiki/Recursion_(computer_science)>`_

Fibonacci and recursion
^^^^^^^^^^^^^^^^^^^^^^^
Note that finding the Nth Fibonacci number requires finding the (N-1)th and (N-2)th number. And to find these numbers, you would need to find the previous numbers that lead to them, eventually tracing your way up to the first two ones in the sequence. If you've did your reading on recursion above, you should notice that finding the next Fibonacci number is quite a recursive process. 

Do the following:
    i. Write a recursive function to find the Nth Fibonacci number. 
    ii. Write a recursive function to find all Fibonacci numbers up to N. 

Hints:
    1. Task i is solvable in <5 lines of code!
    2. Task ii is trickier than it seems! Once recursion gets from N to the first two Fibonacci numbers, you need to collect and pass the found Fibonacci numbers all the way back to calculations of the Nth number!
    3. General guidelines the instructors personally found useful in writing recursive functions:
        a. Write a function that carries out the recursion without considering the base condition, i.e. when the recursion stops.
        b. Write another function that only considers the base condition. 
        c. Merge both functions into one. 

Adv Exercise : Solving sudoku with pycosat
------------------------------------------
.. warning :: Training wheels off! The material in today's class is not enough to solve this problem. 

.. [ ] Explain what sudoku is, and explain the procedure of solving it with logic
.. [ ] Solving sudoku w/ code is doable, link to Computerphile video on how they did it
.. [ ] In this case, use other approach - phrase as satisfiability problem
.. [ ] Explain satisfiability problems, and SAT solvers
.. [ ] Explain the formal CNF grammar used to phrase them
.. [ ] Problem statement (i): first on phrasing sudoku as CNF
.. [ ] (ii) Then calling the pycosat solver itself. Strongly inspired by pycosat's sudoku solver example. 

Sudoku is 

For more details on Sudoku, please Google it yourself. 





.. Already too much content? Just stay focused instead? 
.. Adv Exercise: Morse code writer
.. -------------------------------



