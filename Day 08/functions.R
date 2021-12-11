load_data <- function(file)
{
  output <- read.table(file)
}

get_signals <- function(df)
{
  # Split a data frame into two, based on 10 | 4 format
  output = df[,1:10]
  return(output)
}

get_outputvals <- function(df)
{
  # Split a data frame into two, based on 10 | 4 format
  output = df[,12:15]
  return(output)
}

count_1478s <- function(df)
{
  find1478_lengths = c(2,3,4,7)
  df1 <- apply(df,c(1,2),nchar)
  df2 <- df1[df1 %in% find1478_lengths]
  return(length(df2))
  
}

sort_all_elements <- function(df)
{
  # Sorts outputvals df in each element, but does not change position
  df <- apply(df,c(1,2),unlist)
  df2 <- apply(df,c(1,2),strsplit,split="")
  df3 <- apply(df2,c(1,2),unlist)
  df4 <- lapply(df3,sort) # can't use apply apparently, because R is stupid
  df5 <- lapply(df4,paste,collapse='')
  df6 <- data.frame(matrix(df5,nrow=nrow(df),ncol=ncol(df)))
  return(df6)
}

count_letters <- function(vec){
  counta = 0
  countb = 0
  countc = 0
  countd = 0
  counte = 0
  countf = 0
  countg = 0
  
  for (i in 1:length(vec))
  {
    counta = counta + (unlist(gregexpr("a",unlist(vec[i])))!=-1)
    countb = countb + (unlist(gregexpr("b",unlist(vec[i])))!=-1)
    countc = countc + (unlist(gregexpr("c",unlist(vec[i])))!=-1)
    countd = countd + (unlist(gregexpr("d",unlist(vec[i])))!=-1)
    counte = counte + (unlist(gregexpr("e",unlist(vec[i])))!=-1)
    countf = countf + (unlist(gregexpr("f",unlist(vec[i])))!=-1)
    countg = countg + (unlist(gregexpr("g",unlist(vec[i])))!=-1)
  }
  return(c(counta,countb,countc,countd,counte,countf,countg))
}

decode <- function(vec)
{
  
  if (vec == "abcdeg"){output = 0}
  else if (nchar(vec)==2){output = 1}
  else if (vec=="acdfg"){output = 2}
  else if (vec=="abcdf" | vec=="bcdef"){output = 3}
  else if (length(unlist(strsplit(vec,split="")))==4){output = 4}
  else if (vec=="bcdef"){output = 5}
  else if (vec=="bcdefg" | vec == "acdefg"){output = 6}
  else if (length(unlist(strsplit(vec,split="")))==3){output = 7}
  else if (length(unlist(strsplit(vec,split="")))==7){output = 8}
  else if (vec=="abcdef" | vec == "abcdfg"){output = 9}
  
  return(output)
  
}






# 0 = 6 missing middle
# 1 = 2 *unique use to deduce two on right - 
# 2 = 5 missing top left and bottom right
# 3 = 5 missing two on left
# 4 = 4 *unique use to deduce middle and top right
# 5 = 5 missing top right and bottom left
# 6 = 6 missing top right
# 7 = 3 *unique use to deduce top
# 8 = 7 *unique cannot use
# 9 = 6 missing bottom left


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
  
  
