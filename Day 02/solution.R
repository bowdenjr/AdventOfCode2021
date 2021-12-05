# PART ONE

df <- read.table('../input/aoc-day-2/AOC day 2.txt')
colnames(df) <- c("direction","amount")

hpos = 0
vpos = 0

df$amount[df$direction == "up"] = df$amount[df$direction == "up"] * -1 

hmov = sum(df$amount[df$direction == "forward"])
hpos = hpos + hmov

vmov = sum(df$amount[df$direction == "up"],df$amount[df$direction == "down"])
vpos = vpos + vmov

print(paste("Answer = ",vpos * hpos))

# PART TWO
df <- read.table('../input/aoc-day-2/AOC day 2.txt')
colnames(df) <- c("direction","amount")

df$amount[df$direction == "up"] = df$amount[df$direction == "up"] * -1 

df$aim = rep(0,nrow(df))
df$hpos = rep(0,nrow(df))
df$vpos = rep(0,nrow(df))

# not sure if all of this can be vectorised...?
for (row in 1:nrow(df)){
  
  if (row == 1){
    
    #HPOS
    if (df$direction[row] == "forward"){
      df$hpos[row] = df$amount[row]}
    else {
      df$hpos[row] = df$hpos[row-1]}
    
    #VPOS & AIM    
    if (df$direction[row] == "down"){
      df$aim[row] = df$amount[row]}
    else if (df$direction[row] == "up"){
      df$aim[row] = df$amount[row]}
    else {
      df$aim[row] = 0} 
  
  } else {
    
    #HPOS
    if (df$direction[row] == "forward"){
      df$hpos[row] = df$hpos[row-1] + df$amount[row]}

    else {
      df$hpos[row] = df$hpos[row-1]}
    
    #VPOS & AIM
    if (df$direction[row] == "down"){
      df$vpos[row] = df$vpos[row-1] + df$amount[row]
      df$aim[row] = df$aim[row-1] + df$amount[row]}
    else if (df$direction[row] == "up"){
      # df$vpos[row] = df$vpos[row-1] + df$amount[row]
      df$aim[row] = df$aim[row-1] + df$amount[row]}
    else {
      df$vpos[row] = df$vpos[row-1]
      df$aim[row] = df$aim[row-1]}
    
    if (df$aim[row] != 0 & df$direction[row] == "forward"){
      df$vpos[row] = df$vpos[row] + (df$aim[row] * df$amount[row])}
    else {
      df$vpos[row] = df$vpos[row-1]}
  }

}

print(paste("Answer = ",df$hpos[nrow(df)] * df$vpos[nrow(df)]))
