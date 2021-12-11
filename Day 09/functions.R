load_data <- function(file)
{
  df1 <- read_table(file,col_names=FALSE)
  df2 <- apply(df1,c(1,2),as.character)
  df3 <- apply(df2,c(1,2),strsplit,split="")
  df4 <- apply(df3,c(1,2),unlist)
  df5 <- data.frame(matrix(df4,nrow=nrow(df1),ncol=nchar(df2[1,1]),byrow=TRUE))
  output <- apply(df5,c(1,2),as.numeric)

  return(output)
}

depth_first_search <- function(df,i,j,seen,size)
{
  # RECURSIVE FUNCTION
  n = nrow(df)
  m = ncol(df)
  seen <- get("seen",.GlobalEnv)
  
  if (i < 1 | i > n | j < 1 | j > m){
    
    # print("OW")
    
  } else {
    
    if ( seen[i,j] == TRUE | df[i,j] == 9 ) {
      
      # print("Seen or wall")
      
      } else {
        
        seen[i,j] <<- TRUE
        size <<- get("size",.GlobalEnv) + 1
        depth_first_search(df,(i+1),j,seen,size)
        depth_first_search(df,(i-1),j,seen,size)
        depth_first_search(df,i,(j+1),seen,size)
        depth_first_search(df,i,(j-1),seen,size)
      } 
  }
}

flood_sum <- function(df,i,j,seen)
{
  size <<- 0
  if (seen[i,j]){
    #return nothing
  } else {
    output = depth_first_search(df,i,j,seen,size)
    return(get("size",.GlobalEnv))
  }
}



