source('functions.R')

bingo_numbers <- load_bingo_numbers('aoc day 4.txt')
bingo_cards <- load_bingo_cards('aoc day 4.txt')
winner = FALSE

matches = data.frame(matrix(data=rep(0,5*nrow(bingo_cards)),ncol = 5, nrow = nrow(bingo_cards)))

for (i in 1:length(bingo_numbers)){
# for (i in 1:12){
  
  print(paste("Draw",i,"- Bingo number is",bingo_numbers[i]))
  matches = matches + 1*(bingo_cards == bingo_numbers[i])
  
  for (j in 1:(nrow(bingo_cards)/5)){
    
    card = get_card(bingo_cards,j)
    card_matches = get_card(matches,j)
    # print(card_matches)
    
    if (check_winning_condition(card_matches)){
      print(paste("Winning card",j,"score =",calc_winning_score(card,card_matches,bingo_numbers[i])))
      winner = TRUE
    } else {
      winner = FALSE
    }
    
    if(winner){break}
  }

  if(winner){break}
  
}

