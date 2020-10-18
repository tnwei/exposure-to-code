Week 5: Advanced Exercises
==========================
Advanced exercises are designed for advanced learners that are ready to take on extra challenges. These exercises are made accessible to all after the class. Note that these exercises typically require more knowledge than what was presented in class.  

.. .. warning :: Training wheels off! The material in today's class is not enough /to solve this problem. 

Adv Exercise: 1D fluid simulation by cellular automata
------------------------------------------------------
This week, we've learnt that we program cellular automata by specifying rules that will be run by each cell. We will use this property to write a 1D fluid simulation. 

Explanation of logic
^^^^^^^^^^^^^^^^^^^^
Use a 1D array to represent the height of water columns in a tank, with each cell representing a column of water in the tank. We will specify rules so that the water will be passed between columns naturally. We will iterate the whole logic over a range of timesteps. At each timestep, we will iterate through each cell and calculate the height of the cell at the next timestep. 

The logic is simple to put in words. We check the difference in flow potential for each cell to decide how much fluid flows between the cells in the next timestep. We calculate this by taking the difference between potential energy from height of water, and also the difference in fluid momentum between cells. 

Instructions
^^^^^^^^^^^^
1. Set `N = 15`, `GRAV = 2`, and `DAMP = 0.5`. `N` represents grid length, `GRAV` represents the gravity multiplier, and `DAMP` represents the damping coefficient for fluid momentum.
2. Initialize four `numpy` arrays called `water`, `mo_left`, `mo_right`, and `dwater`, with length set to `N=15`.
	+ Initialize `water` with the values `[100, 100, 100, 80, 70, 60, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20]`
	+ Initialize the other arrays with all zeros. 
	+ `water` will be used to store the height of the water column.
	+ `mo_left` will store the flow of each cell to its neighbor on the left in the previous timestep, representing flow momentum to the left. 
	+ `mo_right` will store the flow of each cell to its neighbor on the right in the previous timestep, representing flow momentum to the right. 
	+ `dwater` stores the change in water height for the next timestep.
3. Write a for-loop that iterates from 1 to N-1, excluding 0 and N which represents the boundary cells. In this for-loop, calculate for the current cell:
	+ `fp_left`: GRAV * (current cell height - left cell height) + (current cell leftward momentum - left cell rightward momentum)
	+ `fp_right`: GRAV * (current cell height - right cell height) + (current cell rightward momentum - right cell leftward momentum)
	+ `flow_left` and `flow_right`: `fp_left` / 4 and `fp_right` / 4
	+ If `flow_left` is larger than the height of the current cell divided by 4, set it to that. 
	+ Do the same for `flow_right`. 
4. Still in the same for-loop, assign the flows for the next timestep.
	+ If `flow_left` is positive i.e. larger than zero, update `dwater`, `mo_left` and `mo_right` for the cells:
		+ Add `flow_left` to `dwater` of the left cell 
		+ Subtract `flow_left` from `dwater` of the current cell
		+ Subtract `DAMP` multiplied by `flow_left` to `mo_left` of current cell
		+ Add `DAMP` multiplied by `flow_left` to `mo_right` of the left cell. 
	+ If `flow_right` is positive i.e. larger than zero, do similar:
		+ Add `flow_right` to `dwater` of the right cell 
		+ Subtract `flow_right` from `dwater` of the current cell
		+ Subtract `DAMP` multiplied by `flow_right` to `mo_right` of current cell
		+ Add `DAMP` multiplied by `flow_right` to `mo_left` of the left cell. 
5. After this for-loop is done, add code after it for our boundary cells.
	+ For the left-most cell, copy-paste the contents of the loop except for everything that has to do with having a cell on the left. 
	+ For the right-most cell, copy-paste the contents of the loop except for everything that has to do with having a cell on the right. 
6. Check momentum of boundary cells reflecting off the walls.
	+ if `mo_left` of leftmost cell is positive, multiply it by -1.
	+ if `mo_right` of rightmost cell is positive, multiply it by -1.
7. Update `water` by adding to it `dwater`.
8. Write a bigger for-loop that wraps everything in steps 3 to 7, and iterate over 200 timesteps. Create a variable called `water_stored`, and initialize it to be an empty list outside this bigger for-loop. At the end of the loop, append `water` to it. This will serve to store the heights of water over time. 
9. If you can get to step 8, ask the instructor for code to visualize this.

