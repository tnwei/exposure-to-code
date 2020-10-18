Week 5 : `Numpy` vectors & cellular automata
============================================

.. Instructor notes
.. Message: Numerical computing in Python can be handled through the `numpy` package. Cellular automata as an interesting example of emergent complexity arising from simple rules. 

Outcome: Students will learn the basics of using `numpy`, Python's numerical computing library for array calculations. Students will also be introduced to the concept of cellular automata, one of the many interesting concepts in computer science.

What we will do:
	* Introduction to `numpy` + setup check
	* Basic `numpy` operations
	* Cellular automata
	* Exercise: Conway’s Game of Life, in one dimension

Introduction to numpy + setup check
-----------------------------------
.. Instructor notes: 
.. Estimated time: 10 mins
.. Section objective: Introduce students to numpy. 

.. [X]What is numpy and what do people use it for: scientific computing

From our past few modules, we know that we can use Python to implement mathematical calculations. However, if we are serious about crunching numbers, we will need to use `numpy`.

`numpy` is another very commonly used library in Python. In its name, "num" represents "numerical" while "py" represents Python. `numpy` enables efficient numerical array operations and linear algebra, which are key features needed in most, if not all serious scientific computing efforts. The scientific computing ecosystem in Python is basically built on `numpy`. Remember `matplotlib` and `pandas`, the libraries we've used last week? They both heavily depend on `numpy`.

For this week's class, you will need to be using a local Python installation, just like last week. In fact, you will need it for the rest of this course! Given that we will need to import libraries every week, online REPLs will not be able to support our work any further. 

If you can run the following code chunk without errors, you are good to go for today!
::

	import numpy as np


Basic `numpy` operations
------------------------
.. Instructor notes: 
.. Estimated time: 35 mins
.. Section objective: Introduce students to basic 1D array operations in numpy. 

First things first, what are arrays?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Arrays, in the mathematical sense, are numbers on a grid, that can have a number of dimensions. (You can say that these numbers are **arrayed** in a grid.) The definition of arrays in computer science builds upon this definition: an array is not only a concept, but a data structure that contains a collection of values, and each value can be accessed via array indices. 

Python does not have a built-in data type for arrays, the closest data type we have is a list. A list on its own is technically a one-dimension array. 

.. note ::
	You should be familiar with vectors and matrices at this point. A vector is basically an array with one dimension, while a matrix is an array with two dimensions. Just so you know, the formal term for array dimensions is "rank", e.g. a vector is an array of rank 1.

With some creative application, it is possible to construct arrays out of lists. The following is an example of a 2D array, with size 2x2. 
::

	# 2x2 array using lists!
	arr = [
		[1, 1], 
		[1, 1]
	]

However, we are still better off using the proper implementation provided by `numpy`, due to the high performance and convenience that comes with it. Notice that the example above becomes messy just from increasing the number of dimensions to four alone, as shown below. 
::

	# 2x2x2x2 array using lists ... ?
	arr = [[[[1, 1], 
	         [1, 1]],

	        [[1, 1], 
		[1, 1]]],
			
		[[[1, 1],
		[1, 1]], 
					 
		[[1, 1],
		[1, 1]]]]


Initializing arrays
^^^^^^^^^^^^^^^^^^^
.. [X]Importing numpy as np

Let's get started with `numpy`. Make sure to import it at the beginning of your code:
::

	import numpy as np

.. [X]Initializing arrays with np.array(), np.zeros(), or np.ones()

There are many methods to initialize arrays, but we will focus on the following:
	* `np.zeros()` and `np.ones()`: both return a `numpy` array with the given shape. The former pre-fills the array with all zeros, and the latter pre-fills the array with all ones. 
	* `np.array()`: takes any array-like data structure and return a `numpy` array

`np.zeros()` and `np.ones()` are useful for creating arrays from scratch. Try them out below:
::

	zeros = np.zeros(shape=(3, 2))
	ones = np.ones(shape=(10,))
	print("The shape of zeros is:", zeros.shape)
	print(zeros)
	print("The shape of ones is:", ones.shape)
	print(ones)

Pay attention to the order of numbers fed to the `shape` keyword, the number of dimensions each array has, and the number of values each array has per dimension.

.. note ::
	`numpy` arrays have the `shape` property. If `arr` is an array, `arr.shape` returns one number for each dimension the array has. Each number is the length of the array in that direction.

.. note ::
	Notice the numbers being wrapped in parenthesis "()" before being passed to `shape`? This is a tuple. A tuple is like a list, except a list is immutable, i.e. cannot be modified after creation. You can append elements to a list, but you will need to re-create a tuple to modify its contents. 

	It is convention to use tuples to specify array shapes, although there is no problem if you want to use lists.

Next, go ahead and create the array we will need for the next section. 
::

	arr_a = np.array([57, 82, 147, 71, 111, 115, 101, 89, 260, 287])
	
We will stick with 1D arrays for the rest of the class, next week is when we will dive deeper into 2D arrays. 

Array indexing
^^^^^^^^^^^^^^
.. [X]Access individual numbers in an array via array indexing
.. [X]Assign individual numbers in an array via array indexing
.. [X]Colon operator for accessing multiple numbers, just like lists! Also works forward and backwards

We can access the individual values in arrays via indexing. As a quick refresher, indices in Python start at 0. For 1D arrays, array indexing is similar to list indexing. 

Go ahead and do the following: 
	1. Print the 1st number in `arr_a`.
	2. Print the 3rd number from the end in `arr_a`.
	3. Replace the 7th number in `arr_a` with 0.
	4. Replace the 9th number from the end in `arr_a` with 100.
	5. Print the 5th to 7th numbers in `arr_a`. Notice that the selection output is also an array.
	6. Replace the last 3 numbers in `arr_a` with 100. For this, we'll show you the code to do it:
	::
		arr_a[-3:] = 100

.. Solution
.. print(arr_a[0])
.. print(arr_a[-3])
.. arr_a[6] = 0
.. arr_a[-9] = 100
.. print(arr_a[4:7])
.. arr_a[-3:] = 100


Array operations
^^^^^^^^^^^^^^^^
.. [X]Array arithmetic with constants

The code provided for Q6 in the Array Indexing section above might have got some of you thinking. We were replacing three numbers, but we only had to specify it once! Under the hood, `numpy` does `array` broadcasting to "broadcast" the addition of a constant to all of the elements involved. If we used a Python list, we would have gotten an error instead. 

Array broadcasting means that we can perform arithmetic between arrays and numbers fairly easily:
::

	print("Addition between array and number:")
	print(arr_a + 10)
	print("Multiplication between array and number:")
	print(arr_a * 10)
	print("Even the modulo operation works!")
	print(arr_a % 10)

.. [X]sum(), mean(), max(), min(), argmax()

`numpy` arrays also come with some built-in functions that simplifies numerical work. 

The following code shows, in order:
	1. Finding the sum of an array
	2. Finding the mean of an array
	3. Finding the max and min of an array
	4. Finding the location (i.e. index) of the max and min value of an array

::

	print(arr_a.sum())
	print(arr_a.mean())
	print(arr_a.max(), arr_a.min())
	print(arr_a.argmax(), arr_a.argmin())

Array conditionals
^^^^^^^^^^^^^^^^^^
.. [X]Indexing with conditionals

Run the following and observe the outcome:
::

	print(arr_a > 100)

This code displays an array of the same shape as `arr_a`, but instead of numbers as values, they are Booleans. This is array broadcasting in action once again, where the comparison with 100 is checked for every value in the array. For each statement where the value is greater than 100, `numpy` records True in the array returned. 

This is surprisingly useful for us, because array indexing also allows us to do this:
::

	print(arr_a[arr_a > 100])

Earlier we have looked at array indexing using numbers. The code chunk above shows that we can also use conditionals to do the same! Every element where the conditional evaluates to True will be kept, while every element where the conditional evalutes to False will be discarded. Effectively, we have told Python to return us `arr_a`, but excluding values where the conditional is False, i.e. are not larger than 100. 

What would the following code return? Did they return results as expected?
::

	print(arr_a[True])
	print(arr_a[False])
	print(arr_a[arr_a < 0])

Exercise: Thinking in array indices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Before we end our section on `numpy` arrays, following are a few exercises to get you attuned to thinking in array indices:
	1. Write a function that moves all of the elements in an array one step to the right. Example: an array of `X = np.array([1, 2, 3, 4])` should become `array([4, 1, 2, 3])`. Notice that the rightmost element is rolled back to the beginning. In other words, the element at index -1 is moved to index 0. Use the following code as the starting point, and get your function to replicate the example output below:
	::

		import numpy as np

		def roll_array(arr):
			# YOUR CODE HERE

		# If your example replicates this output, it is good to go
		a = np.array([2, 3, 4, 1])
		roll_array(a)
		# Should get output: `array([1, 2, 3, 4]) 

	2. Write a function that adds one to each element with even-numbered indices, and subtracts one from each element with odd-numbered indices. 
	::

		import numpy as np

		def odd_even(arr):
			# YOUR CODE HERE

		# If your example replicates this output, it is good to go
		b = 5 * np.ones(shape=(6, )) # Initialize an array with all 5's
		c = odd_even(b) # Should get output: `array([6, 4, 6, 4, 6, 4])
		d = odd_even(c) # Should get output: `array([7, 3, 7, 3, 7, 3])
		

Cellular automata
-----------------
.. Instructor notes: Go through flocking first, then segue to cellular automata as a close (but not quite) corollary of grid-bound flocking
.. Estimated time: 20 mins
.. Section objective: Show the concept of cellular automata. 

Given that we have been learning about arrays in this module, we'll take a look into cellular automata, an interesting concept that is fundamentally about cells in a grid. But before that, we will first set the stage by looking at flocking algorithms. 

Flocking algorithms
^^^^^^^^^^^^^^^^^^^

In the animal kingdom, some animals have evolved to move around in groups for survival reasons. Cows roam around in herds, fish swim in shoals, and birds move in flocks. Animals do this primarily for survival reasons; animals in a group are less likely to be picked off individually by predators, plus a group of animals can search a bigger area for food. 

.. Start with showing flocking algorithms

It is probably no surprise to you, that this natural phenomenon can be replicated in code. Over the years, smart people have managed to model animals moving as a collective while exhibiting organic behaviour. They accomplished this by specifying rules for autonomous agents, i.e. modelled animal, to follow. Although no explicit rules or directions were involved in the programming, these agents are able to emulate the behaviour of animals in real life. We call these flocking algorithms. 

Let us take a look at the earliest form of flocking algorithms, dating back to 1986: `https://www.youtube.com/watch?v=86iQiV3-3IA <https://www.youtube.com/watch?v=86iQiV3-3IA>`_.

This video above demonstrates the artificial life algorithm by Craig Reynolds, called Boids. Each agent in the algorithm follows three very simple rules:
    * separation: steer to maintain distance with other agents
    * alignment: steer to move in roughly the same direction as other agents
    * cohesion: steer to stay close enough to other agents

Now let's watch this Youtube video that further showcases how flocking algorithms work, and explain them in more detail as well: `https://www.youtube.com/watch?v=QbUPfMXXQIY <https://www.youtube.com/watch?v=QbUPfMXXQIY>`_

Notice that the rules only require the agent to look at what other agents are doing, especially its neighbors closest to it. These flocking algorithms are designed to function in a coordinate system, where the position of the agents can be any real number. 

What if constrain the agents to exist in a grid instead of a real-numbered space? 
	
Basically, we get cellular automata. 

Intro to cellular automata
^^^^^^^^^^^^^^^^^^^^^^^^^^
.. Talk about the brief concept

In simple terms:
	* A cellular automaton consists of a grid of cells.
	* Each cell can be in a finite number of states, e.g. on or off. 
	* The simulation is marched through time. At each timestep, the state of the grid depends on the state in the previous timestep, following a set of fixed rules. 
	* The initial state has no state prior to it, and thus needs to be specified. 
	* The rules only depend on the previous state of each cell and its neighbours.

Just like what we saw when covering flocking algorithms, cellular automata can generate interesting patterns just from specifying simple behavioural rules. 

.. Talk about the history and Game of Life

The concept of cellular automata started with the concept of self-replicating systems itself, when von Neumann was working on the idea of robots that can build themselves in the 1940s. Scientists after von Neumann gradually expanded upon the idea, and cellular automata as it is known today became famous through John Conway's Game of Life in the 1970s. 

The Game of Life got its name because each cell can be in two states, either dead or alive. The game works on a 2D grid, and has four simple rules:
	1. Live cell with < 2 neighbours --> dies
	2. Live cell with 2 or 3 neighbours --> lives
	3. Live cell with > 3 neighbours --> dies
	4. Dead cell with 3 neighbours --> lives

Depending on the initial state of the grid, the system is able to produce a large range of behaviour, generating patterns that are unbelievably complex. `The corresponding wikipedia page has a few good examples. <https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Examples_of_patterns>`_

Given that the Game of Life has been explored extensively, we will tap into the world's biggest lecture database to further understand the concept. 
	* This video explains the concepts of Game of Life briefly in 2 minutes: https://www.youtube.com/watch?v=0XI6s-TGzSs
	* This video demonstrates a Game of Life simulation in 3 minutes: https://www.youtube.com/watch?v=Aq51GfPmD54
	* This video simulates Game of Life using Game of Life: https://www.youtube.com/watch?v=xP5-iIeKXE8

.. One more example, Langton's Ant

Another example of a cellular automaton is Langton's Ant, where a single agent, the ant, is placed on a 2D grid, where some of the grid cells are set to on or off. Depending on the current state of the grid, the ant will decide what direction to move in. 

Like many things, there is a good Youtube video for this: https://www.youtube.com/watch?v=NWBToaXK5T0.

Exercise: Conway's Game of Life, but on a one-dimension grid
------------------------------------------------------------
.. Estimated time: 40 mins
.. Section objective: 
.. Instructor notes
.. [X]Find a way to package this such that students can legitimately complete this in a short period of time. Might need to pre-write the visualizer? Jake Vanderplas has sth awesome on this as usual: http://jakevdp.github.io/blog/2013/08/07/conways-game-of-life/ --> in the end, we didn't need no visualizer. 

In this exercise, we will tie together what we learnt about `numpy` arrays, and also the wonderful concept of cellular automata. We will implement a 1D version of Game of Life. 

Instead of a 2D grid, we will use a 1D grid. We will use a 1D `numpy` array to represent the state of the cells. A cell is alive if it is set to 1, and dead if set to 0. 

Due to each cell now only being able to see to the left and to the right, we will need to use new rules as follows:
	+ A cell can see two neighbors to its left and two neighbors to its right. 
	+ If a cell is dead, it will be reborn if it has 2 or 3 neighbors, else it remains dead.
	+ If a cell is alive, it will continue to survive if it has 2 or 4 neighbors, else it will perish. 
	+ Rules referred from `http://jonmillen.com/1dlife/index.html <http://jonmillen.com/1dlife/index.html>`_

Follow the instructions below:

1. Set constants `N=20` and `ITERATIONS=60`.
2. Initialize a numpy array with one-dimension and length N. Set this array to have 1's and 0's at your choice. Name this array `state`.
3. Initialize a blank numpy array that also has length N, but is all zeros. Name this array `next_state`.
4. Create a for-loop that iterates over 2 to N-2, which corresponds to the cells in `state` except for the boundary cells. In each loop, implement the Game of Life logic above, and set the corresponding cell in `next_state` to be 1 if the cell survives, or 0 if the cell dies. 
5. Implement logic that covers the boundary cells with indices 0, 1, N-2, and N-1. These cells follow the same rules, but don't have the same number of neighbors as all other cells further from the boundary.
6. Wrap everything in steps 3 and 4 in a bigger for-loop, that loops over `ITERATIONS`. Inside this bigger for-loop, add under the previous for-loop the following:
	+ update `state` by running `state = next_state.copy()`
	+ print `state`


Conclusion
----------
.. Estimated time: 5 mins
.. Section objective: Recap and re-emphasize message
.. Message of the day: 

Take-away message for this week: 
	* We learnt about working with arrays in one dimension
	* We learnt about the concept of cellular automata and implemented one ourselves!

Further reading
---------------
* https://en.wikipedia.org/wiki/Boids
* https://en.wikipedia.org/wiki/Cellular_automaton
* `Youtube video - Inventing Game of Life (John Conway) - Numberphile <https://www.youtube.com/watch?v=R9Plq-D1gEk>`_