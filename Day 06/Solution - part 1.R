setwd("D:/GitHub Repos/AdventOfCode2021/Day 06")

source('functions.R')

# you can model each fish as a single number that represents the number 
# days until it creates a new lanternfish

vec <- load_data('AOC - Day 6.txt')

answer <- length(Reduce(tick,1:80,init=vec))

print(paste("After",day,"days, there were",answer,"fish"))

# Giving up, I can't get the vectorisation right
