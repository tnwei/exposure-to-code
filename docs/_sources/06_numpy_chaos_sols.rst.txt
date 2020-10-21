Week 6: Class Exercise solutions
================================

Exercise: Sum of all elements in a 2D array
-------------------------------------------
Using for-loops:
::

    sum = 0
    for row in range(big_array.shape[0]):
        for col in range(big_array.shape[1]):
            sum = sum + big_array[row, col]

    print(sum)
	
Using sum():
::

    big_array.sum()
	

Exercise: Lorenz System
-----------------------
Part A
^^^^^^
Your code should look something like this:
::

    def lorenz(a, b, c, init_state):
        dt = 0.01
        duration = 40

        state = np.zeros(shape=(int(duration / dt), 3))
        state[0, :] = init_state
        
        for i in range(len(state)-1):
            x = state[i, 0]
            y = state[i, 1]
            z = state[i, 2]
            
            dx = (a*(y-x)) * dt
            dy = (x*(c-z) - y) * dt
            dz = (x*y - b*z) * dt

            state[i+1, 0] = x + dx
            state[i+1, 1] = y + dy
            state[i+1, 2] = z + dz
            
        return state


Part B
^^^^^^
* When `c` equals 5, you will find that regardless of the initial values, the Lorenz equations will bring you back to a fixed value. `show_ts` would display `xs`, `ys` and `zs` stabilizing to specific values after a few iterations.
* When `c` equals 12, you will find that `xs`, `ys` and `zs` will still converge to a specific value, but they oscillate a lot more! 
* When `c` equals 15, you might start seeing there being two specific points that the values will converge to. 
* When `c` equals 28, you will see that the values of the equations become much more erratic, and the system exhibits chaotic behaviour. Small changes in initial conditions will greatly affect the final value of the system!

Part C
^^^^^^
Your code should look something like this:
::

	def show_2d(state):
		xs, ys, zs = state[:, 0], state[:, 1], state[:, 2]
		
		plt.plot(xs, ys)
        plt.xlabel("xs")
        plt.ylabel("ys")
		plt.show()
		
		plt.plot(xs, zs)
        plt.xlabel("xs")
        plt.ylabel("zs")
		plt.show()
		
		plt.plot(ys, zs)
        plt.xlabel("ys")
        plt.ylabel("zs")
		plt.show()

You should observe that at `c = 5`  and `c = 12`, the system converges to a single point. For `c = 15`, the system no longer has one stable point to converge to, but has two instead. At `c = 28`, the system freely oscillates about both stable points.

Exercise: Mandelbrot Set
------------------------
Part A
^^^^^^
::
    
    def mandelbrot(c, iterations=10):
        z = c
        zs = [z]
        for i in range(1, iterations):
            z = z ** 2 + c
            zs.append(z)
        return zs

