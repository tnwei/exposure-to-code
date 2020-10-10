Week 5 : `Numpy` vectors & cellular automata
============================================

.. Instructor notes
.. Message: Numerical computing in Python can be handled through the `numpy` package. Cellular automata as an interesting example of emergent complexity arising from simple rules. 

Outcome: Students will learn the basics of using `numpy`, Python's numerical computing library for array calculations. Students will also be introduced to the concept of cellular automata, one of the many interesting concepts in computer science.

What we will do:
	* Introduction to `numpy`
	* 1D arrays in `numpy`
	* Exercise: 1D fluid simulation by cellular automata
	* (Adv Exercise: Conway's Game of Life)

Introduction to numpy + setup check
-----------------------------------
.. Instructor notes: 
.. Estimated time: 15 mins
.. Section objective: Introduce students to numpy. 

.. [X]What is numpy and what do people use it for: scientific computing

From our past few modules, we know that we can use Python to implement mathematical calculations. However, if we are serious about crunching numbers, we will need to use `numpy`.

`numpy` is another very commonly used library in Python. In its name, "num" represents "numerical" while "py" represents Python. `numpy` enables efficient numerical array operations and linear algebra, which are key features needed in most, if not all serious scientific computing efforts. The scientific computing ecosystem in Python is basically built on `numpy`. Remember `matplotlib` and `pandas`, the libraries we've used last week? They both heavily depend on `numpy`.

For this week's class, you will need to be using a local Python installation, just like last week. In fact, you will need it for the rest of this course! Given that we will need to import libraries every week, online REPLs will not be able to support our work any further. 

If you can run the following code chunk without errors, you are good to go for today!
::
	import numpy as np
	import matplotlib.pyplot as plt
	plt.plot([1, 2, 3, 4], [1, 2, 3, 4])
	plt.show()


Basic `numpy` operations
------------------------
.. Instructor notes: 
.. Estimated time: 30 mins
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
.. [ ]Access individual numbers in an array via array indexing
.. [ ]Assign individual numbers in an array via array indexing
.. [ ]Colon operator for accessing multiple numbers, just like lists! Also works forward and backwards
.. [ ]Indexing with conditionals

Array operations
^^^^^^^^^^^^^^^^
.. [ ]Array arithmetic with constants
.. [ ]Array arithmetic with other arrays
.. [ ]sum(), mean(), max(), argmax()
.. [ ]Do array arithmetic but w/o arrays! Hmmmm the tedium ...

Exercise: Thinking in array indices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Cellular Automata
-----------------
.. Instructor notes: 
.. Estimated time: 20 mins
.. Section objective: Show the concept of cellular automata. 
.. [ ] What are cellular automata
.. [ ] Summarize the basic concepts of cellular automata

Exercise: 1D fluid simulation by cellular automata
--------------------------------------------------
.. Instructor notes: 
.. Estimated time: 40 mins
.. Section objective: Use numpy to create a fluid simulation, using cellular automata. 
.. [ ] Instructor solution, then break down prompt into segments. Else it will be too complex!

Conclusion
----------
.. Estimated time: 5 mins
.. Section objective: Recap and re-emphasize message
.. Message of the day: 

Further reading
---------------
.. Official `matplotlib` documentation by Matplotlib development team: https://matplotlib.org/contents.html
.. https://www.youtube.com/watch?v=NptnmWvkbTw