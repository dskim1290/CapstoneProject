view(OnlineProductSale)
library(tidyr)
library(dplyr)
library(ggplot2)
library(plyr)


#Create New Column call Product_Number
OnlineProductSale["Product_Number"] <- NA
OnlineProductSale$Product_Number <- 1:nrow(OnlineProductSale)
OnlineProductSale <- OnlineProductSale[colnames(OnlineProductSale)[c(53,1:52)]]

#Replace all the NaN in each columns and replace with mean of each columns. Round to whole numbers to avoid decimals  
for(i in 1:ncol(OnlineProductSale))
{
  OnlineProductSale[is.na(OnlineProductSale[,i]), i] <- colMeans(OnlineProductSale[,i], na.rm = TRUE)
  OnlineProductSale[]<-lapply(OnlineProductSale, as.integer)
}

write.csv(OnlineProductSale,"OnlineProductSale(Clean).csv")