##FROM LAB 4: DISCRETE-TIME LOGISTIC GROWTH MODEL

#Problem 7: 
growthYears <- 12  #number of years
arrayYears <- rep(0, growthYears)  #array that will consist of years 1 through growYears

for (i in 1:length(arrayYears)){
  arrayYears[i] <- i  #fill array will years 1 through growYears
}
print(arrayYears)  #print array with years

initialPop <- 2500  #initial population size
abundances <- rep(initPop, growthYears)  #fill an array with initPop so that abundances[1] = 2500
growthRate <- 0.8  #growth rate for given population
carryingCapacity <- 10000  #carrying capacity of given population

for (i in 2:growthYears){
  abundances[i] <- abundances[i - 1] + (growthRate * abundances[i - 1] * (carryingCapacity - abundances[i - 1]) / carryingCapacity)  #fill the abundances array with population size values for each year (i)
}
print(abundances)  #print abundances
plot(arrayYears, abundances)  #plot the abundances by the number of years to display population growth

##WORK FOR LAB 8: MODIFY CODE FOR INSERTING INTO MARKDOWN SCRIPT

#Function that Models Growth Given: Rate, Carrying Capacity, Number of Generations and Initial Population Size
logGrowthModel <- function(r, K, numGen, initPop){
  arrayGen <- seq(1, numGen) #create array with sequence of generations
  abundances <- rep(NA, numGen) #create array to hold population sizes
  abundances[1] <- initPop  #fill abundances[1] with the initial population size
  for (i in 2:numGen){
    abundances[i] <- abundances[i - 1] + (r * abundances[i - 1] * (K - abundances[i - 1]) / K)  #fill the abundances array with population size values for each year (i)
  }
  plot(arrayGen, abundances, xlab = "Number of Generations", ylab = "Population Size")  #plot the abundances by the number of generations to display population growth
  return(abundances) #return an array of population sizes
}

#Test logGrowthModel function
initPopSize <- 300 #initial population size
numberGeneration <- 1000 #number of generations model will run through
carryingCap <- 20000 #carrying capacity of population
growRate <- 0.025 #growth rate of population
 
abundances <- logGrowthModel(growRate,carryingCap,numberGeneration,initPopSize) #place the results from the function into an array

growthMatrix <- cbind(seq(1,numberGeneration), abundances) #create matrix with 2 columns: generations and population sizes
write.csv(x = growthMatrix, file = "/Users/katherinefeldmann/Desktop/CU Boulder/Junior Year/Computational Biology/CompBioLabsAndHomework/Labs/Lab08/LogisticGrowthMatrix.csv", row.names = F) #write data in matrix to .csv file

 