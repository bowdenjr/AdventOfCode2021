most_repeated_character <- function(x) {
  
  # if (length(x) == 2) browser()
  
  tab <- table(x)
  
  if (sum(tab) == length(tab)){ # if it's a tie, return a random one
    output = -1}
  else {
    output = names(tab)[tab == max(tab)]
  }
  
  return(output)

}

are_repeats_allowed <- function(path) {
  
  if (length(path[is_lowercase(path)])>0){ # 
    
    mrc = most_repeated_character(path[is_lowercase(path)]) # 
    
    if (length(path[path==mrc])>=2 && mrc!=-1){
      
      # There are now 2 instances of a lower class letter
      are_repeats_allowed = FALSE
    } else {
      are_repeats_allowed = TRUE
    }
  } else {
    are_repeats_allowed = TRUE
  }
  
  return(are_repeats_allowed)
}


find_paths <- function(graph,start,end,path = c()){
  
  if (is.null(graph[[start]])) return(NULL)
  
  # add next node to path so far
  path <- c(path, start)
  paths <- get("paths",.GlobalEnv)
  seen <- get("seen",.GlobalEnv)
  
  
  # browser()
  # if end is reached return path
  if (start == end) {
    paths <<- rbind(paths,paste(path,collapse=",")) #add to list of paths
    seen <<- c() #reset seen
    return(path)
  }
  
  repeats_allowed <- are_repeats_allowed(path)
  
  lowercase_seens = c(seen[is_lowercase(seen)],"start")
  # browser()
  # Remove see from graph[[start]]
  if (repeats_allowed){
    nodes = graph[[start]]
  } else {
    nodes = graph[[start]][!(graph[[start]] %in% lowercase_seens)]
  }
  # if("d" %in% nodes) browser()
  
  # loop through all nodes linked from the current node (given in start)
  for (node in nodes) {
    
    # update seen
    seen <<- c(unique(seen),node)

    # node_is_lower <- node != toupper(node) # PART 1 SOLUTION
    # if (!(node_is_lower && (node %in% path))) { # PART 1 SOLUTION
    
    # recursively call function for finding shortest path with node as start and assign it to newpath
    if (node != "start"){
      # print(paste("creating new path with",node))
      newpath <- find_paths(graph, node, end, path)
    }
  }
  
  return(paths)
}

is_lowercase <- function(x){
  
  x == tolower(x)
  
}
