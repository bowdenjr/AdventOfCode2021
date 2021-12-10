setwd("D:/GitHub Repos/AdventOfCode2021/Day 08")
source('functions.R')

df <- load_data('test AOC - Day 8.txt')
outputvals <- get_outputvals(df)
signals <- get_signals(df)



df = signals


# decode the signals, get a vector of length 10 to act as the mapping
# the vector will be c("abcdfg","ab","abcefg",...) where each element is sorted alpha and each element maps to it's index digit

# identify_digits_from_signals(signals[1,])

output = rep(-1,10)
char5 = df[1,][nchar(df[1,])==5]
char6 = df[1,][nchar(df[1,])==6]

for (i in 1:ncol(df))
{
  # Can deduce 1,4 7 and 8 immediately
  if (nchar(df[1,i])==2){output[i] = 1}
  else if (nchar(df[1,i])==4){output[i] = 4}
  else if (nchar(df[1,i])==3){output[i] = 7}
  else if (nchar(df[1,i])==7){output[i] = 8}
}

counta = 0
countb = 0
countc = 0
countd = 0
counte = 0
countf = 0
countg = 0

remiaing_signals = df[1,][output==-1]

for (i in 1:length(remiaing_signals))
{
  counta = counta + (unlist(gregexpr("a",unlist(remiaing_signals[i])))!=-1)
  countb = countb + (unlist(gregexpr("b",unlist(remiaing_signals[i])))!=-1)
  countc = countc + (unlist(gregexpr("c",unlist(remiaing_signals[i])))!=-1)
  countd = countd + (unlist(gregexpr("d",unlist(remiaing_signals[i])))!=-1)
  counte = counte + (unlist(gregexpr("e",unlist(remiaing_signals[i])))!=-1)
  countf = countf + (unlist(gregexpr("f",unlist(remiaing_signals[i])))!=-1)
  countg = countg + (unlist(gregexpr("g",unlist(remiaing_signals[i])))!=-1)
}

if (nchar(df[1,i])==6)
{
# 0 will be missing a letter that all remaining digits have

# 6 will only have one letter in common with 1 and is length 6
  
# 9 is the last one with length 6
  
  
}  
  




# map to digits 



# df_to_decode <- sort_all_elements(outputvals)
# 
# unlist_df <- apply(df_to_decode,c(1,2),unlist)
# decoded_df <- apply(unlist_df,c(1,2),decode)

# print(paste("There are",answer,"instances of 1,4,7 or 8"))

# 0 - combinations of "abcdeg"
# 1 - combinations of "cg"
# 2 - combinations of "acdfg"
# 3 - combinations of "abcdf"
# 4 - combinations of "cefg"
# 5 - combinations of "bcdef"
# 6 - combinations of "bcdefg"
# 7 - combinations of "bcg"
# 8 - combinations of "abcdefg"
# 9 - combinations of "abcdef"


