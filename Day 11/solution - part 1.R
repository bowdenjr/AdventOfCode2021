source('functions.R')

df = readLines("aoc day 11.txt")
energy = array(c(rep(0,10),rep(0,10)),dim=c(10,10))
flashes = array(c(rep(0,10),rep(0,10)),dim=c(10,10))

#load initial data
for (i in 1:10)
{
  energy[i,] = t(as.numeric(unlist(strsplit(df[i],""))))
}

num_of_steps = 500
total_flashes = 0

for (step in 1:num_of_steps)
{
  # Reset flash counter for this step
  flashes = array(c(rep(FALSE,10),rep(FALSE,10)),dim=c(10,10)) #reset flash counter
  
  for (i in 1:10)
  {
    for (j in 1:10)
      {
        start_flashes(energy,i,j,flashes)
      }
  }
  
  # Set all flashing octopuses to zero
  energy[flashes] <- 0
  if (sum(energy)==0)
    {
    print(paste("There is a sync at",step))
    break
    }
  
  
}

