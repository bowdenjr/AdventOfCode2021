load_data <- function(file)
{
  output <- readLines(file, n=1)
  output <- as.numeric(unlist(strsplit(output, ",")))
  return(output)
}

tick <- function(vec, ...)
{
  number_of_births <- length(vec[vec==0])
  
  vec[vec != 8] <- (vec[vec!=8]-1) %% 7
  vec[vec == 8] <- 7
  
  vec <- c(vec,rep(8,number_of_births))
  
  return(vec)
}