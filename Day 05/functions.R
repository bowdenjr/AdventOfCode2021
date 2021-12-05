load_data <- function(file){
  #NOTE: Manual Find and replace was used to replace the " -> " data with a ","
  # This was done to turn it into a csv. R doesn't seem to have a sensible 
  # equivalent of Python's df.str.split(',')
  output = read.csv(file,header=FALSE)
  colnames(output) <- c("x1","y1","x2","y2")
  return(output)
}

gradient <- function(x1,y1,x2,y2)
{
 output = (y2-y1)/(x2-x1)
 return(output)
}

get_only_h_and_v_lines <- function(df){
  output = subset(df,(df$x1 == df$x2 | df$y1 == df$y2))
  return(output)
}

get_h_v_and_diag_lines <- function(df){
  output = subset(df,(df$x1 == df$x2 | df$y1 == df$y2 | 
           gradient(df$x1,df$y1,df$x2,df$y2) == 1 |
           gradient(df$x1,df$y1,df$x2,df$y2) == -1))
}

get_line_points <- function(x1,y1,x2,y2)
{
  x = x1
  y = y1
  i = 0
   
  if (x1 == x2 & y1 < y2) #vertical line going up
  {
    total_points_in_line = y2 - y1 + 1
    
    output = data.frame(
      matrix(data = rep(NA,2*total_points_in_line),
             ncol = 2, nrow = total_points_in_line))
    
    while(i < total_points_in_line)
    {
      output[i+1,] = c(x1, y1 + i)
      i = i + 1 
    }
  }
  else if (x1 == x2 & y1 > y2) #vertical line going down
  {
    total_points_in_line = y1 - y2 + 1
    output = data.frame(
      matrix(data = rep(NA,2*total_points_in_line),
             ncol = 2, nrow = total_points_in_line))
    
    while(i < total_points_in_line)
    {
      output[i+1,] = c(x1, y1 - i)
      i = i + 1
    }
  }
  else if (x1 < x2 & y1 == y2) #horizontal line going left to right
  {
    total_points_in_line = x2 - x1 + 1
    output = data.frame(
      matrix(data = rep(NA,2*total_points_in_line),
             ncol = 2, nrow = total_points_in_line))
    
    while(i < total_points_in_line)
    {
      output[i+1,] = c(x1 + i, y1)
      i = i + 1
    }
  }
  else if (x1 > x2 & y1 == y2) #horizontal line going right to left
  {
    total_points_in_line = x1 - x2 + 1
    output = data.frame(
      matrix(data = rep(NA,2*total_points_in_line),
             ncol = 2, nrow = total_points_in_line))
    
    while(i < total_points_in_line)
    {
      output[i+1,] = c(x1 - i, y1)
      i = i + 1
    }
  }
  else if (x1 > x2 & gradient(x1,y1,x2,y2) == 1) #diagonal down and left
  {
    total_points_in_line = x1 - x2 + 1
    output = data.frame(
      matrix(data = rep(NA,2*total_points_in_line),
             ncol = 2, nrow = total_points_in_line))
    
    while(i < total_points_in_line)
    {
      output[i+1,] = c(x1 - i, y1 - i)
      i = i + 1
    }    
  }
  else if (x1 < x2 & gradient(x1,y1,x2,y2) == 1) #diagonal up and right
  {
    total_points_in_line = x2 - x1 + 1
    output = data.frame(
      matrix(data = rep(NA,2*total_points_in_line),
             ncol = 2, nrow = total_points_in_line))
    
    while(i < total_points_in_line)
    {
      output[i+1,] = c(x1 + i, y1 + i)
      i = i + 1
    }    
  }
  else if (x1 > x2 & gradient(x1,y1,x2,y2) == -1) #diagonal up and left
  {
    total_points_in_line = x1 - x2 + 1
    output = data.frame(
      matrix(data = rep(NA,2*total_points_in_line),
             ncol = 2, nrow = total_points_in_line))
    
    while(i < total_points_in_line)
    {
      output[i+1,] = c(x1 - i, y1 + i)
      i = i + 1
    }    
  } 
  else if (x1 < x2 & gradient(x1,y1,x2,y2) == -1) #diagonal down and right
  {
    total_points_in_line = x2 - x1 + 1
    output = data.frame(
      matrix(data = rep(NA,2*total_points_in_line),
             ncol = 2, nrow = total_points_in_line))
    
    while(i < total_points_in_line)
    {
      output[i+1,] = c(x1 + i, y1 - i)
      i = i + 1
    }    
  }
  else
  {
    print("ERROR: Only horizontal, vertical and 45 degree diagonal lines are
          implemented")
  }
    
  return(output)
}

make_grid <- function(points,size){
  
  grid = data.frame(matrix(data=rep(0,size^2),ncol = size, nrow = size))

  # plot points
  for (i in 1:nrow(points))
  {
    y = points[i,1] + 1
    x = points[i,2] + 1

    grid[x,y] = grid[x,y] + 1

  }

  grid[grid == 0] <- "."

  return(grid)
  
}

determine_danger_areas <- function(grid,threshold)
{
  output = length(grid[grid>=threshold])
  return(output)
}



