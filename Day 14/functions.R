insert_letters <- function(template,sequences){
  
  output = c()
  pairs = split_into_pairs(template)
  
  for (pair in pairs){
    # Look for pairs in string
    
    if (pair %in% sequences[,1]){
      pair_to_insert = middle_insert(pair,sequences[,2][sequences[,1]==pair])
      if (length(output) != 0){
        output = c(output,substring(pair_to_insert,2,nchar(pair_to_insert)))
      } else {
        output = c(output,pair_to_insert)
      }
    } else {
      output = c(output,substring(pair,2,3))
    }
     
  }
  
  
  return(paste(output,collapse=""))
}

middle_insert <- function(letters,fill){
  
  x = substring(letters,1,1)
  z = substring(letters,2,2)
  return(paste(c(x,fill,z),collapse=""))
  
}

split_into_pairs <- function(template){
  
  char = 1
  output = c()
  
  while (char < nchar(template)){
    pair = substring(template,char,char+1)
    output = c(output, pair)
    char = char + 1
  }
  return(output)
}

most_repeated_character <- function(x) {
  
  tab <- table(strsplit(x,""))
  
  if (sum(tab) == length(tab)){ # if it's a tie, return a random one
    output = max(tab)
  } else {
    output = max(tab)
  }
  
  return(output)

}

least_repeated_character <- function(x) {
  
  tab <- table(strsplit(x,""))
  
  if (sum(tab) == length(tab)){ # if it's a tie, return a random one
    output = min(tab)
  } else {
    output = min(tab)
  }
  
  return(output)

}

