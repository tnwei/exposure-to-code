Week 3: Class Exercise solutions
================================

In-class exercise: multiple conditions for if-else
--------------------------------------------------
Code:
::
	# In-class exercise: multiple conditions for if-else (Instructor Solution)
	# Author: Safwan Zulfazli and Tan Nian Wei

    woke_up_late = True # or False
    weather = "rainy" # or "sunny"

    if woke_up_late:
        if weather == "rainy":
            print("Eat Maggi TomYam")
        else:
            print("Eat Maggi Asam Laksa")
    else:
        print("Eat At Dewan Makan")


Output:
:: 
	Eat Maggi TomYam


elif
----
Code:
::
	# In-class exercise: multiple conditions for if-else (Instructor Solution)
	# Author: Safwan Zulfazli and Tan Nian Wei
    
    item = "food waste" # Can be substituted with other items as above

    # Did you write the following?
    if item == "glass":
        print("Put glass in brown bin")
    else:
        if item == "paper":
            print("Put paper in blue bin")
        else:
            if item == "aluminium":
                print("Put aluninium cans in orange bin")
            else:
                if item == "plastic":
                    print("Put plastic in orange bin")
                else:
                        print("Food waste is not for recycling!")

    # Use elifs makes it much cleaner!
    if item == "glass":
        print("Put glass in brown bin")
    elif item == "paper":
        print("Put paper in blue bin")
    elif item == "aluminium":
        print("Put aluninium cans in orange bin")
    elif item == "plastic":
        print("Put plastic in orange bin")
    elif item == "food waste":
        print("Food waste is not for recycling!")

Output:
:: 
	Food waste is not for recycling!

In-class exercise: functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Code:
::
    # In-class exercise: functions (instructor solution)
	# Author: Safwan Zulfazli and Tan Nian Wei

    def what_int(x):
        if(x < 0):
            print(x, " is negative")
        elif(x > 0):
            print(x, " is positive")
        else:
            print(x , " is not positive or negative!")

    what_int(1)
    what_int(-3)
    what_int(0)
    
Output:
::
    1 is positive
    -3 is negative
    0 is not positive or negative!