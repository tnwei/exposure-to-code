Week 6 : `Numpy` arrays & exploring chaotic phenomena
=====================================================

Outcome: Students will learn more about `numpy`, extending last lesson's knowledge to 2D arrays. Students will also be made acquainted with famous chaotic systems, and how code enables the exploration and study of these systems.

What we will do:
    * Setup check
    * 2D arrays in `numpy`
    * Exercise: Sum of all elements in a 2D array
    * Chaotic systems
    * Exercise: Lorenz system
    * Exercise: Mandelbrot set
    
Setup check
-----------
.. Instructor notes:
.. Estimated time: 10 mins
.. Section objective: Summarize last week's contents + setup check

.. [X]Setup check

For this week's class, you will need to be using a local Python installation, just like last week. In fact, you will need it for the rest of this course! Given that we will need to import libraries every week, online REPLs will not be able to support our work any further.

If you can run the following code chunk without errors, you are good to go for today!
::
    import numpy as np
    import matplotlib.pyplot as plt
    plt.plot([1, 2, 3, 4], [1, 2, 3, 4])
    plt.show()

.. Refresher on `numpy` and 1D arrays
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. [ ]Summarize last week's contents
.. TODO

2D arrays in `numpy`
--------------------
.. Instructor notes:
.. Estimated time: 20 mins
.. Section objective: Extend previously array operations in 1D to 2D

Previously, we learned on how to initialize 1D arrays like below
::
    
    arr_a = np.array([57, 82, 147, 71, 111, 115, 101, 89, 260, 287])

We live in a 3D world, so obviously not everything is in 1D! We should be able to have arrays that have more than one dimension. This is what we'll be learning today. 

2D arrays?
^^^^^^^^^^

Before we get into that, we should understand what 2D arrays are and what kind of information we can put into them. Let's say for example in GENIUSpintar's senior batch there are 49 students and 7 classes in total. If we had a 1D array, we would only be able to keep all the student's names and nothing else. However, if we had a 2D array, we can keep all types of information such as the student's names, id number, class number, and so on.In short, imagine a 2D array like Microsoft Excel where you can store data in different columns and rows. 

Initializing 2D arrays
^^^^^^^^^^^^^^^^^^^^^^
.. [-]The concept of axes in arrays --> just dimensions, can set aside

This is how we initialize a 2D array using `np.array`. It is fairly similar to what we did with 1D arrays with a small difference. The following code
sets up a 2D array containing a few rows of data, where the first column is person number, and the second column is age. Verify that by printing this array yourself:
::

    arr_a = np.array([[1, 24], [2, 19], [3, 21]])

.. TODO speak more about how to set rows and columns, and then specify that we won't look into 3D arrays.

Last week, we also used `np.zeros` and `np.ones` to initialize arrays that are all zeros or all ones, in 1D. Below is how we initialize a 2D array with 10 rows and 4 columns:
::

    np.zeros(shape=(10, 4))
    np.ones(shape=(10, 4))

And the following is how we use `np.zeros` and `np.ones` to initialize a 3D array with 9 rows, 8 columns, and a third dimension with length 2.
::

    np.zeros(shape=(9, 8, 2))
    np.ones(shape=(9, 8, 2))

Do you see the format here? Basically, the shape of an array is specified by the length of each dimension in sequence. Typically, instead of the word "dimension", we use the word "axis", or in plural, "axes".

Array indexing on 2D axes
^^^^^^^^^^^^^^^^^^^^^^^^^

.. [X]Array indexing in 2D, building on 1D indexing from last week

We have seen last week that indexing a 1D array is similar to indexing for lists. For arrays with two dimensions, the syntax is similar, just that we need to *place the indices in the corresponding axes*. We will use the very first array initialized above as the example array to index.

Following are a few examples:
    * accessing the first value in the second axis
    * accessing the third value in the first axis
    * accessing the last value in the last axis
    * accessing all values in the first axis

::
        
    arr_a[0, 1]
    arr_a[2, 0]
    arr_a[-1, -1]
    arr_a[:, -1]

In simpler words:
    * Row 1 Column 2, thus indexed by [0, 1]
    * Row 3 Column 1, thus indexed by [2, 0]
    * Row -1 Column -1, thus indexed by [-1, -1]
    * All rows Column 1, thus indexed by [:, -1]

What's going on in the last example? 

.. note::
    When indexing arrays from the first element to the last, you can specify `:`, as a shortcut to represent `0:-1`. 

.. Array operations in 2D
.. ^^^^^^^^^^^^^^^^^^^^^^
.. [ ]Array operations: array arithmetic involving other arrays
.. sum(), mean(), max(), argmax() for different axes
.. 1D extend to 2D
.. Array arithmetic w/ constants are the same

Array functions in 2D
^^^^^^^^^^^^^^^^^^^^^

Last week, we learned how to use the functions `sum`, `mean`, `max` and `argmax` for 1D arrays. Just like array indexing, the syntax is similar, just that we need to be mindful of the axes. 

This is how to find the sum of the values along each row, i.e. sum by columns:
::
    
    arr_a.sum(axis=0)

This is how to calculate the sum of the values along each column, i.e. sum by rows:
::

    arr_a.sum(axis=1)

Array conditionals in 2D
^^^^^^^^^^^^^^^^^^^^^^^^
.. Array conditionals for 2D arrays still hold!

Array conditionals still work for 2D arrays as well. However, the format of the output is very different; `numpy` will first reshape the array to one dimension, then run the conditional. Try the following code, where we tell `numpy` to only return us elements in `arr_a` that are divisible by two. There are two elements that fulfill this condition, at `arr_a[0, 1]` and `arr_a[1, 0]` respectively. 
::

    print(arr_a[arr_a % 2 ==0])
    # [24 2]

Notice that the output is in one dimension. 

.. 2D and above concepts
.. Element-wise operations with same-shape arrays

Array arithmetic in 2D
^^^^^^^^^^^^^^^^^^^^^^

Element-wise operations in 2D work similarly as in 1D. Arithmetic between 2D arrays and numbers work as expected thanks to array broadcasting:
::

    np.zeros(shape=(5, 3)) + 2
    
However, any arithmetic between arrays will require them to have the same shape. You can see this for yourself below:
::

    # These lines of code will return errors!
    np.ones(shape=(5, 3)) + np.ones(shape=(5, ))
    np.ones(shape=(5, 3)) + np.ones(shape=(3, ))

    # Only this one will not!
    np.ones(shape=(5, 3)) + np.ones(shape=(5, 3))

With 2D arrays, we can also perform operations on them if they have the same shape.

Matrix operations
^^^^^^^^^^^^^^^^^
.. Matrix operations e.g. dot product, cross product etc

As 2D arrays are equivalent to matrices in mathematics, it is simple to perform matrix operations on 2D arrays. For instance, you can perform a dot product using `np.dot(array1, array2)`:
::

    arr_b = np.array([[ 0,  1,  2],
       [ 3,  4,  5],
       [ 6,  7,  8],
       [ 9, 10, 11]])
    arr_c = np.array([[ 0,  1,  2,  3],
       [ 4,  5,  6,  7],
       [ 8,  9, 10, 11]])

    print(np.dot(arr_b, arr_c))
    
Exercise: Sum of all elements in a 2D array
-------------------------------------------

.. [ ]Small exercise for this section
.. Need ideas. Last week's was implementing rolling elements of a 1D array one step to the right. Something that needs thinking in 2D would be best!
.. (Since its a small exercise.. What about finding sum of 2d array? They can find out how to utilize 2x for loop the right way here)

The following code below creates an array and fills it with random numbers. Find the total sum of the numbers in the array. 

::

    big_array = np.random.random(size=(10000, 10000))

    # YOUR CODE BELOW


.. Answer:
.. sum=0
.. for row in range (len(c_arr)):
..    for col in range(len(c_arr[0])):
..        sum = sum + c_arr[row][col]
..        print*sum)

Chaotic systems
---------------
.. Instructor notes:
.. Estimated time: 20 mins
.. Section objective: Whirlwind introduction to chaotic systems

.. [ ]Lay down definition and explanation of chaotic systems
.. Deterministic but appears random

Chaotic systems are systems that appear to be random but are actually deterministic, and are highly sensitive to initial conditions.

Think of it like this, remember Conway's Game of Life and how it is important to have rules and its initial state defined? We then get seemingly random
but deterministic patterns such as spaceships and oscillators just by specifying these initial conditions.

.. Begin explanation by referring to the butterfly effect

The butterfly effect in pop culture knowledge is a good example of this. 

.. note ::
    "A butterfly flaps its wings in the Amazonian jungle, and subsequently a storm ravages half of Europe"
         -Terry Pratchett and Neil Gaiman"

The butterfly effect is defined as the sensitive dependence on initial conditions in which a small change in one state of a deterministic nonlinear system can result in large differences in a later state.
Just by comparing the differences of the definition between Chaotic Systems/Chaos Theory and the Butterfly Effect, we can see that they are very similar.
The concept "Butterfly Effect" can be imagined like this. 

The founder of chaos theory Edward Lorenz states he used the Butterfly as an example as it had symbolic representation of unknowable quantity.

.. note ::
    "For want of a nail the shoe was lost,

    For want of a shoe the horse was lost,

    For want of a horse the rider was lost,

    For want of a rider the battle was lost,

    For want of a battle the kingdom was lost,
    
    And all for the want of a horseshoe nail."
        -Benjamin Franklin

.. [ ]Walk through real-life examples
.. Weather systems

Let's go back to foundations of chaos theory by looking at Edward Lorenz did. Lorenz was a meteorologist and mathematician who combined both fields to become what we know today as chaos theory.
In an experiment to model weather predictions, he decided to enter an initial condition of 0.506 instead of 0.506127. He thought that the weather prediction wouldn't change by that much, but he
got a completely different result. He deduced that a miniscule change in initial conditions had long-term implications. in 1963, he wrote a paper entitled Deterministic Nonperiodic Flow which he
theorized that "weather prediction models are inaccurate because knowing the precise starting conditions is impossible, and a tiny change can throw off the results."

.. Explain that it is a system with well understood rules, but extremely sensitive to initial conditions

It shows science to be less accurate than we assume, as we have no means of making accurate predictions due to the exponential growth of errors.

.. Enumerate more examples, e.g. 2X pendulum

Another example of chaos theory is the 2x pendulum. The 2x pendulum is set up in a way that the 2nd pendulum is attached to edge of the 1st pendulum. This is so we can see how the 2nd pendulum moves about when we release
at a specific angle. Now, we set 3 different double pendulum with the exact same specifications (same height, same weight). Then, we release the pendulums at the same angle. Just
by doing this we can observe that the 3 pendulums do not follow each other. Simple miniscule difference in initial conditions change the result significantly.

.. [ ]Walk through the specific example that we will implement later
.. Do you have a specific example for this?

Exercise: Lorenz System
-----------------------
.. Instructor notes: Require instructions for both visualizer and the core logic
.. Estimated time: 15 mins
.. Section objective: Apply 2D array operations to simulate chaotic systems

.. Enough time for both? Need to implement both first to determine complexity? -> Doubt so
.. Lorentz Attractor is quite short to make actually

.. Begin with brief history on Lorenz: weather convection sytem

Let's go into more detail on the work of Edward Lorenz. He was working on a set of equations to model atmospheric convection in 1963, which describe how a two-dimensional layer of fluid would be warmed from below and cooled from above. Below is a simplified version of the Lorenz equations:

.. Then show the equations, explain them. Give instructions to implement

.. math ::

            \frac{dx}{dt} = a(y-x)

        \frac{dy}{dt} = x(c-z) - y

           \frac{dz}{dt} = xy - bz


where `x`, `y` and `z` represent the dimensions, and `a`, `b` and `c` represent constants. This is a trio of ordinary differential equations, where the rate of change of `x`, `y` and `z` are dependent on each other over time. (Speaking of differential equations, we will cover it later in the course!)

Lorenz eventually found that a certain combination of constants resulted in chaotic behaviour, where given slightly different initial conditions, the equations produce wildly different output. We will take a look for ourselves in this exercise.

Part A
^^^^^^

1. Implement a function called `lorenz` that has the following arguments:
    * `a`, `b` and `c`, representing the constants of the Lorenz equations
    * `init_state`, a list of three numbers that represents initial conditions
2. Inside the function, initialize two variables below:
    * `dt` to represent time step size. Set this to 0.01
    * `duration` to represent total length of time to simulate. Set this to 40.
2. Initialize the variable `state` as an array of all zeros, with shape `(int(duration/dt), 3)`.
3. Set the first row of `state` to be equal to `init_state`
4. Loop for `i` from 0 to `len(state)-1`:
    * Set `x`, `y` and `z` to be equal to `state[i, 0]`, `state[i, 1]`, `state[i, 2]`
    * Implement the Lorenz equations:
    ::

        dx = (a*(y-x)) * dt
        dy = (x*(c-z) - y) * dt
        dz = (x*y - b*z) * dt

        state[i+1, 0] = x + dx
        state[i+1, 1] = y + dy
        state[i+1, 2] = z + dz

5. Return `state` after the loop.

Part B
^^^^^^
.. Start exploring. Use a, b = Lorenz's values, while setting c = 5. Run using a variety of init_state, ask students what do they observe in the difference of the last value? Should see attractor behaviour. This is opposite of chaotic behaviour! Not sensitive to initial conditions.
.. Increase c to 5, 12, 15, 22, 28

What we have done in Part A is to use numerical methods to approximate the solutions of the Lorenz equations over time. We will also explore this particular topic later in the course!

1. Copy paste this function below.
::

    def show_ts(state):
        xs, ys, zs = state[:, 0], state[:, 1], state[:, 2]

        plt.plot(range(len(xs)), xs)
        plt.show()

        plt.plot(range(len(xs)), ys)
        plt.show()

        plt.plot(range(len(xs)), zs)
        plt.show()

Use it to explore the outputs of different runs of the `lorenz` function like so:
::

    state = lorenz(a=10, b=8/3, c=5, init_state=[1, 1, 1])
    show_ts(state)

2. Use constants from the example above, change the values in `init_state` a few times. What do you observe? Print the final values to compare how they differ from each other.

3. Repeat (2) using `c` equals 12, then 15, then 28. What do you observe?

Part C
^^^^^^
.. Tell them to make function to plot xs over time, ys over time, and zs over time. Use this on top of printing the last values of xs, ys and zs. Use multiple init states.

1. Modify `show_ts` to create the function `show_2d`, that:
    * plots `xs` vs `ys`, then `xs` vs `zs`, then `ys` vs `zs`
    * labels the x and y labels appropriately

2. Re-run Steps 2 and 3 from Part B. What do you observe?


Exercise: Mandelbrot Set
------------------------
.. Instructor notes: Require instructions for both visualizer and the core logic
.. Estimated time: 40 mins
.. Section objective: Apply 2D array operations to simulate chaotic systems

.. Mandelbrot set is a classic demonstration for chaos, does need some explanation to show where the chaotic / stable regimes are.

Take a complex number `c`. We square it, then add itself to the result. When we iterate over this process, we will get certain numbers of `c` where the outcome will either rise to infinity or drop to negative infinity. We will also get certain numbers of `c` where the absolute value will stay bounded, i.e. stay finite over multiple iterations. The latter numbers form the definition of the Mandelbrot set.

.. note ::
    The reason complex numbers are considered, is because the aforementioned relation is trivial for real numbers. On one hand, at a certain negative number and below, the square of itself will always exceed adding itself, causing the value to tend to infinity over iterations. On the other hand, at a certain positive number and above, the same happens.

    Complex numbers however follow a more interesting squaring rule. A complex number is represented as :math:`a+bi`, where `a` and `b` are constants, while `i` represents the unit imaginary number. The square of a complex number would be:

    .. math ::

        (a+bi)(a+bi) = a^2 + 2abi + {b^2}{i^2} = a^2 - b^2 + 2abi

    From the above equation, you can see that many combinations of `a` and `b` can lead to different outcomes!

The Mandelbrot set is famous for demonstrating fractal behaviour, i.e. self-similarity, at different scales. As you zoom in, you will see more and more detail. In this module, we will look at how certain regions of the Mandelbrot set exhibits chaotic behaviour, and also visualize the Mandelbrot set while we're at it.

Part A
^^^^^^
.. Give instructions to build the `mandelbrot` function and ask folks to input different complex numbers, and plot to see the behaviour. Notice that the output is chaotic.
.. Need to talk about complex() or use a+bj format to represent complex numbers

Implement a function, `mandelbrot`, to determine if a complex number is part of the Mandelbrot set.

1. The function takes two arguments, `c` for the complex number, and `iterations` for number of times to repeat the equation.
2. Inside the function, define a variable `z` that is equal to `c`. Create a variable `zs` that is a list, and store `z` in it.
3. Run a for-loop to loop over the range of numbers from 1 to `iterations`. In the loop:
    * Assign `z` to be equal to the square of itself, plus `c`.
    * Append `z` to `zs`
4. Return `zs`
5. Modify the function definition from `def mandelbrot(c, iterations):` to `def mandelbrot(c, iterations=10):`. This assigns a default value of 10 if we don't specify `iterations`.

.. note::
    Assign a value to the argument in a function definition to assign a default value. The proper name for this is optional arguments. Example:
    ::

        def add_nums(num1, num2=10):
            print(num1 + num2)

        print_number(5, 5) # Returns 10
        print_number(5) # Returns 15

6. Copy-paste the following code chunk. Modify the complex number passed to the function. What do you observe?
::

    zs = mandelbrot(complex(1.21, 1.5))
    print(zs[-1])
    plt.plot(zs)
    plt.show()

.. note::
    Complex numbers in Python are initialized by the `complex` function. Example:
    ::

        a = complex(1, 2)
        print(a)
        # (1+2j)

    `j` is used to represent `i`, as `i` is already frequently used in for-loops!

    You can also initialize complex numbers by specify it directly as `a + bj`, where `a` and `b` are numbers. Example:
    ::

        print(1 + 5j)
        # (1+5j)

Part B
^^^^^^
.. Think about how to do this automatically. Why not get code to run for every combination of complex numbers? We can then plot it, using real numbers on x axis, and imaginary numbers on y axis. Give instructions to write `is_bounded`, and the whole code chunk to be able to get the rudimentary picture. Then stick into a function. Then set the extents of the graph, and increase the figsize. Then increase the precision. Then modify is_bounded so it can accept different iteration values until we get a sharp plot. Stop at iteration=50 because we're saving go sharper for later.

Given that we're in a coding class, we can do better than checking different complex numbers by hand. Why not use code to check a range of numbers for us? We can then visualize them on a plot, using the x-axis for real numbers, and y-axis for imaginary numbers.

1. Write the function `is_bounded` to check if a given complex number is bounded, i.e. is part of the Mandelbrot set.
    * The function takes two arguments, `real` and `imaginary`. Instead of passing a complex number directly, we pass both parts separately because we will be running this function on a 2D grid of numbers! We will be using real numbers along the column (i.e. y-axis) to represent the imaginary components.
    * The function will also take another two arguments, `iterations` and `thresh` that have default values 50 and 10.
    * Inside the function, create the variable `c` as the complex number, using both arguments `real` and `imaginary`.
    * Initialize the variable `z` to have the value of `c`
    * Create a for-loop over `i`, for `i` in the range of 0 to `iterations`:
        * Do `z = z ** 2 + c`
        * Check if `abs(z)` is large than `thresh`. If yes, return 0.
    * Outside the for-loop, add code to return 1.

2. Copy-paste the function definition below to run `is_bounded` on a sequence of `xs` and `ys`:
::

    def calc_mandelbrot(xs, ys):
        xs_count = len(xs)
        ys_count = len(ys)

        # Make array to store results
        # First dim is how many rows, second dim is how many cols
        res = np.zeros(shape=(ys_count, xs_count))

        # For each col
        for i in range(ys_count):
            # For each row
            for j in range(xs_count):
                # Assign col, row results of checking (real, imaginary) which is (row, col)
                res[i, j] = is_bounded(xs[j], ys[i])

        return res

3. Generate `xs` and `ys`, inputs to `calc_mandelbrot` using `np.arange`:
::

    xs = np.arange(-3, 2, 0.1)
    ys = np.arange(-2, 2, 0.1)

.. note ::

    `np.arange(start, end, step)` allows specifying a 1D array where values from `start` to `end` are created, spaced by `step`.

4. Use the following code-chunk to generate a low resolution plot of the Mandelbrot set!
::

    res = calc_mandelbrot(xs, ys)
    plt.figure(figsize=(18, 10))
    plt.imshow(res, origin="lower", extent=[xs[0], xs[-1], ys[0], ys[-1]])
    plt.show()

.. note ::

    `plt.imshow` can be used to visualize 2D arrays as an image!

5. Enhance the resolution by reducing 0.1 in `np.arange` to 5e-3. Note that this might take a while to run depending on your computer. You will see a plot of the Mandelbrot set, where all numbers in the set are visualized in the blob.

6. Using the plot, pick complex numbers to verify if they are part of the set or not, by repeating (6) in Part A.

Part C
^^^^^^
Setting a single threshold might not capture the full variation in the Mandelbrot set, as the points that are unbounded increase/decrease at different speeds!

1. Modify `is_bounded` to instead return the number of iterations required to exceed the threshold.

2. Re-run Part B Q4. You should see a lot more detail in the plot.

3. We want to study further the boundary between numbers in the Mandelbrot set and numbers that are not. We will create a function to simplify plotting the Mandelbrot set. Instead of specifying the bounds of the x-axis and y-axis, we will instead specify a midpoint, and the bounds of the image away from it, specified by `imgsize`.

Complete the function below:
::

    def show_mandelbrot(x, y, imgsize, precision, iterations=50, thresh=10):
        # YOUR CODE BELOW
        # Use x, y and imgsize to find the following
        xstart =
        xend =
        ystart =
        yend =

        xs = np.arange(xstart, xend, precision)
        ys = np.arange(ystart, yend, precision)
        res = calc_mandelbrot(xs, ys, iterations=iterations, thresh=thresh)
        plt.figure(figsize=(18, 10))
        plt.imshow(res, extent=[xs[0], xs[-1], ys[0], ys[-1]], origin="lower", cmap="magma")
        plt.axis("image")
        plt.colorbar()
        plt.show()

.. Use the plotted map, visualize the chaotic behavior of the mandelbrot equation. Check values blowing up, by moving to the left from origin, then moving to the right from origin. Notice that using one threshold means you might miss stuff. Hence add color to plot. Tell them to use the sped up version of the function as well.
.. Now we can see very clearly how the regions that are bounded and regions that are unbounded are separated. Let's try and pinpoint as close as possible where we can find the onset of chaotic behaviour. For that, we'll need to zoom. Let's modify the function instead to use a centre point, and also package the plotting code inside. Start doing a series of zooms.

4. We will zoom in to see the boundaries of the Mandelbrot set better. Run the  following code line by line. Was it simple to determine the boundaries?
::

    show_mandelbrot(-0.5, 0, 2, precision=5e-3)
    show_mandelbrot(-0.75, 0.2, 0.5, precision=1e-3)
    show_mandelbrot(-0.76, 0.1, 0.05, precision=5e-4)
    show_mandelbrot(-0.77, 0.12, 0.03, precision=3e-4)
    show_mandelbrot(-0.773, 0.125, 5e-3, precision=5e-5)
    show_mandelbrot(-0.77315, 0.127, 1e-3, precision=1e-5)
    show_mandelbrot(-0.77295, 0.127, 3e-4, precision=1e-6)
    show_mandelbrot(-0.772975, 0.12704, 1e-5, precision=1e-7)
    show_mandelbrot(-0.772972, 0.12704, 3e-6, precision=1e-8)
    show_mandelbrot(-0.772972, 0.1270404, 5e-7, precision=5e-9)
    show_mandelbrot(-0.7729719, 0.12704049, 3e-8, precision=1e-10)
    show_mandelbrot(-0.772971895, 0.127040495, 3e-9, precision=5e-12)


5. Increase iterations to 200 and re-run. What has changed?

.. We've been zooming, but we've not been improving resolution! Re-run using a different number of iterations. We should see more structure revealed. Explain that this is why the values are so chaotic at the edges. Move a little bit and actually you're moving into a different region!

::

    iterations = 200
    show_mandelbrot(-0.75, 0.2, 0.5, precision=1e-3, iterations=200)
    show_mandelbrot(-0.76, 0.1, 0.05, precision=3e-4, iterations=200)
    show_mandelbrot(-0.77, 0.12, 0.03, precision=1e-4, iterations=200)
    show_mandelbrot(-0.773, 0.125, 5e-3, precision=3e-5, iterations=200)
    show_mandelbrot(-0.77315, 0.127, 1e-3, precision=5e-6, iterations=200)
    show_mandelbrot(-0.77295, 0.127, 3e-4, precision=1e-6, iterations=200)
    show_mandelbrot(-0.772975, 0.12704, 1e-5, precision=5e-8, iterations=200)
    show_mandelbrot(-0.772972, 0.12704, 3e-6, precision=1e-8, iterations=200)
    show_mandelbrot(-0.772972, 0.1270404, 5e-7, precision=5e-9, iterations=200)
    show_mandelbrot(-0.7729719, 0.12704049, 3e-8, precision=1e-10, iterations=200)
    show_mandelbrot(-0.772971895, 0.127040495, 3e-9, precision=5e-12, iterations=200)

.. Do one more set of zooming. Explain that this is self-similarity. Mandelbrot set is also classic example of fractals.
.. Use this last final plot to find regions of stable vs unstable behaviour. Pick points and plug into the mandelbrot equation, to show that this region is chaotic.

Conclusion
----------
.. Estimated time: 5 mins
.. Section objective: Recap and re-emphasize message
.. Message of the day:

Take-away message for this week:
    * We learnt about working with arrays in two dimensions
    * We learnt about the concept of chaotic behaviour and inspected a few classic chaotic systems

Further reading
---------------
`The Butterfly Effect <https://fs.blog/2017/08/the-butterfly-effect/>`_
