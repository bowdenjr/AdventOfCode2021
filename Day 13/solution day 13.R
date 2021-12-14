source('functions.R')

df <- read.table('aoc day 13.txt')

ptlength <- which(df=="fold")[1]-1

points <- df[1:ptlength,]
points <- matrix(as.numeric(unlist(strsplit(points,","))),nrow=ptlength,ncol=2,byrow=TRUE)

# PART 1

# folded_points <- fold(points,655,"x")
# p1ans <- length(remove_duplicates(folded_points))/2
# print(p1ans)


# PART 2
points <- remove_duplicates(fold(points,655,"x"))
points <- remove_duplicates(fold(points,447,"y"))
points <- remove_duplicates(fold(points,327,"x"))
points <- remove_duplicates(fold(points,223,"y"))
points <- remove_duplicates(fold(points,163,"x"))
points <- remove_duplicates(fold(points,111,"y"))
points <- remove_duplicates(fold(points,81,"x"))
points <- remove_duplicates(fold(points,55,"y"))
points <- remove_duplicates(fold(points,40,"x"))
points <- remove_duplicates(fold(points,27,"y"))
points <- remove_duplicates(fold(points,13,"y"))
points <- remove_duplicates(fold(points,6,"y"))

plot(points)

