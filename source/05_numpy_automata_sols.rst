Week 5: Class Exercise solutions
================================

In-class exercise: array-indexing
---------------------------------
Code:
::

    print(arr_a[0])
    print(arr_a[-3])
    arr_a[6] = 0
    arr_a[-9] = 100
    print(arr_a[4:7])
    arr_a[-3:] = 100


Output:
:: 

    57
    89
    [111 115   0]


Exercise: Thinking in array indices
-----------------------------------

Code for Question 1:
::

    import numpy as np

    def roll_array(arr):
        # YOUR CODE HERE
        arr_len = len(arr)
        new_arr = np.zeros(shape=(arr_len,))
        
        new_arr[0] = arr[-1]
        for i in range(1, arr_len):
            new_arr[i] = arr[i-1]
        
        return new_arr

    # If your example replicates this output, it is good to go
    a = np.array([2, 3, 4, 1])
    roll_array(a)
    # Should get output: `array([1, 2, 3, 4])

Output:
:: 
	
    array([1., 2., 3., 4.])

Code for Question 2:
::

    def odd_even(arr):
        # YOUR CODE HERE
        arr_len = len(arr)
        for i in range(arr_len):
            if i % 2 == 0:
                arr[i] = arr[i] + 1
            else:
                arr[i] = arr[i] - 1
        
        return arr

    # If your example replicates this output, it is good to go
    b = 5 * np.ones(shape=(6, )) # Initialize an array with all 5's
    print(b)
    c = odd_even(b) # Should get output: `array([6, 4, 6, 4, 6, 4])
    print(c)
    d = odd_even(c) # Should get output: `array([7, 3, 7, 3, 7, 3])
    print(d)

Output:
::

    [5. 5. 5. 5. 5. 5.]
    [6. 4. 6. 4. 6. 4.]
    [7. 3. 7. 3. 7. 3.]

Exercise: Conway's Game of Life, but on a one-dimension grid
------------------------------------------------------------
Code:
::

    import numpy as np

    # 1. Set constants N=20 and ITERATIONS=60.
    N = 20
    ITERATIONS = 60

    # 2. Initialize a numpy array with one-dimension and length N. Set this
    # array to have 1’s and 0’s at your choice. Name this array `state`.
    # state = np.zeros(shape=(N, ))
    state[0] = 1
    state[2:8] = 1
    print(state)

    # 3. Initialize a blank numpy array that also has length N, but is all
    # zeros. Name this array next_state.
    next_state = np.zeros(shape=(N, ))

    # 6. Wrap everything in steps 3 and 4 in a bigger for-loop, that loops over 
    # ITERATIONS. Inside this bigger for-loop, add under the previous for-loop 
    # the following:
    #     + update state by running state = next_state.copy()
    #     + print state
    for j in range(ITERATIONS):
        
        # 4. Create a for-loop that iterates over 2 to N-2, which corresponds 
        # to the cells in `state` except for the boundary cells. In each loop, 
        # implement the Game of Life logic above, and set the corresponding 
        # cell in next_state to be 1 if the cell survives, or 0 if the cell 
        # dies.
        for i in range(2, N-2):
            left_neighbours = state[i-2:i].sum()
            right_neighbours = state[i+1:i+3].sum()
            total_neighbours = left_neighbours + right_neighbours
            
            # If dead cell
            if state[i] == 0:
                # Conditions to be alive
                if (total_neighbours == 2) or (total_neighbours == 3):
                    next_state[i] = 1
                # Else stay dead
                else:
                    next_state[i] = 0
            # If alive cell
            else:
                # Conditions to stay alive
                if (total_neighbours == 2) or (total_neighbours == 4):
                    next_state[i] = 1
                # Else become dead
                else:
                    next_state[i] = 0
                    
        # 5. Implement logic that covers the boundary cells with indices 0, 1, 
        # N-2, and N-1. These cells follow the same rules, but don’t have the 
        # same number of neighbors as all other cells further from the boundary.
        
        i = 0
        # left_neighbours = state[i-2:i].sum()
        left_neighbours = 0
        right_neighbours = state[i+1:i+3].sum()
        total_neighbours = left_neighbours + right_neighbours
        
        if state[i] == 0:
            if (total_neighbours == 2) or (total_neighbours == 3):
                next_state[i] = 1
        else:
            if (total_neighbours != 2) or (total_neighbours != 4):
                next_state[i] = 0
        
        i = 1
        # left_neighbours = state[i-2:i].sum()
        left_neighbours = state[0]
        right_neighbours = state[i+1:i+3].sum()
        total_neighbours = left_neighbours + right_neighbours
        
        if state[i] == 0:
            if (total_neighbours == 2) or (total_neighbours == 3):
                next_state[i] = 1
        else:
            if (total_neighbours != 2) or (total_neighbours != 4):
                next_state[i] = 0
        
        i = N-2
        left_neighbours = state[i-2:i].sum()
        # right_neighbours = state[i+1:i+3].sum()
        right_neighbours = state[N-1]
        total_neighbours = left_neighbours + right_neighbours
        
        if state[i] == 0:
            if (total_neighbours == 2) or (total_neighbours == 3):
                next_state[i] = 1
        else:
            if (total_neighbours != 2) or (total_neighbours != 4):
                next_state[i] = 0
        
        i = N-1
        left_neighbours = state[i-2:i].sum()
        # right_neighbours = state[i+1:i+3].sum()
        right_neighbours = 0
        total_neighbours = left_neighbours + right_neighbours
        
        if state[i] == 0:
            if (total_neighbours == 2) or (total_neighbours == 3):
                next_state[i] = 1
        else:
            if (total_neighbours != 2) or (total_neighbours != 4):
                next_state[i] = 0

        state = next_state.copy()
        states.append(state)
        print(state)
