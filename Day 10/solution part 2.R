library(tidyverse)
source("functions.R")

df <- read.table('aoc day 10.txt',colClasses="character")

error_score = 0
total_score = c()

for (i in 1:nrow(df)){
  
  if (checker(df[i,]) == 0){
    score <- autocompleter(df[i,])
    total_score <- c(total_score,score)
    
  }
}

print(median(sort(total_score)))
