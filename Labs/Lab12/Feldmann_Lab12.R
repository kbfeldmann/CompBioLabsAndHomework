#CONTINUATION OF LAB 11
#PART 1: Getting set up to work with the data

#read .csv file that contains wood density data
densityData <- read.csv('~/Desktop/CU_Boulder/Junior_Year/Computational_Biology/CompBioLabsAndHomework/Labs/Lab11/GlobalWoodDensityDatabase.csv', stringsAsFactors = F)

#change the column name: "Wood.density..g.cm.3...oven.dry.mass.fresh.volume" to "Wood_Density"
colnames(densityData)[which(names(densityData) == "Wood.density..g.cm.3...oven.dry.mass.fresh.volume")] <- "Wood_Density"

#PART 2: Working with density data
install.packages("dplyr") #install package to use summarize and group_by
library("dplyr") #upload package to use summarize and group_by

findNA <- is.na(densityData$Wood_Density) #create a matrix of T and F to find missing data. T = missing data
naData <- which(findNA) #isolate the T from findNA to find position of missing data
densityData[naData,] #ensure that the isolate row does not contain data for Wood_Density

densityData <- densityData[-naData,] #delete row without data

findNA <- is.na(densityData$Wood_Density) #create a matrix of T and F to find missing data. T = missing data
naData <- which(findNA) #verify that there is no missing data

#produce tibble with columns: Binomial, Family and Density were Density contains the mean of each species
summarizeDensityData <- summarise(group_by(densityData, Binomial, Family), Density = mean(Wood_Density))

#produce a list with columns: Binomial, Family and Wood_Density were Wood_Density contains the mean of each species
aggDensityData <- aggregate(Wood_Density ~ Binomial + Family ,data = densityData, FUN = mean)
colnames(densityData)[which(names(aggDensityData) == "Wood_Density")] <- "Density" #change column name from Wood_Density to Density

#produce a tibble with columns: Family and MeanDensity were MeanDensity contains the mean of each Family (uses pipes)
meanDensityFamily <- summarizeDensityData %>% group_by(Family) %>% summarise(MeanDensity = mean(Density))
#sort meanDensityFamily by MeanDensity
sortedMeanDensity <- meanDensityFamily %>% arrange(MeanDensity)

#What are the 8 families with the highest average densities?
highestDensities <- sortedMeanDensity %>% tail(n=8)
#What are the 8 families with the lowest average densities?
lowestDensities <- sortedMeanDensity %>% head(n=8)

#PART 3: Plotting
install.packages("ggplot2")
library("ggplot2")

#PLOT: Densities of individual species from the families with the highest average densities
summarizeDensityData[which(summarizeDensityData$Family %in% highestDensities$Family),] %>% ggplot(aes(y = Density)) + 
  geom_boxplot() +
  facet_wrap(~ Family, ncol=4)
#PLOT: Densities of individual species from the families with the lowest average densities
summarizeDensityData[which(summarizeDensityData$Family %in% lowestDensities$Family),] %>% ggplot(aes(y = Density)) + 
  geom_boxplot() +
  facet_wrap(~ Family, ncol=4)

#PLOT: Families with highest average densities
summarizeDensityData[which(summarizeDensityData$Family %in% highestDensities$Family),] %>% ggplot(aes(x = Family, y = Density)) + 
  geom_boxplot() +
  coord_flip()
#PLOT: Families with lowest average densities
summarizeDensityData[which(summarizeDensityData$Family %in% lowestDensities$Family),] %>% ggplot(aes(x = Family, y = Density)) + 
  geom_boxplot() +
  coord_flip()

#LAB 12
setwd("~/Desktop/CU_Boulder/Junior_Year/Computational_Biology/CompBioLabsAndHomework/Labs/Lab12")
cusackData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv")

#Problem 1: A bar plot in ggplot()
cusackData %>% ggplot(aes(x = Species)) + geom_bar()
