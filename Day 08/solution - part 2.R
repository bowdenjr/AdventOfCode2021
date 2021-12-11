setwd("D:/GitHub Repos/AdventOfCode2021/Day 08")
source('functions.R')

df <- load_data('AOC - Day 8.txt')
outputvals <- get_outputvals(df)
signals <- get_signals(df)
decoded <- data.frame(matrix(rep(0,nrow(outputvals)*ncol(outputvals)),nrow = nrow(outputvals),ncol = ncol(outputvals)))
df = signals

# decode the signals, get a vector of length 10 to act as the mapping
# the vector will be c("abcdfg","ab","abcefg",...) where each element is 
# sorted alpha and each element maps to it's index digit


for (i in 1:nrow(signals))
{
  
  output = rep(-1,10) # the mapping of signals to digits
  
  for (j in 1:ncol(df))
  {
    # Can deduce 1,4 7 and 8 immediately
    if (nchar(df[i,j])==2){output[j] = 1}
    else if (nchar(df[i,j])==4){output[j] = 4}
    else if (nchar(df[i,j])==3){output[j] = 7}
    else if (nchar(df[i,j])==7){output[j] = 8}
  }
  
  remiaing_signals = df[i,][output==-1]
  letter_counts <- count_letters(remiaing_signals)
  
  # 0 will be missing a letter that all remaining digits have
  # where countx is 5 AND it appears in all 5char strings
  
  for (len6remaining in remiaing_signals[nchar(remiaing_signals)==6])
  {
    for (x in c('a','b','c','d','e','f','g')[(letter_counts==5)])
    {
      if (unlist(gregexpr(x,len6remaining))==-1)
      {
        output[(df[i,]==len6remaining)] = 0
      }
    }
  }
  
  remiaing_signals = df[i,][output==-1]
  
  for (len6remaining in remiaing_signals[nchar(remiaing_signals)==6])
  {
    found = 0
    # 6 will only have one letter in common with 1 and is length 6
    # Loop through letters for 1
    for (x in unlist(strsplit(unlist(signals[i,][output==1]),split="")))
    {
      if (unlist(gregexpr(x,len6remaining))!=-1)
      {
        found = found + 1  
      }
    }
    if (found == 1)
    {
      output[(df[i,]==len6remaining)] = 6    
    }
  }
  remiaing_signals = df[i,][output==-1]
  
  # 9 is the last one with length 6
  output[df[i,]==unlist(remiaing_signals[nchar(remiaing_signals)==6])] <- 9
  
  remiaing_signals = df[i,][output==-1]
  
  # 3 has is the only one with all the letters from 7
  for (remaining in remiaing_signals)
  {
    found = 0
    for (x in unlist(strsplit(unlist(df[i,][output==7]),split="")))
    {
      if (unlist(gregexpr(x,remaining))!=-1)
      {
        found = found + 1  
      }    
    }
    if (found == 3)
    {
      output[(df[i,]==remaining)] = 3
    }
  }
  
  remiaing_signals = df[i,][output==-1]
  # 5 will differ by one letter from 9
  #find the letter that it is 9 and 2, but not in 5
  
  for (remaining in remiaing_signals)
  {
    found = 0
    for (x in unlist(strsplit(unlist(df[i,][output==9]),split="")))
    {
      if(unlist(gregexpr(x,remaining))!=-1)
      {
        found = found + 1 
      }
    }
    if (found==5)
    {
      output[(df[i,]==remaining)] = 5
    }
  }
  
  # 2 is the last one
  remiaing_signals = df[i,][output==-1]
  output[df[i,]==unlist(remiaing_signals[nchar(remiaing_signals)==5])] <- 2
  
  apply(outputvals,c(1,2),unlist)
  
  signals = sort_all_elements(signals)
  
  for (j in 1:ncol(outputvals[i,]))
  {
    outputvals[i,j] = paste(sort(unlist(strsplit(as.character(outputvals[i,j]),""))),collapse="")
    decoded[i,j] = output[which(signals[i,]==outputvals[i,j])]
  }

}

answers<-as.numeric(apply(decoded,1,paste,collapse = ""))
print(paste("Answer is",sum(answers)))
            