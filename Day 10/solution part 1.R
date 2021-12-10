library(tidyverse)

df <- readLines('test aoc day 9.txt')
totalchars <- sum(nchar(df))

df <- strsplit(df, "")

# Order of stored chars
# "(","[","{","<",

# ")","]","}",">"
totals = list()


# count the number of instances, +1 on encountering left and -1 on encountering right

for (i in 1:length(df))
{
  print(paste("start row",i))
  print("( [ { <")
  chunk_count = rep(0,4)
  
  for (j in 1:length(df[[i]]))
  {
    x = df[[i]][j]
    
    if (x == "(") {
      chunk_count[1] = chunk_count[1] + 1
    }
    else if (x == "[") {
      chunk_count[2] = chunk_count[2] + 1
    }
    else if (x == "{") {
      chunk_count[3] = chunk_count[3] + 1
    }
    else if (x == "<") {
      chunk_count[4] = chunk_count[4] + 1
    }
    else if (x == ")") {
      chunk_count[1] = chunk_count[1] - 1
    }
    else if (x == "]") {
      chunk_count[2] = chunk_count[2] - 1
    }
    else if (x == "}") {
      chunk_count[3] = chunk_count[3] - 1
    }
    else if (x == ">") {
      chunk_count[4] = chunk_count[4] - 1
    }
    
    
    print(c(chunk_count[1],chunk_count[2],chunk_count[3],chunk_count[4],sum(chunk_count)))
  
      
  totals[[i]] = chunk_count
  }
  
}




