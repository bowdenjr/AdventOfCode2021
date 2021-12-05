source('functions.R')

print('#######################################################################')
print('#######################################################################')
print('#######################################################################')

bingo_numbers <- load_bingo_numbers('aoc day 4.txt')
bingo_cards <- load_bingo_cards('aoc day 4.txt')
winners = c()
last_loser=-1
last_loser_score =-1

matches = data.frame(matrix(data=rep(0,5*nrow(bingo_cards)),ncol = 5, 
                            nrow = nrow(bingo_cards)))

total_number_of_cards = nrow(bingo_cards)/5

for (i in 1:length(bingo_numbers)){
  
  print(paste("Draw",i,"- Bingo number is",bingo_numbers[i]))
  matches = matches + 1*(bingo_cards == bingo_numbers[i])
  
  for (j in 1:total_number_of_cards){
    
    if (j %in% winners){next}
    
    card = get_card(bingo_cards,j)
    card_matches = get_card(matches,j)
    # print(card_matches)
    
    if (check_winning_condition(card_matches)){
      print(paste("Winning card",j,"score =",
                  calc_winning_score(card,card_matches,bingo_numbers[i])))
      #remove j from the check of winning condition check list
      winners = c(winners,j)
      
      if (last_loser!=-1) { # This is the last losers win 
        last_loser_score = calc_winning_score(
          card,card_matches,bingo_numbers[i])
      }

    } else {
      if (length(winners) == (total_number_of_cards - 1)){
        last_loser = j
        }
    }
  }
  
  if (last_loser_score!=-1){
    print(paste("Last loser was",last_loser,"score =",last_loser_score))
    break}
  
}

