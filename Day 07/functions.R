load_data <- function(file)
{
  output <- readLines(file, n=1)
  output <- as.numeric(unlist(strsplit(output, ",")))
  return(output)
}

align <- function(vec,position)
{
  output = abs(vec - as.integer(position))
  output = sum(output)
  return(output)
}

align_part2 <- function(vec,position)
{
  output = abs(vec - as.integer(position))
  output = choose(output+1,2)
  output = sum(output)
  return(output)
}