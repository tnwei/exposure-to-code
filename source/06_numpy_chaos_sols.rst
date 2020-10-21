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
	

