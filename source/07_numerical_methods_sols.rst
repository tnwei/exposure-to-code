Week 7: Class Exercise solutions
================================

Exercise: Solving roots using Newton-Raphson's method
-----------------------------------------------------
::

    def f(x):
        return (x ** 4) - (4 * x ** 3) - (2 * x ** 2) + (12 * x) - 3

    def f_prime(x):
        return (4 * x ** 3) - (12 * x ** 2) - (4 * x) + 12

    def find_root_nr(x0):
        # Define tolerance
        tol = 1e-7
        
        # Initialize relative error to a big number
        rerr = 500 
        
        # Initialize xn as x0
        xn = x0

        while rerr > tol:
            # Implement the given formula
            xn1 = xn - f(xn)/f_prime(xn)
            
            # Update relative error and xn for the next iteration
            rerr = abs(xn1 - xn)
            xn = xn1
            
        # Return xn after exiting the loop
        return xn

    for i in [-2, 0, 2, 4]:
        print(find_root_nr(i))


Exercise: Linear Programming
----------------------------