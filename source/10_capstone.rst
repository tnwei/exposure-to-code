Week 10 : Problem solving mini-capstone
=======================================

Outcome: Students will leverage upon the skills and knowledge picked up in this course to accomplish a mini-capstone project, focused on the process of solving problems with code. 

Intro
-----
Welcome to the end of this course! In many STEM degree programmes, students are required to do a capstone project in their last semester where they apply the concepts they've learnt. The terminology "capstone" refers to the the last block you put on a building in ancient times, symbolizing the final piece of the learning experience. 

This week, we will be doing something similar, except instead of having ten weeks to do a capstone, we will be do a mini-capstone. Choose one of the topics below to work on; we will have a brief show-and-tell at the end of the class. You are more than welcome to work on this material in advance of the class itself.
	* Mini-capstone 1: n-body simulation (physics)
	* Mini-capstone 2: 1D fluid simulation (cellular automata)
	* Mini-capstone 3: Ecosphere equilibrium (biology + optimization)

Mini-capstone 1: n-body simulation (physics)
--------------------------------------------
Newton's law of gravitation tells us that planets exerts gravitational force on each other, proportional to their mass, and inversely proportional to the square of distance between them. 

.. math::

    F = G\frac{m_{1}m_{2}}{r^2}

where:
	* m1, m2 is the mass of planet 1 and planet 2
	* r is the distance between planet 1 and planet 2
	* G is the gravitational constant, 6.674e-11
	* F is the force between the planets.

The acceleration that is felt by planet 1 from planet 2 is thus :math:`F/m_{1}`, as math:`F = ma`.

It is not difficult to describe a system with two planetary bodies, but systems with three bodies and above exhibit chaotic behaviour and are always solved by computers. We know this as the n-body problem. Note that acceleration (a), velocity (v) and position (r) are related by the following differential equations:

.. math::

    a = \frac{dv}{dt}
	
	v = \frac{dr}{dt}


Write a simple n-body simulation to calculate the trajectories of the following toy system:
	* Planet A
		* Mass: 10
		* Initial position (x, y): (0, 3)
		* Initial velocity (x, y): (0.5, 0)
		* Initial acceleration (x, y): (0, 0)
	* Planet B
		* Mass: 5
		* Initial position (x, y): (0, -3)
		* Initial velocity (x, y): (-0.5, 0)
		* Initial acceleration (x, y): (0, 0)
	* G = 1
	* dt = 0.01
	* timesteps = 3000

You might find the steps below to be useful:
	1. Set up the simulation. Initial conditions, number of timesteps, timestep size.
	2. Write the function to calculate the force from Newton's law of gravitation, taking as input masses and positions of two planets, returning acceleration. Note that positions and acceleration should be vectors, to represent both (x, y) components.
	3. Setup a for-loop to run the simulation using Euler's method for numerical integration. First find the new acceleration, then update velocity, then update position. 
	4. Write code to visualize the results of the simulation. Template visualization code will be provided for modifications.


Mini-capstone 2: 1D fluid simulation (cellular automata)
--------------------------------------------------------
It is possible to model a tank of fluid by dividing the width of the tank into multiple fluid columns. By describing how fluid columns pass excess fluid to their neighbors, we can build a somewhat realistic 1D fluid simulation. 

We know that the following forces are in play:
	* Gravity: If a column is taller than its neighbor, gravity will cause the fluid to move from the higher column to the lower column.
	* Momentum: A wave moving across the columns will continue to move across the tank from its momentum, which dissipates slowly over time. 

Notice that both forces interact (i.e. can be summed), and can either amplify fluid movement or cancel each other out depending on the circumstances. We term the net force as fluid pressure.

At each timestep, each column is compared against its left neighbor. If the aforementioned column exerts more fluid pressure on its left neighbor, fluid will flow to the left neighbor in the next timestep, proportional to the difference in fluid pressure. This step is then repeated for the right neighbor. Amount of fluid flow between columns are recorded to represent momentum in the next timestep. 


Write a 1D fluid simulator that will allow us to model the movement of fluid in a tank with the following fluid columns:
::

	water = numpy.array([100, 100, 100, 80, 70, 60, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20])

You might find the following steps to be useful:

1. Setup the simulation. Notice that for each column, you need to store: column height (`water`), momentum from left, and momentum from right.
2. Write the core loop to calculate flow for any column with its left and right neighbors.
	* Difference in fluid pressure due to gravity can be written as the difference between column height multiplied by a gravitational modifier. 
	* Difference in fluid pressure due to momentum can be written as the difference between momentum from left, and momentum from right.
	* Notice that the left-most and right-most columns need to be handled separately as they do not have both neighbors.
	* At every iteration, the variables that should be updated for the next timestep are column height, momentum from left, and momentum from right.
3. Write code to visualize the results of the simulation. Template visualization code will be provided for modifications.

Mini-capstone 3: Ecosphere equilibrium (biology + optimization)
---------------------------------------------------------------
You are the science advisor for a billionaire who has set up a research lab to revive dinosaurs. You have just presented a population simulation where you plan to introduce a large number of herbivores mixed with a small population of carnivores, to have a healthy prey-predator equilibrium. However, the billionaire is only interested in seeing carnivorous dinosaurs, and wants you to replace all the herbivores with carnivores!

After convincing your sponsor that you cannot have a healthy ecosystem without a lot of herbivores to serve as food for the carnivores, the billionaire agreed to not remove the herbivores. As you further explained that the number of dinosaurs will change over time, the billionaire decided that he wants to see the number of carnivores to be as stable as possible. It is thus left up to you to find the optimal initial conditions of the simulation, so you can allocate the right proportion of eggs in the incubation farm to herbivores or carnivores.

The prey-predator simulation obeys the following equations:

.. math::

    \frac{dx}{dt} = ax - bxy

	\frac{dy}{dt} = cxy - dy

where:
	* :math:`x` and :math:`y` represent the populations of herbivores and carnivores,
	* :math:`a` and :math:`b` are growth and death rate constants for herbivores, 
	* :math:`c` and :math:`d` are growth and death rate constants for carnivores.

Your initial simulation uses :math:`a=1.2`, :math:`b=0.4`, :math:`c=0.2`, and :math:`d=0.1`. You used Euler's integration scheme, running on timestep size :math:`dt=1e-3`, for :math:`niter=100000` times. Without knowing the incubation capacity, you only initialized the simulation with 10 herbivores and 10 carnivores. 

You plan to use code to explore how to best allocate the eggs. You thought about using `scipy` optimize to find the best way to allocate the eggs, but alas! You believe the chaotic behaviour of this coupled system of differential equations will cause `scipy.optimize.minimize_scalar` to return inconclusive results (of which you are correct). Instead, you decided that any method would work, be it visual methods (comparison by graph), or by exhaustive testing.

.. note ::
	Trying all possible combinations is known algorithmically as the brute-force method.


You might find the following instructions useful:

1. Implement the prey-predator relationship described above. You might find it useful to refer to the exercise solutions for Week 8.
2. Once implemented, wrap your code in a function. The function outputs a timesteps array, an array for herbivore count, and an array for carnivore count. Set up the input of the function to modify the initial condition of the simulation. 
3. Find out which configuration would let the billionaire see the most stable number of carnivores possible.

Where to from here?
-------------------
.. Instructor notes: Need to go through each site! Make sure that each one is shown off within one minute. 
.. Estimated time: 10 mins
.. Section objective: Summarize last week's contents + setup check

The best way to improve with coding is to work on your own project consistently. 

The second best way to improve is to learn from the resources out there on the internet. Regardless what you want to do with coding / how much time you want to spend on coding, good coders are those that spend time improving on their own. 

* Improving at algorithms:
	* `Leetcode, algorithmic coding challenges <https://leetcode.com/>`_
	* `Hackerrank, algorithmic coding challenges <https://www.hackerrank.com/>`_
* Learning bioinformatics:
	* `Rosalind, learn bioinformatics online through coding challenges <http://rosalind.info/problems/locations/>`_
* Learn machine learning:
	* `Andrew Ng's Machine Learning course on Coursera, no need to pay for the cert, just audit the course <https://www.coursera.org/learn/machine-learning>`_

If this is your thing, build your way up to tackle coding challenges:	
	* Google Kick Start: Online algorithmic coding competition