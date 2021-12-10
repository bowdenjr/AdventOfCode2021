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
  output = 0
  
  if (i < 1 | i > n | j < 1 | j > m){
    
    # Do nothing
    
  } else {
    
    if ( seen[i,j] == TRUE | df[i,j] == 9 ) {
      
      # Do nothing
      
      } else {
        
        print(paste("Counting at",i,j))
        seen[i,j] = TRUE
        size = size + 1
        print(paste("Size is now",size))
        
        print("Going down")
        depth_first_search(df,(i+1),j,seen,size)
        print("Going up")
        depth_first_search(df,(i-1),j,seen,size)
        print("Going right")
        depth_first_search(df,i,(j+1),seen,size)
        print("Going left")
        depth_first_search(df,i,(j-1),seen,size)
        
        print(paste("Size is now",size))
        
        return(size)
      } 
  }
}

flood_sum <- function(df,i,j,seen,size)
{
  size = 0
  if (seen[i,j]){
    #return nothing
  } else {
    output = depth_first_search(df,i,j,seen,size)
    print(output)
    return(output)
  }
}



