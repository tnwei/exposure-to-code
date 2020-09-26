.. Super secret advanced exercise : Brute force guessing
.. -----------------------------------------------------
.. Instructor notes
.. Estimated time: For students who finish 20 mins early
.. Section objective: 

.. [ ] Supply instructor-written function that takes a certain input string. Get students to loop over all possible alphanumeric digits to get the solution. To keep the function secret, the value probably has to be hashed and tucked away in a packaged module. Umm think about this later. 

Week 2: Advanced Exercises
--------------------------
Advanced exercises are designed for advanced learners that are ready to take on extra challenges. These exercises are made accessible to all after the class. Note that these exercises typically require more knowledge than what was presented in class.

Adv Exercise : ASCII animation III
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. warning :: Training wheels off! The material in today's class is not enough to solve this problem. 

Repeat ASCII Animation II, but now the ball is a tadpole! Replace the underscores with spaces to reflect the fact that tadpoles swim in water instead of climbing on land. 
::
	# Tadpole starting at the left
	print('[O                   ]')

	# Tadpole beginning to move to the right
	print('[oO                  ]')
	print('[-oO                 ]')
	print('[--oO                ]')

	# Tadpole moving to the right
	print('[      --oO          ]')

	# Tadpole arriving at the right
	print('[                --oO]')
	print('[                 --O]')
	print('[                  -O]')

	# Tadpole arrived at the right
	print('[                    O]')

	# Tadpole moving to the left
	print('[        Oo--         ]')

Adv Exercise : ASCII animation IV
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. warning :: Training wheels off! The material in today's class is not enough to solve this problem. 

Repeat ASCII Animation III, but now the tadpole swims at variable speeds in a probabilistic manner:
	* The tadpole will move 1 unit every 1 out of 4 timesteps on average. 
	* The tadpole will choose to not move every 2 out of 4 timesteps on average. 
	* The tadpole will swim a short burst of 2 units every 1 out of 4 timesteps on average. 

.. Add Markov chain