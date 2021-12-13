library(tidyverse)
source("functions.R")

df <- read.table('aoc day 10.txt',colClasses="character")

error_score = 0

for (i in 1:nrow(df)){
  error_score = c(error_score,checker(df[i,]))
}

print(sum(error_score))

