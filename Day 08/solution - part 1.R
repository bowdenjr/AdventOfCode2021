setwd("D:/GitHub Repos/AdventOfCode2021/Day 08")
source('functions.R')

df <- load_data('AOC - Day 8.txt')
outputvals <- get_outputvals(df)
answer <- count_1478s(outputvals)
print(answer)


# 0 = 6
# 1 = 2 *unique
# 2 = 5
# 3 = 5
# 4 = 4 *unique
# 5 = 5
# 6 = 6
# 7 = 3 *unique
# 8 = 7 *unique
# 9 = 6


