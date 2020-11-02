Week 8 : Differential Equations & Modelling Populations
=======================================================

.. Outcome: Students will be briefly introduced to differential equations, and their applications in the world around us, especially in the life sciences. 

What we will do:
	* Setup check + Introduction to differential equations
	* Differential equations around us
	* Differential equations in life sciences
	* Exercise: SIR disease model I
	* Exercise: SIR disease model II
	* Exercise: SIR disease model III


Setup check + Introduction to differential equations
----------------------------------------------------
.. Section objective: Self-explanatory
.. Estimated time: 10 mins
.. Instructor notes: 

Setup check
^^^^^^^^^^^
.. [X]Setup check

If you can run the following code chunk without errors, you are good to go for today!
::

    import numpy as np
    import matplotlib.pyplot as plt
    plt.plot([1, 2, 3, 4], [1, 2, 3, 4])
    plt.show()

Introduction to differential equations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. [X]Introduction to PDEs
.. [X]What are PDEs? Definition

Before we go into differential equations today, we'll need to first go over the fundamental terms involved. 

Given a function :math:`y = f(x)`, we can take the derivative with respect to :math:`x` as :math:`\frac{dy}{dx}`. Finding the derivative is like finding the slope. With every movement in the variable, we see how the function changes. We call an equation that describes derivatives, a differential equation.

When the function contains multiple variables, we can measure the rate of change relative to multiple directions. We measure how the function changes with respect to each variable by holding all other variables constant. We use the partial derivative symbol instead of the typical :math:`\frac{d}{dx}` to reflect this. 

Example: Given :math:`f(x, y) = 3x^2 + 9xy + 9y^2`, the partial derivative with respect to :math:`x` and :math:`y` are as below:

.. math ::

	\frac{{\partial}f(x, y)}{{\partial}x} = 6x + 9y + 9y^2

	\frac{{\partial}f(x, y)}{{\partial}y} = 3x^2 + 9x + 18y

Thus, a partial differential equation is an equation made up of partial derivaative expressions. Conversely, if a differential equation does not contain any partial derivatives, we call it an ordinary differential equation. The distinction between both types are important in terms of how they can be solved, but we will leave it to you to go into that detail on your own. 

.. [X]Talk about PDEs being a large part of natural phenomena, represents anything with interdependencies
.. [X]Talk about how we solve them due to complexity: numerical integration (remember last week's class?)

Differential eqns reflect how quantities vary with respect to each other. Dynamic systems where interdependent processes exist are thus very suitable to be expressed as differential equations, especially natural phenomena. 

Unless we are working with differential equations in a purely mathematical context, they are used to model interdependent processes that cannot be expressed in only one equation. Typically, we end up working with a system of differential equations. Due to the complexity, almost no application of differential equations are solved by hand, instead they are given to computers to be solved efficiently, just like what we covered in last week's class. 

Differential equations around us
--------------------------------
.. Section objective: Talk about examples of dynamical systems that can be described as DEs. Go more into detail!
.. Estimated time: 15 mins
.. Instructor notes: 

Given that the complexities of dynamic systems, both natural and man-made, can be described  by differential equations:
	* Heat transfer via conduction is a phenomenon that depends on time and position. The rate of change of temperature of an object is proportional to how much warmer or cooler its surroundings are.
	* Fluid dynamics are described by multiple differential equations, relating pressure and flow under various circumstances.
	* Maxwell's equations in electromagnetism are four differential equations that describe how electric fields and magnetic fields relate to each other over time.
	* Reaction kinetics in chemistry are governed by differential equations, where the rate of reactions depend on the concentration of reactants present
	* The Black-Scholes equation is a differential equation in economics, that allows modelling market dynamics for options trading, which gave rise to derivatives trading. 

In the above, we've covered applications in engineering, physics, chemistry and economics. We've reserved applications in life sciences for its own section.

Differential equations in life sciences
---------------------------------------
.. Section objective: 
.. Estimated time: 15 mins
.. Instructor notes: 

Modelling populations
^^^^^^^^^^^^^^^^^^^^^

.. [X]Talk about population dynamics being a prime example of DEs applied in life sciences

The life sciences also contain dynamic systems where the rate of change is dependent on interacting quantities. The best example is population dynamics, where fundamental factors leading to population growth / decline are modelled and expressed as differential equations. 

One of the simplest models for population growth is the exponential growth model. A population that has a higher birth rate than death rate is projected to grow exponentially, where the rate of change is proportional to the existing population size. This is described by the equation below:

.. math ::
	\frac{dN}{dt} = rN

In reality, when populations reach a certain size, they will encounter resource limits, where the growth rate of the population will slow down. This limit is called the carrying capacity of the population's environment. To reflect this effect, the logistic growth model is developed instead, which introduces an extra term that slows down population growth when near the carrying capacity :math:`K`, as follows:

.. math ::
	\frac{dN}{dt} = rN - \frac{rN^{2}}{K}

Population modelling becomes a lot more interesting when we start looking at more than one population. For example, the population of a prey species and predator species can potentially lead to interesting interactions. Under certain conditions, prey-predator relationships can demonstrate cyclic behaviour. An increase in predator population will cause overhunting, leading to the population of prey to decrease. As food availability decreases, the predator population drops as well. Now that predation pressure is less, the prey population thrives and the numbers rise again. 


Modelling diseases
^^^^^^^^^^^^^^^^^^

.. [ ]Lecture on epidemiological modelling

The spread of infectious diseases in populations can be modelled using mathematical models, under the field of epidemiology. The concept is quite simple; each person in the modelled population will progress through various stages in the disease. These epidemiological models are also called compartmental models. 

The simplest model is the SIR model, where people progress from being susceptible (S), to being infected (I), to finally being removed (R). Thus, the population can be divided into various compartments, one for each of the classified stages. The transmission of individuals from compartment to compartment are described using differential equations that best reflect the transmission mechanism:
	* S to I: Susceptible persons are infected by coming into contacted with already infected persons. Thus transmission of S to I is proportional to the headcounts of S * I.
	* I to R: Infected persons are removed from the simulation over time at an average rate. Thus transmission of I to R is proportional to the headcount of I.

Translated into differential equations, the SIR model can be expressed as following:

.. math ::

	\frac{dS}{dt} = - {\beta}IS

	\frac{dI}{dt} = {\beta}IS - {\gamma}I

	\frac{dR}{dt} = {\gamma}I

Where S, I and R stand for the proportion of the population headcount in the respective compartments, and beta and gamma are constants that are specific to the modelled disease. In other words, :math:`S + I + R = 1`.

More complex terms are used when considering factors such as different distinct stages in the disease (e.g. incubation), population birth rates and death rates if the modelling timespan is on a multi-year scale, and also immigration and emigration if movement of persons are incorporated. 

Exercise: SIR disease model I
-----------------------------
.. Section objective: 
.. Estimated time: 20 mins
.. Instructor notes: 

In this exercise, we will implement the simple SIR model as described above. We will use Euler's method to integrate the differential equations over time, and plot the results. 

Euler's method is basically :math:`y_{n+1} = y_{n} + \frac{dy}{dx} * dt`.

1. First we will set up the timesteps. Set `dt` to 1, representing 1 day per timestep. Set `niter` to 60, representing model duration to be 60 days. Then, create the `timesteps` variable for visualization purposes later:
::

	timesteps = np.arange(0, niter, dt)

2. Initialize variables `N` as 1e6, `beta` as 1, and gamma as `0.3`.

3. Initialize vectors `S`, `I` and `R` respectively as numpy arrays with `shape=(niter, )`, using `np.zeros`. 

4. Assume that initially, 100 people are infected. Update the first values of S and I to reflect this initial condition. Remember that `S` and `I` are both proportions from 0 to 1!

5. Loop from 1 to `niter` to implement Euler's method. In each iteration:
	* Calculate the derivatives as specified above. Use values of `S`, `I` and `R` from the previous timestep. 
	* Assign values of `S`, `I` and `R` in the current timestep using the description of Euler's method above. 

6. Plot `S`, `I` and `R` against `timesteps` using `matplotlib`.

Experiment with different values of initially infected persons, `beta` and `gamma`. What happens when `beta` / `gamma` is larger than 1? Less than 1?

.. Explain deriving the reproduction number

Exercise: SIR disease model II
------------------------------
.. Section objective: 
.. Estimated time: 25 mins
.. Instructor notes: Extension of previous, incorporating intervention

We will use the parameters specified above as the base case, and introduce modifications to our model, to visualize the impact of model interventions.

1. Create a variable `intervention` and assign it 20. 

2. Change `beta` from a constant into an array with length `niter`. Initialize the whole array to have the same value as before, but modify such that after `intervention` steps, the rest of the array have only 0.5 times the value from before.

3. Modify the loop from before, to use the corresponding value of `beta` at every loop iteration, now that `beta` is an array. 

4. Modify the value of `intervention` to 10, 15, and 25. What do you see?

5. Modify the multiplier of `beta` from 0.5, to 0.1 and 0.8. Vary the value of `intervention` like before. What do you see?

.. Explain how intervention is modelled, and also how it is dependent on time as well as intervention effectiveness.

Exercise: SIR disease model III
-------------------------------
.. Section objective: 
.. Estimated time: 10 mins
.. Instructor notes: 

Revert to the code used in SIR disease model I, i.e. remove the code introducing interventions. We assume that the disease being modelled has mutated, and now a certain percentage of individuals who have recovered from the disease will become susceptible to the disease again. 

1. Introduce a variable `recurrence`, which represents avg number of individuals that return to the susceptible compartment, for every person in the removed compartment. Use 0.2 as the value. 

2. Implement extra terms in the code to model this new transmission dynamic.

3. Run your code, using different values for `recurrence`. What do you see?

.. Explain that this introduces equilibrium condition


Conclusion
----------
.. Section objective: 
.. Estimated time: 5 mins
.. Instructor notes: 
.. Message of the day: xxxxxxxxxxxxxxxx

Today we learnt about differential equations, as well as built a simple epidemiological model for modelling diseases.

Further reading
---------------
Munz, Philip & Hudea, Ioan & Imad, Joe & Smith, Robert. (2009). When zombies attack!: mathematical modelling of an outbreak of zombie infection. https://loe.org/images/content/091023/Zombie%20Publication.pdf