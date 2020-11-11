Week 7: Advanced Content
========================
Advanced content are designed for advanced learners that are ready to take on extra challenges. These content are made accessible to all after the class. Note that these content typically require more knowledge than what was presented in class. Typically this section is presented as additional exercises, but for this week we are only going to refer to educational Youtube videos as recommended learning. 

Adv Content: Verlet integration
-------------------------------
.. Intro
.. Need to decide on topic
.. Solar system simulator? Way easier than doing cloth simulator

Explanation of logic
^^^^^^^^^^^^^^^^^^^^
.. How is Verlet integration different and why do we use it

In last week's Lorenz systems exercise, we used Euler's method to solve for and integrate the system of equations to get `x`, `y` and `z` . In simple terms, Euler's method is where we simply take the current rate of change, and multiply it by the length of a timestep to get the increase/decrease in value during that timestep. 

These days, Euler's method is rarely used for serious numerical integration. Instead, much more sophisticated algorithms are used to circumvent the shortcomings of Euler's method. One of the shortcomings is, if used to model a system in motion, Euler's method is not good at ensuring energy is conserved throughout the integration! 

When modelling the energy of a system is important, we use Verlet integration as a simple alternative to Euler's method.

Learn More
^^^^^^^^^^
Learn more about the topic by watching these videos below. Focus less on the code (not Python), and more on the concepts:

* Coding Math - Verlet Integration Part I: https://www.youtube.com/watch?v=3HjO_RGIjCU
* Coding Math - Verlet Integration Part II: https://www.youtube.com/watch?v=pBMivz4rIJY
* Coding Math - Verlet Integration Part III: https://www.youtube.com/watch?v=tAd7ttKbugA
* Coding Math - Verlet Integration Part IV: https://www.youtube.com/watch?v=YgRZDCBLDfs
