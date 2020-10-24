Week 7 : Numerical methods
==========================

Outcome: Students will be shown how code can be use to solve engineering problems via numerical methods. 

What we will do:
.. TODO: Fill in brief contents here when done


Setup check + Intro to numerical methods
----------------------------------------
.. Section objective: 
.. Estimated time: 10 mins
.. Instructor notes: This is more context setting than introduction. 

Setup check
^^^^^^^^^^^

If you can run the following code chunk without errors, you are good to go for today!
::

    import scipy
    import numpy as np
    import matplotlib.pyplot as plt
    plt.plot([1, 2, 3, 4], [1, 2, 3, 4])
    plt.show()

What are numerical methods?
^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. [X]Context setting here

Numerical methods are algorithms that approximate mathematical calculations, often for practical purposes. Do you recall how we calculated the values for the Lorenz equation last week, given the formulas for the rates of change? We would have had to jump through hoops to perform some non-trivial mathematical integration, but by utilizing numerical methods, we were able to solve it simply with code.

In short, numerical methods are techniques / algorithms that we can use to obtain approximate answers to mathematical questions. 

Why do we need numerical methods?
---------------------------------
.. Section objective: Explains the importance of numerical methods
.. Estimated time: 5 mins
.. Instructor notes: 

.. [X]Explain rationale
.. Some problems cannot be solved analytically, or will take forever
.. Analytical form means can solve the equation
.. Numerical methods allow us to approximate them

Mathematics has proved very useful in describing the world around us. Many phenomena and processes in the world can be described using mathematical equations! However, these equations are not always practical to solve due to complexity. Thus, instead of solving them and obtaining the mathematically correct answer (i.e. obtaining the analytical solution), we do the next best thing instead: arrive at an answer that is close enough. We use algorithms that require far less time to arrive at the approximated solution instead of performing rigorous mathematical evaluation. Oftenly the results are well enough within established tolerances, that we can trust and use them as if we have properly solved the equation. 

Thanks to the advent of computers and coding, numerical methods perform better and better in getting us close enough to the answer. So much so, that it plays foundational roles in the world around us. Let's take a look at a few example applications.

Applications of numerical methods
---------------------------------
.. Section objective: 
.. Estimated time: 15 mins
.. Instructor notes: 

.. [ ]List example applications here, explain story and impact

.. Taylor series expansion?
.. FFT for signal processing?
.. Modern machine learning
.. Anytime we deal with differentiation or integration --> fast solvers
.. On a large scale: weather prediction
.. Optimization
.. Basically anytime we want computer to do math quickly, there are some numerical methods involved. In fact, we have been using them in our past exercises! List the methods used in the past classes so they can be Googled. 

Exercise: Solving roots using Newton-Raphson's method
-----------------------------------------------------
.. Section objective: Simple exercise?
.. Estimated time: 20 mins
.. Instructor notes: 

.. Hook

In a previous exercise, we have asked you to implement the root solving formula for quadratic equations. There is a reason this was taught to you in the K12 syllabus, the concept strikes a balance between widely applied in STEM, and is simple enough to solve. If we want to solve more complex equations however, the mathematics becomes messy and complicated very quickly. 

We might not be familiar with solving roots for more complex polynomials, but computers can help us with that through numerical methods. We just need to give the proper instructions through code. In this exercise, we will be coding the Newton-Raphson's method for solving roots. 

.. TODO: Need to finish explanation and illustrations here, uncomment when complete
.. This method is built on the idea that a function can be approximated by a tangent line.
.. If able to calculate the fxn and its derivative at any point, able to take a first guess and iterate until the root is found. 


Below is the formula for the Newton-Raphson's method:

.. math::

    x_{n+1} = x_{n} - \frac{f(x_{n})}{f'(x_{n})}

:math:`f(x)` represents the polynomial, and the standalone :math:`x` stands for the estimated value for the root. The Newton-Raphson's method solves for one root at a time by iterating over this formula above. :math:`n` basically stands for number of iterations. When :math:`n = 0`, there is no :math:`x_{n=-1}` before that, and thus the iteration starts at :math:`x_{0}`, which needs to be provided as an initial guess. 


In short, what you need to do to solve a polynomial specified by :math:`f(x)`:
1. Specify its derivative, :math:`f'(x)`
2. Pick the initial estimate for one root, :math:`x_0`
3. Iterate using Newton-Raphsons' method until sufficient. Keep track of the relative error, i.e. the difference between the previous estimate and the current estimate. If the absolute value of the relative error falls below 1e-7, consider that the root has been found. 

Go ahead and find the roots of the fourth power polynomial :math:`f(x)=x^4-4x^3-2x^2+12x-3`. Run this four times to find all four roots, near points -2, 0, 2, 4.

.. Answer is (-3**0.5, 3**0.5, 2-3**0.5, 2+3**0.5)


Exercise: Solving optimization problems with `scipy`
----------------------------------------------------
.. Section objective: 
.. Estimated time: 25 mins
.. Instructor notes: 

In this exercise, we will see how we can use coding to make optimal decisions for selling ice cream. 

..TODO: Brief description of `scipy`
.. We will be making use of the `scipy` library 
.. library of more specific algorithms built on numpy
.. Today will be using the optimization part

.. TODO: Filling in basics of optimization
.. What is an optimization problem? 
.. What is objective function
.. How we solve optimization problems --> typically pass to robust solver
.. Many subdomains of optimization! Linear programming, integer programming etc, we just doing a very simple toy problem here

Part A
^^^^^^

You sell icecream by the road. Each cone of ice cream costs 50 cents to make. You have noticed that the higher the selling price of your ice cream, the less people will buy them in a day. You estimate that the number of customers per day as a function of price is :math:`f(x) = 2000-1000x`. Find the best selling price to maximize your profit in a day. 

Use `minimize_scalar` from `scipy.optimize` to solve this optimization problem. For that, we will require an objective function to optimize, such that we find the point where its value becomes as small as possible. 

.. note ::
    TODO Elaborate on minimize_scalar - optimization is phrased as minimization, and historical context is cost, thus algos seek to minimize instead of maximize. Easy to accomplish by switching signs. 

    Anyway there are a few functions in scipy to conduct minimization, but minimize_scalar is for the simple cases where we only want to minimize one number. 

    More solvers out there like Gurobi

.. Note for future: The way this content is structured seems a bit inconsistent. Prolly can think about refactoring in the future. 

1. Create a function `calc_profit` that takes the argument `price`. Calculate profit from ice cream sales following the steps below:
    a. Calculate number of customers at the given price
    b. Calculate the total cost: customers times cost of one ice cream cone
    c. Calculate the total revenue: customers times selling price
    d. Return profit, which is revenue - cost
2. Create another function called `obj_fun` which takes `price` as an argument. Return the negative of `calc_profit(price)`. This is to be passed to `minimize_scalar`. 
3. Import `minimize_scalar` from `scipy.optimize`, and run the following code:
::

    results = minimize_scalar(fun=obj_fun)
    print(results)

.. TODO Talk about expected results

Part B
^^^^^^
You have found a new location to sell ice cream that is closer to the city centre. 
* People are more willing to pay for expensive ice cream. The number of customers as a function of price is now :math:`f(x) = 4000-1000x`.
* However, you need to increase the cost of each ice cream cone to RM2.00 to match their tastes! 
* You need to pay RM20.00 in fuel per day to travel to and fro the new location. 

Given this information, is it worth it to start selling ice cream at the new location? Or will you make more profit by staying at your current location?


Conclusion
----------
.. Estimated time: 5 mins
.. Talk more about root solving and operations research examples being sth that is very applicable in the real world today!

Further reading
---------------
Chapra, Steven C, and Raymond P. Canale. Numerical Methods for Engineers. Boston: McGraw-Hill Higher Education, 2006. 
    * Chapter 6.2 The Newton-Raphson method
