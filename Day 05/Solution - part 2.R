setwd("D:/GitHub Repos/AoC 2021/Day 5/")

source('functions.R')

df <- load_data('test AOC Day 5.txt')
df_hvd <- get_h_v_and_diag_lines(df)
points <- data.frame()

for (i in 1:nrow(df_hvd))
{
  x1 = df_hvd[i,1]
  y1 = df_hvd[i,2]
  x2 = df_hvd[i,3]
  y2 = df_hvd[i,4]
  points <- rbind(points,get_line_points(x1,y1,x2,y2))
}

grid = make_grid(points,max(df)+1)
print(grid)
print(paste("There are",determine_danger_areas(grid,2),"danger areas"))
