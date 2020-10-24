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


Exercise: Solving optimization problems with `scipy`
----------------------------------------------------
Part A
^^^^^^
::
    
    def calc_profit(x):
        customers = -1000 *x + 2000
        cost = customers * 0.5
        revenue = customers * x
        profit = revenue - cost
        return profit

    def obj_fun(x):
        return -calc_profit(x)

    res = minimize_scalar(fun=obj_fun)
    print(res)

Should give the following output:
::

         fun: -562.5
        nfev: 9
         nit: 5
     success: True
           x: 1.25

Part B
^^^^^^
::
    
    def calc_profit_new_loc(x):
        customers = -1000 *x + 4000
        cost = customers * 2 + 20
        revenue = customers * x
        profit = revenue - cost
        return profit

    def obj_fun_new_loc(x):
        return -calc_profit_new_loc(x)

    res = minimize_scalar(fun=obj_fun_new_loc)
    print(res)

Should give the following output:
::

         fun: -980.0
        nfev: 10
         nit: 4
     success: True
           x: 3.0

Thus, answer is yes, worth it to move. Daily optimal profit of RM 980.00 at new location vs RM 562.50 at current location.