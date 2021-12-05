library(zoo)

depths <- read.table("../input/aoc-day-1/Day1.txt")

# depths <- c(199, 200, 208, 210, 200, 207, 240, 269, 260, 263)
df <- data.frame(depths)
colnames(df) <- c("depths")
df$depths_offset <- c(rep(NA, 1), head(df$depths, -1))
df$diff <- df$depths - df$depths_offset

number_of_increases <- length(na.omit(df$diff[df$diff > 0]))
print(paste("Number of increases =",number_of_increases))

rollsum <- data.frame(rollsum(df$depths, 3))
colnames(rollsum) <- c("rollsum")
rollsum$rollsum_offset <- c(rep(NA, 1), head(rollsum$rollsum, -1))
rollsum$diff <- rollsum$rollsum - rollsum$rollsum_offset

number_of_increases_rollsum <- length(na.omit(rollsum$diff[rollsum$diff > 0]))
print(paste("Number of increases via rollsum =",number_of_increases_rollsum))

rollsum