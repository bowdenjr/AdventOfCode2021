library(tidyverse)
library(DescTools)

df <- read.table('../input/d/bowdenjr/aoc-day-3/AoC Day 3.txt',colClasses = "character")
colnames(df) <- c("inputs")

df2 <- separate(df,inputs,sep="",into=c("0th","1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th","11th","12th"))
df2 <- df2[c("1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th","11th","12th")]
df2 <- sapply(df2,as.numeric)
df_for_oxy = df2
df_for_co2 = df2

gamma = c(Mode(df2[,1]),Mode(df2[,2]),Mode(df2[,3]),Mode(df2[,4]),Mode(df2[,5]),Mode(df2[,6]),Mode(df2[,7]),Mode(df2[,8]),Mode(df2[,9]),Mode(df2[,10]),Mode(df2[,11]),Mode(df2[,12]))
epsilon = 1 - gamma
gamma
epsilon

gamma_dec = Reduce(function(x,y) x*2+y, gamma)
epsilon_dec = Reduce(function(x,y) x*2+y, epsilon)

power_consumption = gamma_dec*epsilon_dec
power_consumption

# OXY GEN RATING
# For each i, subset the rows of df2 so that only those with gamma[i] in the ith position remain
for (i in 1:ncol(df_for_oxy)){
    
    most_common = Mode(df_for_oxy[,i])
    if (is.na(most_common))
    {
        most_common=1
    }
    
    print(paste("Most common =",most_common))
    # check if there are equal numbers of relevant entries
    one_rows = nrow(subset(df_for_oxy,df_for_oxy[,i]==most_common))
    zero_rows = nrow(df_for_oxy) - one_rows
    
    print(paste("Before pass",i,"There were",one_rows,"rows with most common value of",most_common,"and",zero_rows,"remaining"))    
    
    if (one_rows == zero_rows & nrow(df_for_oxy)!=2){
        df_for_oxy = subset(df_for_oxy,df_for_oxy[,i]==1)
    }
    else if (nrow(df_for_oxy)==2) 
    {
        if (one_rows == zero_rows) 
        {
            
            df_for_oxy = subset(df_for_oxy,df_for_oxy[,i]==1)
            break
        }
        else 
        {
            df_for_oxy[1,i]==df_for_oxy[2,i]
            next         
        }
    }
    else {
        df_for_oxy = subset(df_for_oxy,df_for_oxy[,i]==most_common)}


    print("After")
    if (nrow(df_for_oxy)<5){print(df_for_oxy)}
    if (nrow(df_for_oxy) == 1){break}
}

df_for_oxy

oxy_gen_rating = Reduce(function(x,y) x*2+y, df_for_oxy)
oxy_gen_rating

# print(df_for_co2)
# CO2 SCRUB RATING
# For each i, subset the rows of df2 so that only those with epsilon[i] in the ith position remain
for (i in 1:ncol(df_for_co2)){
    
    # check if there are equal numbers of relevant entries
    
    least_common = 1 - Mode(df_for_co2[,i])
    
    if (is.na(least_common))
    {
        least_common=0
    }
    
    print(paste("Least common =",least_common))
    # check if there are equal numbers of relevant entries
    one_rows = nrow(subset(df_for_co2,df_for_co2[,i]==least_common))
    zero_rows = nrow(df_for_co2) - one_rows
    
    print(paste("Before pass",i,"There were",one_rows,"rows with most common value of",least_common,"and",zero_rows,"remaining"))    
    
    if (one_rows == zero_rows & nrow(df_for_co2)!=2){
        df_for_co2 = subset(df_for_co2,df_for_co2[,i]==0)
    }
    else if (nrow(df_for_co2)==2) 
    {
        if (one_rows == zero_rows) 
        {
            
            df_for_co2 = subset(df_for_co2,df_for_co2[,i]==0)
            break
        }
        else 
        {
            df_for_co2[1,i]==df_for_co2[2,i]
            next         
        }
    }
    else {
        df_for_co2 = subset(df_for_co2,df_for_co2[,i]==least_common)}
    
    print(paste("Before pass",i,"There are",one_rows,"rows with 1 and",zero_rows, "rows with 0"))
#     print("After")
    if (nrow(df_for_co2) < 10){print(df_for_co2)}
    if (nrow(df_for_co2) == 1){break}
}

# # print(df_for_co2)
# # CO2 SCRUB RATING
# # For each i, subset the rows of df2 so that only those with epsilon[i] in the ith position remain
# for (i in 1:ncol(df_for_co2)){
    
#     # check if there are equal numbers of relevant entries
    
#     least_common = 1 - Mode(df_for_co2[,i])
#     print(paste("Least common =",least_common))
    
#     one_rows = nrow(subset(df_for_co2,df_for_co2[,i]==least_common))
#     zero_rows = nrow(df_for_co2) - one_rows
    
#     if (one_rows == zero_rows & nrow(df_for_co2)!=2){
#         df_for_co2 = subset(df_for_co2,df_for_co2[,i]==0)
#     } else if (nrow(df_for_co2)==2) {
#         if (one_rows == zero_rows) {
#             df_for_co2 = subset(df_for_co2,df_for_co2[,i]==0)
#             break
#         } else {
#             df_for_co2[1,i]==df_for_co2[2,i]
#             next
#             }
#     } else {
#         df_for_co2 = subset(df_for_co2,df_for_co2[,i]==least_common)}

#     print(paste("Before pass",i,"There are",one_rows,"rows with 1 and",zero_rows, "rows with 0"))
# #     print("After")
#     if (nrow(df_for_co2) < 100){print(df_for_co2)}
#     if (nrow(df_for_co2) == 1){break}
# }

df_for_co2

co2_scrubber_rating = Reduce(function(x,y) x*2+y, df_for_co2)
co2_scrubber_rating

life_support_rating = oxy_gen_rating * co2_scrubber_rating
life_support_rating

# 3143647 was too high