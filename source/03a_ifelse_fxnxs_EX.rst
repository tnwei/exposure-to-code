.. Instructor notes
.. Exercises that synergize w/ existing exercises in the class will be great! I see implementing a lotta if/elses and using pycosat for problems that can be SAT solvers to be a great example of difficult progression. 

Adv Exercise: Morse code writer
-------------------------------


Adv Exercise : Solving Einstein's riddle
----------------------------------------
.. warning :: Training wheels off! The material in today's class is not enough to solve this problem. 

Adv Exercise : Solving sudoku with pycosat
------------------------------------------
.. warning :: Training wheels off! The material in today's class is not enough to solve this problem. 
.. Message: pycosat can solve problems that can be framed as satisfiability problems! 





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
---------------------------------
.. warning :: Training wheels off! The material in today's class is not enough to solve this problem. 

Repeat ASCII Animation III, but now the tadpole swims at variable speeds:
	* The tadpole will move 1 unit every 1 out of 4 timesteps on average. 
	* The tadpole will choose to not move every 2 out of 4 timesteps on average. 
	* The tadpole will swim a short burst of 2 units every 1 out of 4 timesteps on average. 
