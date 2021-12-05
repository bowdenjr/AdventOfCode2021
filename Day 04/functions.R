
load_bingo_numbers <- function(file){
  #The first row is our vector of bingo numbers
  # bingo_numbers <- strsplit(readLines(file,n=1),"")
  bingo_numbers <- read.csv(file,sep=",",nrows=1,header=FALSE)
  return(as.numeric(bingo_numbers))
}

load_bingo_cards <- function(file){
  #After the first row there are arrays of bingo cards separate by space rows
  read.table(file,skip=1)
  
}

get_card <- function(df,card_number){  
  # get the right subset
  card_number = card_number - 1
  row = (card_number * 5) + 1 
  card = df[row:(row+4),]
  return(card)
}

check_winning_condition <- function(card_matches){

  #check the sums of all rows and cols
  if((max(rowSums(card_matches))==5) | (max(colSums(card_matches))==5)){
    output = TRUE
  } else {
    output = FALSE
  }
  
  return(output)

}

calc_winning_score <- function(card,card_matches,last_number){
  score = sum(card * (1-card_matches)) * last_number
  return(score)
}

