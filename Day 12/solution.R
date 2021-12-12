library(igraph)
library(dplyr)
source('functions.R')

# This helped me find the igraph package and gave good pointers on implementing a function
# https://www.r-bloggers.com/2020/10/finding-the-shortest-path-with-dijkstras-algorithm/

edges <- (read.delim('aoc day 12.txt',header=FALSE,sep="-"))

# reverse connections and append to edges
edges2 <- rename(edges, V1 = V2, V2 = V1)
edges<-rbind(edges,edges2)

gmatrix <- as.matrix(edges)
g <- graph_from_edgelist(gmatrix,directed=FALSE)
plot(g)

graph <- edges %>% group_by(V1) %>% summarize(V2 = strsplit(paste(V2,collapse=','),","))
graph <- setNames(as.list(graph$V2), graph$V1)

paths <- list()
seen <- c()

find_paths(graph, "start", "end") # via b
print(length(paths))