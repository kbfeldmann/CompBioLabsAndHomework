#LAB 05: Loops and Conditionals

#PART I: Simple Conditionals

#Problem 1: Create simple if else statement
x <- 3  #assign numerical value to variable x

#if else that prints statement depending on how value in x compares to 5
if (x > 5){
  print("x is larger than 5")
} else if (x == 5){
  print("x is equal to 5")
} else {
  print("x is less than 5")
}

#Problem 2: Import Vector1.csv and Write FiftyToOneHundred.csv
setwd("/Users/katherinefeldmann/Desktop/CU Boulder/Junior Year/Computational Biology/CompBioLabsAndHomework/Labs/Lab05")  #set working directory before importing file
myData <- read.csv("Vector1.csv")  #import file for analysis

#for loop that replaces all negative numbers with NA
for (i in 1:nrow(myData)){
  if (myData[i,1] < 0){
    myData[i,1] <- NA
  }
}

dataNA <- is.na(myData)  #create vector of TRUE and FALSE depending on whether the value is NA
myData[dataNA] <- NaN  #use logical indexing to assign all of the values that were TRUE for dataNA to NaN

dataNaN <- is.nan(myData[,1])  #create vector of TRUE and FALSE depending on whether the value is NaN
myData[which(dataNaN),1] <- 0  #use which rows are TRUE to reassign values in myData to 0

count <- 1  #initialize variable that will count the number of values in myData between 50 and 100
FiftyToOneHundred <- rep(NA, nrow(myData))  #create vector of NA that has the same number of rows as myData

#for loop that fills FiftyToOneHundred array with values between 50 and 100 and counts how many values there are
for (i in 1:nrow(myData)){
  if (myData[i,1] >= 50 & myData[i,1] <= 100){
    FiftyToOneHundred[count] <- myData[i,1]
    count <- count + 1
  }
}
print(paste("There are ",count," values between 50 and 100 in myData"))  #print how many values are between 50 and 100 in myData
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")  #save vector containing values between 50 and 100 in file

#Problem 3: Determine Years with Specified Emissions
setwd("/Users/katherinefeldmann/Desktop/CU Boulder/Junior Year/Computational Biology/CompBioLabsAndHomework/Labs/Lab04")  #set working directory before importing file
CO2data <- read.csv("CO2_data_cut_paste.csv")  #import file for analysis

gasEmission <- 0  #set specified gas emission
YearsWithGas <- CO2data[which(CO2data[,3] != gasEmission), 1]  #fill vector with the years that had gas emissions
print(paste("First year with gas emissions not", gasEmission,"was", YearsWithGas[1]))  #print the first year with non-specified gas emissions

lowRange <- 200  #lower end of emission range
highRange <- 300  #upper end of emission range
totalInRange <- CO2data[which(CO2data[,2] >= lowRange & CO2data[,2] <= highRange), 1] #fill vector with the years that had total emissions between lowRange and highRange
print(paste("During year",totalInRange,"total emissions were between",lowRange,"and",highRange))  #print the years with total emissions in range

#PART II: Loops + Conditionals + Biology

#Predator and Prey Dynamics
setwd("/Users/katherinefeldmann/Desktop/CU Boulder/Junior Year/Computational Biology/CompBioLabsAndHomework/Labs/Lab05")  #set working directory
totalGenerations <- 1000
initPrey <- 100 	#initial prey abundance at time = 1
initPred <- 10		#initial predator abundance at time = 1
a <- 0.01 		#attack rate
r <- 0.2 		#growth rate of prey
m <- 0.05 		#mortality rate of predators
k <- 0.1 		#conversion constant of prey into predators

time <- seq(1, totalGenerations)  #time vector containing 1 to totalGenerations
nAbundance <- rep(0, totalGenerations)  #vector containing prey abundance for each generation
pAbundance <- rep(0, totalGenerations)  #vector containing predator abundance for each generation

nAbundance[1] <- initPrey  #set initial prey population
pAbundance[1] <- initPred  #set initial predator population

#fill prey and predator abundance vectors
for(i in 2:totalGenerations){
  n <- nAbundance[i-1] + (r * nAbundance[i-1]) - (a * nAbundance[i-1] * pAbundance[i-1])  #prey abundance for generation i
  if (n > 0){
    nAbundance[i] <- n  #prey abundance has not reached 0
  } else {
    nAbundance[i] <- 0  #prey abundance has reached 0
  }
  pAbundance[i] <- pAbundance[i-1] + (k * a * nAbundance[i-1] * pAbundance[i-1]) - (m * pAbundance[i-1])  #predator abundance for generation i
}

plot(time, nAbundance, col="red")  #plot time vs. prey abundance
lines(time, pAbundance, col="blue")  #add line showing time vs. predator abundance to previous plot
myResults <- cbind(time, nAbundance, pAbundance)  #matrix containing time, prey abundance and predator abundance
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")  #edit column names of matrix

write.csv(x = myResults, file = "PredPreyResults.csv")  #write matrix to .csv file