Week 6 : `Numpy` arrays & exploring chaotic phenomena
=====================================================

Outcome: Students will learn more about `numpy`, extending last lesson's knowledge to 2D arrays. Students will also be made acquainted with famous chaotic systems, and how code enables the exploration and study of these systems. 

What we will do:
    * 2D arrays in `numpy`
    * Chaotic systems
	* Exercise: Lorentz Attractor
	* Exercise: Mandelbrot set
    .. * (No Adv exercise, explore configurations for the rest of the class?)

Refresher on `numpy` and 1D arrays + setup check
------------------------------------------------
.. Instructor notes: 
.. Estimated time: 10 mins
.. Section objective: Summarize last week's contents + setup check

.. [ ]Summarize last week's contents


.. [X]Setup check

Setup check
^^^^^^^^^^^
For this week's class, you will need to be using a local Python installation, just like last week. In fact, you will need it for the rest of this course! Given that we will need to import libraries every week, online REPLs will not be able to support our work any further. 

If you can run the following code chunk without errors, you are good to go for today!
::
	import numpy as np
	import matplotlib.pyplot as plt
	plt.plot([1, 2, 3, 4], [1, 2, 3, 4])
	plt.show()


2D arrays in `numpy`
--------------------
.. Instructor notes: 
.. Estimated time: 35 mins
.. Section objective: Extend previously array operations in 1D to 2D

.. [ ]Array indexing in 2D, building on 1D indexing from last week


.. [ ]The concept of axes in arrays

.. Builds on previous section. Axis 0, axis 1 and axis 2 are the axes we index, in that order. 

.. [ ]Array operations: array arithmetic involving other arrays

.. 1D extend to 2D
.. Array arithmetic w/ constants are the same
.. sum(), mean(), max(), argmax() for different axes
.. Array conditionals for 2D arrays still hold! 

.. 2D and above concepts
.. Element-wise operations with same-shape arrays
.. Matrix operations e.g. dot product, cross product etc

.. [ ]Small exercise for this section
.. Need ideas. Last week's was implementing rolling elements of a 1D array one step to the right. Something that needs thinking in 2D would be best! 

Chaotic systems
---------------
.. Instructor notes: 
.. Estimated time: 20 mins
.. Section objective: Whirlwind introduction to chaotic systems

..[ ]Lay down definition and explanation of chaotic systems
.. Deterministic but appears random
.. Begin explanation by referring to the butterfly effect

..[ ]Walk through real-life examples
.. Weather systems
.. Explain that it is a system with well understood rules, but extremely sensitive to initial conditions
.. Enumerate more examples, e.g. 2X pendulum 

..[ ]Walk through the specific example that we will implement later

Exercise: Plotting the Lorentz Attractor & Mandelbrot set
---------------------------------------------------------
.. Instructor notes: Require instructions in two parts: visualizer and the core logic
.. Estimated time: 40 mins
.. Section objective: Apply 2D array operations to simulate chaotic systems

.. Enough time for both? Need to implement both first to determine complexity?
.. Lorentz Attractor is quite short to make actually
.. Mandelbrot set is a classic demonstration for chaos, does need some explanation to show where the chaotic / stable regimes are. 

Conclusion
----------
.. Estimated time: 5 mins
.. Section objective: Recap and re-emphasize message
.. Message of the day: 

.. Take-away message for this week: 
.. 	* We learnt about working with arrays in one dimension
.. 	* We learnt about the concept of cellular automata and implemented one ourselves!

Further reading
---------------
