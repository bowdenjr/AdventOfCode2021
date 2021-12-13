pop <- function(x) (assign(as.character(substitute(x)), x[-length(x)], parent.frame()))

checker <- function(line){
  
  line = unlist(strsplit(line,""))
  opening = c("(","[","{","<")
  stack = c()
  
  for (i in 1:length(line))
  {
    
    if (line[i] %in% opening)
    {
      #Put the opening character into the stack
      stack = c(stack,line[i])
    }
    else 
    {
      # Line[i] must therefore be closing
      # Therefore stack will have characters in it
      current_char = tail(stack,1)
      stack = pop(stack)
      
      if (current_char == '(')
      {
        if(line[i] != ')') return(error_scorer(line[i]))
      }
      else if (current_char == '[')
      {
        if(line[i] != ']') return(error_scorer(line[i]))
      }
      else if (current_char == '{')
      {
        if(line[i] != '}') return(error_scorer(line[i]))
      }
      else if (current_char == '<')
      {
        if(line[i] != '>') return(error_scorer(line[i]))
      }
    }
  }
  
  return(0)
  
  # if (length(stack) != 0) 
  # {
  #   return(FALSE)
  # }
  # else return(TRUE)
    
}

error_scorer <- function(char)
{
  switch(char,
         ')'= 3,
         ']'= 57,
         '}'= 1197,
         '>'= 25137)
}

get_closing_char <- function(char)
{
    switch(char,
           '('= ')',
           '['= ']',
           '{'= '}',
           '<'= '>')
}

autocompleter <- function(line){
  
  line = unlist(strsplit(line,""))
  opening = c("(","[","{","<")
  stack = c()
  complete = c()
  score = 0
  
  for (i in 1:length(line))
  {
    if (line[i] %in% opening)
    {
      #Put the opening character into the stack
      stack = c(stack,line[i])
    }
    else 
    {
      # Line[i] must therefore be closing
      # Therefore stack will have characters in it
      current_char = tail(stack,1)
      stack = pop(stack)

    }
  }
  # browser()
  if(i==length(line)){
  
    while (length(stack)>0){
      complete = c(complete,get_closing_char(tail(stack,1)))
      stack = pop(stack)
    }
    
    for (j in 1:length(complete)){
      score_val = switch(complete[j],')'= 1,']'= 2,'}'= 3,'>'= 4)
      score = (score*5) + score_val
    }
    
  }
  
  return(score)
    
  
}
  

    
