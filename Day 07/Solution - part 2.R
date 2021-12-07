setwd("C:/Users/JonathanBowden/Documents/02 DEVELOPMENT/01 PROJECTS/2021/AdventOfCode2021/Day 07")

source('functions.R')

vec <- load_data('AOC Day 7.txt')

optimised_output = optimise(align_part2, c(1,1e9), vec = vec)

best_pos = optimised_output$minimum
best_fuel = optimised_output$objective

print(paste("Fuel cost =", best_fuel))