#LAB 04: FOR LOOPS

#PART I: Practice writing "for loops"

#Problem 1: For loop that prints 'hi' 10 times
for (i in 1:10){  #iterate through loop 10 times
  print("hi")  #print 'hi' everytime through loop
}

#Problem 2: Calculate money left in piggy bank
piggyBank <- 10  #how much money is in the piggy bank to start
allowance <- 5  #how much money he makes each week
gumPrice <- 1.34  #how much 1 pack of gum costs
piggyBankYears <- 8  #number of years to iterate through for loop

for (i in 1:piggyBankYears){
  piggyBank <- piggyBank + allowance - (2 * gumPrice)  #compute the total amount of money in the piggy bank after i week
  print(paste("Money in piggy bank after week ", i, ": ", piggyBank))  #print how much money is left in piggy bank after i week
}

#Problem 3: Calculate number of individuals in decreasing population size
popSize <- 2000  #starting population size
popShrink <- 0.05  #rate of decrease as decimal
popYears <- 7  #number of years to iterate through for loop

for (i in 1:popYears){
  popSize <- popSize - (popSize * popShrink)  #compute new population size at end of year by subtracting how many individuals are lost
  print(paste("Population size at the end of ", i, "year: ", popSize))  #print the population size at the end of the year
}

#Problem 4: Fill abundances array to calculate growing population size
growthYears <- 12  #for how many years the equation will fill an array
initPop <- 2500  #initial population size
abundances <- rep(initPop, growthYears)  #fill an array with initPop so that abundances[1] = 2500
growthRate <- 0.8  #growth rate for given population
carryingCapacity <- 10000  #carrying capacity of given population

for (i in 2:growthYears){
  abundances[i] <- abundances[i - 1] + (growthRate * abundances[i - 1] * (carryingCapacity - abundances[i - 1]) / carryingCapacity)  #fill the abundances array with population size values for each year (i)
}
print(abundances[12])  #print the 12th element of the abundances array to determine population size after 12 years

#PART II: For loops and storing data in arrays

#Problem 5: Fill array with values using for loop
array1 <- rep(0, 18)  #create array that consists of 18 zeros
print(array1)  #print above array

for (i in 1:length(array1)){  #iteratre through the for loop for however long the array is
  array1[i] <- 3 * i  #multiply i by 3 and put that in position i of the array
}
print(array1)  #print the final array

array2 <- rep(0, 18)  #make new array that consists of 18 zeros
array2[1] <- 1  #fill the first element of array with 1
print(array2)  #print the new array

for (i in 2:length(array2)){  #starting with position 2, index through the rest of array2
  array2[i] <- 1 + (2 * array2[i - 1])  #compute values to input into positions of array2
}
print(array2)  #print array2

#Problem 6: Use for loop to store Fibonacci Sequence in an array
numValues <- 20  #how long the Fibonacci Sequence will be
fibSequence <- rep(0, numValues)  #create array of chosen length (numValues) and initialize positions to 0
fibSequence[2] <- 1  #change second position to 1 so the first two positions of the sequence can be added together

for (i in 3:length(fibSequence)){  #starting at position 3, walk through array using for loop
  fibSequence[i] <- fibSequence[i - 1] + fibSequence[i - 2]  #fill a position in the array by adding the two previous positions
}
print(fibSequence)  #print the Fibonacci Sequence

#Problem 7: 
growthYears <- 12  #number of years
arrayYears <- rep(0, growthYears)  #array that will consist of years 1 through growYears

for (i in 1:length(arrayYears)){
  arrayYears[i] <- i  #fill array will years 1 through growYears
}
print(arrayYears)  #print array with years

initPop <- 2500  #initial population size
abundances <- rep(initPop, growthYears)  #fill an array with initPop so that abundances[1] = 2500
growthRate <- 0.8  #growth rate for given population
carryingCapacity <- 10000  #carrying capacity of given population

for (i in 2:growthYears){
  abundances[i] <- abundances[i - 1] + (growthRate * abundances[i - 1] * (carryingCapacity - abundances[i - 1]) / carryingCapacity)  #fill the abundances array with population size values for each year (i)
}
print(abundances)  #print abundances
plot(arrayYears, abundances)  #plot the abundances by the number of years to display population growth