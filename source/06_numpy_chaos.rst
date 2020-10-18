Week 6 : `Numpy` arrays & exploring chaotic phenomena
=====================================================

Outcome: Students will learn more about `numpy`, extending last lesson's knowledge to 2D arrays. Students will also be made acquainted with famous chaotic systems, and how code enables the exploration and study of these systems. 

What we will do:
    * 2D arrays in `numpy`
    * Chaotic systems
	* Exercise: Lorenz system
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
.. Estimated time: 30 mins
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

Exercise: Lorenz System
-----------------------
.. Instructor notes: Require instructions for both visualizer and the core logic
.. Estimated time: 15 mins
.. Section objective: Apply 2D array operations to simulate chaotic systems

.. Enough time for both? Need to implement both first to determine complexity? -> Doubt so
.. Lorentz Attractor is quite short to make actually

.. Begin with brief history on Lorenz: weather convection sytem
.. Then show the equations, explain them. Give instructions to implement
.. Start exploring. Use a, b = Lorenz's values, while setting c = 5. Run using a variety of init_state, ask students what do they observe in the difference of the last value? Should see attractor behaviour. This is opposite of chaotic behaviour! Not sensitive to initial conditions.
.. Tell them to make function to plot xs over time, ys over time, and zs over time. Use this on top of printing the last values of xs, ys and zs. Use multiple init states.
.. Increase c to 5, 12, 15, 22, 55
.. Increase c to 28
.. Second step is to tell them to make function to plot xs vs ys, xs vs zs and ys vs zs. Re-run all their code steps above. 


Exercise: Mandelbrot Set
------------------------
.. Instructor notes: Require instructions for both visualizer and the core logic
.. Estimated time: 30 mins
.. Section objective: Apply 2D array operations to simulate chaotic systems

.. Mandelbrot set is a classic demonstration for chaos, does need some explanation to show where the chaotic / stable regimes are. 
.. Show the equation. Explain it, and then add that this is also valid for complex numbers. 
.. Need to talk about complex() or use a+bj format to represent complex numbers
.. Give instructions to build the `mandelbrot` function and ask folks to input different complex numbers, and plot to see the behaviour. Notice that the output is chaotic. 
.. Think about how to do this automatically. Why not get code to run for every combination of complex numbers? We can then plot it, using real numbers on x axis, and imaginary numbers on y axis. Give instructions to write `is_bounded`, and the whole code chunk to be able to get the rudimentary picture. Then stick into a function. Then set the extents of the graph, and increase the figsize. Then increase the precision. Then modify is_bounded so it can accept different iteration values until we get a sharp plot. Stop at iteration=50 because we're saving go sharper for later. 
.. Use the plotted map, visualize the chaotic behavior of the mandelbrot equation. Check values blowing up, by moving to the left from origin, then moving to the right from origin. Notice that using one threshold means you might miss stuff. Hence add color to plot. Tell them to use the sped up version of the function as well. 
.. Now we can see very clearly how the regions that are bounded and regions that are unbounded are separated. Let's try and pinpoint as close as possible where we can find the onset of chaotic behaviour. For that, we'll need to zoom. Let's modify the function instead to use a centre point, and also package the plotting code inside. Start doing a series of zooms.
.. We've been zooming, but we've not been improving resolution! Re-run using a different number of iterations. We should see more structure revealed. Explain that this is why the values are so chaotic at the edges. Move a little bit and actually you're moving into a different region! 
.. Do one more set of zooming. Explain that this is self-similarity. Mandelbrot set is also classic example of fractals. 
.. Use this last final plot to find regions of stable vs unstable behaviour. Pick points and plug into the mandelbrot equation, to show that this region is chaotic.

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
