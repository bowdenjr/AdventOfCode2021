setwd("C:/Users/JonathanBowden/Documents/02 DEVELOPMENT/01 PROJECTS/2021/AdventOfCode2021/Day 07")

source('functions.R')

vec <- load_data('test AOC Day 7.txt')

answer = align(vec,10)

print(paste("Fuel cost =", answer))