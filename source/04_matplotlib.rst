Week 4: Visualizing data with matplotlib
========================================
	
Outcome: Students will learn how to make basic plots in Python using `matplotlib`, the de-facto standard for visualization.

.. Instructor notes
.. Message: This class is only focused on how to use matplotlib, no deeper message of the day to take home

What we will do: 
	* Code to ... *draw* ?
	* What is matplotlib + setup check
	* Basic plotting
	* Basic configuration
	* Combining plot elements
	* Exercise: Writing a visualizer we will use soon ...
    .. * (No Adv Exercise: no concept to explore here)

Code to ... *draw*?
---------------------
.. Instructor notes: 
.. Estimated time: 20 mins
.. Section objective: Set the context of coding not to build something, but to show something.

In the last few weeks, we have been learning the basics of coding as a tool to execute logic. It might come as a surprise to you that coding is not all about logic, but can also be applied to generate visualizations. In fact, some people spend significant amounts of time using code to build the visualizations that they need! 

Visualization is typically done as part of data analysis work, to summarize and express the relationships in data in an intuitive manner. A few examples of neat visualizations made in code that you can find online:
	* `Gaze and the Control of Foot Placement When Walking in Natural Terrain, from Reddit <https://www.reddit.com/r/dataisbeautiful/comments/8bzdr8/gaze_and_foot_placement_when_walking_over_rough/>`_
	* `Wall St Journal graphic on the impact of vaccines <http://graphics.wsj.com/infectious-diseases-and-vaccines/>`_
	* `Visualizing the trade of small arms across the globe, Chrome Experiments <https://armsglobe.chromeexperiments.com/>`_
	* `Life In The Camps by Reuters <http://fingfx.thomsonreuters.com/gfx/rngs/MYANMAR-ROHINGYA/010051VB46G/index.html>`_
	* `World Health Chart by Gapminder <https://www.gapminder.org/fw/world-health-chart/>`_

In this class, we won't be making visualizations as impressive as these. These interactive visualizations make heavy use of Javascript-based libraries, of which is out of scope of this course. Instead, we will start small, and take a small step into making plots in Python, with `matplotlib`. 

What is matplotlib + setup check
--------------------------------
.. Instructor notes: 
.. Estimated time: 10 mins
.. Section objective: Brief intro to matplotlib, and take some time to ensure everyone is set up.

`matplotlib` is a widely used plotting library in Python, and is the de facto standard for scientific analysis. It enables users to generate publication-quality plots, and allows heavy customization to get plots that look exactly the way the users want to.

For this class, you will need to be using a local Python installation w/ the `matplotlib` package installed. If you were using an online REPL for the class, you will need to switch to using an IDE like Spyder. `matplotlib` is installed by default if you are using Anaconda Python. Else, you will need to install it separately. 

If you are able to run the following code chunk and see plot output, you are good to go.
::

	import matplotlib.pyplot as plt
	plt.plot([1, 2, 3, 4], [1, 2, 3, 4])
	plt.show()


Basic plotting
--------------
.. Instructor notes: 
.. Estimated time: 20 mins
.. Section objective: Introduce students to basic plotting functions. 
.. [ ]Should prepare the data for this?
.. [ ]Importing packages: matplotlib
.. [ ]`plt.plot`
.. [ ]`plt.scatter`
.. [ ]Formatting scatter markers
.. [ ]`plt.bar`
.. [ ]`plt.axhline`, `plt.axyline`
.. [ ]Logarithmic axis

Using `matplotlib` requires you to **import** it in Python before usage. 

Exercise: Recreating the World Health Chart I
---------------------------------------------
.. Instructor notes: 
.. Estimated time: 15 mins
.. Section objective: 


Basic configuration and styling
-------------------------------
.. Instructor notes: 
.. Estimated time: 20 mins
.. Section objective: Introduce students to basic configuration options for customizing plots. 
.. [ ]`plt.figure`
.. [ ]`plt.title`
.. [ ]`plt.legend and labels`
.. [ ]Setting color for plot elements
.. [ ]Setting size for plot elements

Exercise: Recreating the World Health Chart II
----------------------------------------------
.. Instructor notes: 
.. Estimated time: 15 mins
.. Section objective: 

Exercise: More plotting
-----------------------
.. Instructor notes: 
.. Estimated time: 15 mins
.. Section objective: Allow students to practice applying basic plotting and basic configuration 
.. [ ]Exercise: Concentric circle rings w/ different styles
.. [ ]Exercise: Recreate classic life expectancy by country over time plot
.. [ ]Last exercise: Dinosaur plot just for the lols

.. Exercise: Writing a visualizer we will use soon ...
.. ---------------------------------------------------
.. Instructor notes: 
.. Estimated time: 20 mins
.. Section objective: Write visualizer needed for automata exercise next class.
.. [ ]Instructor solution for fluid simulator in next class first! 
.. [ ]Then only possible to design this prompt! 


Conclusion
----------
.. Instructor notes
.. Estimated time: <5 mins
.. Section objective: Recap and re-emphasize message
.. [ ] Recap on things learnt

Further reading
---------------
Official `matplotlib` documentation by Matplotlib development team: https://matplotlib.org/contents.html