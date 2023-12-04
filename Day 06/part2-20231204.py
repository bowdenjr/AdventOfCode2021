
# with open(r"Day 06\test AOC - Day 6.txt") as f:
with open(r"Day 06\AOC - Day 6.txt") as f:
    data = f.read().strip("\n").split(",")

ages = {0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0}

for value in data:
    ages[int(value)] += 1

"""
Instead of storing each fish, store a dict total of them
STORE THE TOTALS
"""

for i in range(256):
    
    # Add new fish
    ages[9] += ages[0]
    
    # Set fish timer 0 to 7, before reducing
    ages[7] += ages[0]
    ages[0] = 0
    
    # Decrease fish timers
    for key, value in ages.items():
        if key != 0:
            if ages[key] > 0:
                ages[key-1] += ages[key]
                ages[key] = 0
    
    total_fish = sum([x for x in ages.values()])
    print(f"Day {i+1} completed")

print(total_fish)

"""
Initial
ages = {0:0, 1:1, 2:1, 3:2, 4:1, 5:0, 6:0, 7:0, 8:0, 9:0}

Day 1 step 1 (add new fish) (NONE)
ages = {0:0, 1:1, 2:1, 3:2, 4:1, 5:0, 6:0, 7:0, 8:0, 9:0}

Day 1 step 2 (decrease fish)
ages = {0:1, 1:1, 2:2, 3:1, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0}

Day 2 step 1 (add new fish)
ages = {0:1, 1:1, 2:2, 3:1, 4:0, 5:0, 6:0, 7:0, 8:0, 9:1}

Day 2 step 2 (decrease fish)
ages = {0:1, 1:2, 2:1, 3:0, 4:0, 5:0, 6:1, 7:0, 8:1, 9:0}


"""
    
#     num_of_new_fish = sum([x == 0 for x in ages])
#     num_of_fish += num_of_new_fish
    
#     ages = [x+7 if x == 0 else x for x in ages]
#     ages = [x-1 for x in ages]
    
#     # if num_of_new_fish:
#     #     ages.extend([8]*num_of_new_fish)
        
#     print(num_of_fish)


# print(len(ages))