update_flashes <- function(energy,i,j,flashes)
{
  # RECURSIVE FUNCTION
  n = nrow(energy)
  m = ncol(energy)
  energy <- get("energy",.GlobalEnv) 
  flashes <- get("flashes",.GlobalEnv) 
  total_flashes <- get("total_flashes",.GlobalEnv)

  
  if (i < 1 | i > n | j < 1 | j > m){}#Outside of bounds
  else {
    energy[i,j] <<- (energy[i,j] + 1) %% 10
    if (flashes[i,j] | (energy[i,j] < 9)){} 
    else {
      flashes[i,j] <<- TRUE
      total_flashes <<- total_flashes + 1
      update_flashes(energy,i+1,j,flashes)
      update_flashes(energy,i,j+1,flashes)
      update_flashes(energy,i-1,j,flashes)
      update_flashes(energy,i,j-1,flashes)
      update_flashes(energy,i+1,j+1,flashes)
      update_flashes(energy,i+1,j-1,flashes)
      update_flashes(energy,i-1,j+1,flashes)
      update_flashes(energy,i-1,j-1,flashes)
    }
  }
}

start_flashes <- function(energy,i,j,flashes)
{
  if (flashes[i,j]){}
  else {
    update_flashes(energy,i,j,flashes)
    return(total_flashes)
  }
}