Week 7 : Numerical methods
==========================

Outcome: Students will be shown how code can be used to solve engineering problems via numerical methods.

What we will do:
    * Setup check + Intro to numerical methods
    * Why do we need numerical methods?
    * Applications of numerical methods
    * Exercise: Solving roots using Newton-Raphson's method
    * Exercise: Solving optimization problems with `scipy`


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

Numerical methods have numerous applications in our highly integrated society! For example, it helps solve specific scientific and engineering problems such as prediction of oil production, fluid dynamics, multidimensional root finding, weather prediction, and so much more!

For example in one 1989 paper by N Z Sun entitled, "Applications of numerical methods to simulate the movement of contaminants in groundwater", the author used numerical methods to simulate movement of contaminants through the subsurface which helped the author in producing a high quality solution without needing to know the complete picture or to take account of every single variable.

These specific problems if solved analytically, i.e. by solving them as equations directly, will take far too much time for their scope of complexity.

.. Taylor series expansion?
.. FFT for signal processing?
.. Modern machine learning
.. Anytime we deal with differentiation or integration --> fast solvers
.. On a large scale: weather prediction

Numerical methods are also employed on a very large scale for modelling weather in meteorology. Numerical methods are heavily featured, especially since many variables need to be introduced (velocity, pressure, temperature, time, position, carbon dioxide, humidity and so on). Many difficult differential equations are needed to solve this to make a mathematical weather model. In recent times however, a plethora of numerical analysis methods are used in atmospheric modeling such as fluid mechanics and numerical solution of differential equations. Localized data is implemented in certain models that are run by parallel supercomputers to aid in this process.

.. Optimization

Optimization is also a type of numerical method that particularly helps in allocating resources most efficiently. Businesses use optimization methods for investment strategies, inventory control among others.

.. Basically anytime we want computers to do math quickly, there are some numerical methods involved. In fact, we have been using them in our past exercises! List the methods used in the past classes so they can be Googled.

Numerical methods help a lot whenever we want to calculate something quickly and can accept a tolerable amount of error. Most popular programming languages use numerical methods to achieve certain calculations and models. In fact, Python's libraries such as `numpy` and matplotlib uses them too! In a bit, we will be learning a new library called `scipy` that also uses numerical methods.


Exercise: Solving roots using Newton-Raphson's method
-----------------------------------------------------
.. Section objective: Simple exercise?
.. Estimated time: 20 mins
.. Instructor notes:

.. Hook

In a previous exercise, we have asked you to implement the root solving formula for quadratic equations. There is a reason this was taught to you in the K12 syllabus, the concept strikes a balance between widely applied in STEM, and is simple enough to solve. If we want to solve more complex equations however, the mathematics becomes messy and complicated very quickly.

We might not be familiar with solving roots for more complex polynomials, but computers can help us with that through numerical methods. We just need to give the proper instructions through code. In this exercise, we will be coding the Newton-Raphson's method for solving roots.

Embedding a figure from Wikimedia Commons below to illustrate the intuition behind this method:

.. figure:: https://upload.wikimedia.org/wikipedia/commons/e/e0/NewtonIteration_Ani.gif
   :alt: Illustration of how Newton Raphson's work

This method is built on the idea that a function can be approximated by a tangent line, i.e. a straight line that has the same slope with the function at a single point. Newton-Raphson's method uses the tangent line of the function at a point to gradually get closer to the root until it eventually does.

Below is the formula for the Newton-Raphson's method:

.. math::

    x_{n+1} = x_{n} - \frac{f(x_{n})}{f'(x_{n})}

:math:`f(x)` represents the polynomial, and the standalone :math:`x` stands for the estimated value for the root. The Newton-Raphson's method solves for one root at a time by iterating over this formula above. :math:`n` basically stands for number of iterations. When :math:`n = 0`, there is no :math:`x_{n=-1}` before that, and thus the iteration starts at :math:`x_{0}`, which needs to be provided as an initial guess.

.. note::
    The formula is derived from :math:`0 = f'(x_n)*(x_{n+1} - x_n) + f(x_n)` ;)

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

.. Brief description of `scipy`
.. We will be making use of the `scipy` library
.. library of more specific algorithms built on numpy
.. Today will be using the optimization part

We will be using the `scipy` library, where `sci` stands for "scientific" and `py` stands for Python. Scipy extends upon `numpy` to provide further functionalities. It contains modules for optimization, integration, image and signal processing, interpolation and a few other modules that are common in the scientific and engineering field. In today's exercise, we will be using a function from `scipy.optimize`.

Today's problem is phrased as an optimization problem. Optimization is defined as "the action of making the best or most effective use of a situation or resource."(Oxford Languages). Via optimization, we aim to achieve the best design of a given thing given certain criteria or constraints while maximizing certain factors.

.. What is an optimization problem?

An optimization problem on the other hand is the problem of finding the best solution from a set of all possible solutions. Realistically, maybe our human mind can come up with something that may seem to be the best solution, however for computers and in mathematics, obtaining the BEST solution is often not an easy task. There are two types of optimization problems. One is discrete optimization problems and another is continuous optimization problems. Continuous optimization problems tend to be easier to solve as the smoothness of the functions (continuous variables) means we can deduce information easier. On the contrary, discrete optimization problems are tougher to deduce but this is where numerical methods come in to save the day!

.. What is objective function

In optimization problems, in figuring out what is the best solution, we typically look into maximizing our objective function. Our objective function being our goal, is what the optimization has to consider when generating a solution. Most times, there is only one objective function i.e. reducing cost of electricity in office, building a stronger roof for a house, but sometimes there are cases where optimization problems have 0 or even more than 1 objective functions. For example, let's say you have a problem in getting the most fuel efficiency while driving, but at the same time you want to drive fast. Another example would be to build a car that's lighter but make it more structurally solid. These two conflicting objectives should be be kept in view when developing an optimization.

.. How we solve optimization problems --> typically pass to robust solver

There are numerous different ways to solve optimization problems. In Python, we simply pass all the hard work to libraries such as SciPy or Google's OR-Tools. In solving an optimization problem, it is important to set up the required variables, constraints, and objective functions to pass into a solver. Without any of these, you might not get an accurate result or your error margin might be too high.

.. Many subdomains of optimization! Linear programming, integer programming etc, we just doing a very simple toy problem here

Optimization is heavily featured in its own field called Operations Research. Multiple techniques exist, such as linear programming, integer programming, etc. Today we will be trying our hand at solving a small classroom-sized optimization problem.

Part A
^^^^^^

You sell icecream by the road. Each cone of ice cream costs 50 cents to make. You have noticed that the higher the selling price of your ice cream, the less people will buy them in a day. You estimate that the number of customers per day as a function of price is :math:`f(x) = 2000-1000x`. Find the best selling price to maximize your profit in a day.

Use `minimize_scalar` from `scipy.optimize` to solve this optimization problem. For that, we will require an objective function to optimize, such that we find the point where its value becomes as small as possible.

.. note ::
   Like its name, `minimize_scalar` focuses on making the objective function as small as possible. Historically, optimization is performed on functions that represent cost, and thus solvers tend to work to minimize instead of maximize. In this case, we flip the sign to get the minimizer to become a maximizer! 

    `minimize_scalar` is for the simple cases where we only want to minimize one number. For more complex use cases, there are other implementations in `scipy` or other libraries for that. 


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

Take some time to understand the printed output. What is the optimal price, and what is the resultant profit?

Part B
^^^^^^
You have found a new location to sell ice cream that is closer to the city centre.
* People are more willing to pay for expensive ice cream. The number of customers as a function of price is now :math:`f(x) = 4000-1000x`.
* However, you need to increase the cost of each ice cream cone to RM2.00 to match their tastes!
* You need to pay RM20.00 in fuel per day to travel to and from the new location.

Given this information, is it worth it to start selling ice cream at the new location? Or will you make more profit by staying at your current location?


Conclusion
----------
.. Estimated time: 4 mins
.. Talk more about root solving and operations research examples being sth that is very applicable in the real world today!

* Numerical methods are heavily used in many aspects of civilization
* Through today's exercise, we looked into solving a simple optimization problem with Python

Further reading
---------------
Chapra, Steven C, and Raymond P. Canale. Numerical Methods for Engineers. Boston: McGraw-Hill Higher Education, 2006.
    * Chapter 6.2 The Newton-Raphson method
`Numerical Analysis <https://www.britannica.com/science/numerical-analysis>`_
`Types of Optimization Problems <https://neos-guide.org/optimization-tree#:~:text=Continuous%20optimization%20problems%20tend%20to,in%20a%20neighborhood%20of%20x.>`_
