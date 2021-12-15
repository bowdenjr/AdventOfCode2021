source('functions.R')

file <- 'aoc day 14.txt'

template <- as.character(read.table(file,nrows=1))
sequences <- read.fwf(file,skip=2,widths=c(2,4,1))[,c(1,3)]
answer = template # initialise

for (i in 1:40){
  answer = insert_letters(answer,sequences)  
  print(paste("running step",i))
}

mrc = most_repeated_character(answer)
lrc = least_repeated_character(answer)

print(paste("Answer =",mrc-lrc))

