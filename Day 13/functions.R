fold <- function(points,on,direction){
  # e.g. fold(points,7,y)
  if (direction == "y") {
    for (point in 1:nrow(points)) {
      if (points[point,2] >= on){
        points[point,2] <-  (2 * on) - points[point,2]
      }
    }
  } else {
    for (point in 1:nrow(points)){
      if (points[point,1] > on){
        points[point,1] <- (2 * on) - points[point,1]
      }
    }
  }
  return(points)
}
 
remove_duplicates <- function(points){
  non_dupes <- points[!duplicated(paste(as.character(points[,1]),as.character(points[,2])))]
  dupe_count <- (length(points)-length(non_dupes))
  output <- matrix(non_dupes,nrow=(length(points)-dupe_count)/2,ncol=2,byrow=FALSE)
  return(output)
}