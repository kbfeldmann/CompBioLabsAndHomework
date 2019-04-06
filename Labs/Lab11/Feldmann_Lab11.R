#PART 1: Getting set up to work with the data

#read .csv file that contains wood density data
densityData <- read.csv('~/Desktop/CU_Boulder/Junior_Year/Computational_Biology/CompBioLabsAndHomework/Labs/Lab11/GlobalWoodDensityDatabase.csv', stringsAsFactors = F)

#change the column name: "Wood.density..g.cm.3...oven.dry.mass.fresh.volume" to "Wood_Density"
colnames(densityData)[which(names(densityData) == "Wood.density..g.cm.3...oven.dry.mass.fresh.volume")] <- "Wood_Density"

#PART 2: Working with density data

findNA <- is.na(densityData$Wood_Density) #create a matrix of T and F to find missing data. T = missing data
naData <- which(findNA) #isolate the T from findNA to find position of missing data
densityData[naData,] #ensure that the isolate row does not contain data for Wood_Density

densityData <- densityData[-naData,] #delete row without data

findNA <- is.na(densityData$Wood_Density) #create a matrix of T and F to find missing data. T = missing data
naData <- which(findNA) #verify that there is no missing data

library("dplyr")
groupDD <- group_by(densityData, Binomial)
newDensityData <- summarise(groupDD, meanWoodDensity = mean(densityData$Wood_Density, Family = unique(densityData$Family)))
