library(tidyverse)
source('functions.R')

################################################################################
# PART 1
################################################################################

df <- load_data('aoc day 9.txt')
# Was helpful for part 2: https://www.youtube.com/watch?v=VuiXOc81UDM

n = nrow(df)
m = ncol(df)

low_points <- data.frame(matrix(rep(-1,n*m),nrow=n,ncol=m))

for (i in 1:n) {
  for (j in 1:m) {
    if (i == 1 && j == 1) {
      if ((df[1,1] < df[1,2]) && (df[1,1] < df[2,1])){
        low_points[i,j] = df[i,j]}
    } else if (i == n && j == 1) {
      if ((df[n,1] < df[n-1,1]) && (df[n,1] < df[n,2])){
        low_points[i,j] = df[i,j]}
    } else if (i == 1 && j == m) {
      if ((df[1,m] < df[1,m-1]) && (df[1,m] < df[2,m])){
        low_points[i,j] = df[i,j]}
    } else if (i == n && j == m) {
      if ((df[n,m] < df[n,m-1]) && (df[n,m] < df[n-1,m])){
        low_points[i,j] = df[i,j]}
    } else if (i == 1) { #top edge
      if ((df[i,j] < df[1,j-1]) && (df[i,j] < df[1,j+1]) && (df[i,j] < df[i+1,j])){
        low_points[i,j] = df[i,j]}
    } else if (j == 1) { #left edge
      if ((df[i,j] < df[i-1,j]) && (df[i,j] < df[i+1,j]) && (df[i,j] < df[i,j+1])){
        low_points[i,j] = df[i,j]}
    } else if (i == n) { #bottom edge
      if ((df[i,j] < df[i-1,j]) && (df[i,j] < df[i,j+1]) && (df[i,j] < df[i,j-1])){
        low_points[i,j] = df[i,j]}
    } else if (j == m) { #right edge
      if ((df[i,j] < df[i-1,j]) && (df[i,j] < df[i+1,j] )&& (df[i,j] < df[i,j-1])){
        low_points[i,j] = df[i,j]}
    } else { # non edge point
      if ((df[i,j] < df[i-1,j]) && (df[i,j] < df[i+1,j]) && (df[i,j] < df[i,j-1]) && (df[i,j] < df[i,j+1])){
        low_points[i,j] = df[i,j]}
    }
  }
}

low_points <- low_points + 1 

answer <- sum(low_points[low_points!=-1])
print(paste("Part 1 answer is =",answer))

################################################################################
# PART 2
################################################################################
seen <<- data.frame(matrix(rep(FALSE,n*m), nrow=n, ncol=m))

flood_sums = c()

for (i in 1:n){
  for (j in 1:m){
    if (low_points[i,j]!=0){
      flood_sums = c(flood_sums,flood_sum(df,i,j,seen))
    }
  }
}

answer2 = prod(tail(sort(flood_sums),3))

print(paste("Part 2 answer is =",answer2))

