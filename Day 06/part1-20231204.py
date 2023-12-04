
with open(r"Day 06\test AOC - Day 6.txt") as f:
# with open(r"Day 06\AOC - Day 6.txt") as f:
    ages = f.read().strip("\n").split(",")

ages = [int(x) for x in ages]

for i in range(256):
    num_of_new_fish = sum([x == 0 for x in ages])
    ages = [x+7 if x == 0 else x for x in ages]
    ages = [x-1 for x in ages]
    if num_of_new_fish:
        ages.extend([8]*num_of_new_fish)
    # print(ages)
    print(f"Processing day {i}")
    
print(len(ages))