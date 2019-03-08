# LAB 8: Create a Function to Model Population Growth
## Code by **Katherine Feldmann**

The following code creates a function that models population growth given _growth rate_, _carrying capacity_, _number of generations_ and _initial population size_.

_r_: growth rate
_K_: carrying capacity
_numGen_: number of generations
_initPop_: initial population size

## Logistic Growth Model Function
**logGrowthModel** <- function(_r_, _K_, _numGen_, _initPop_){
#### create sequence of numbers given number of generations
arrayGen <- seq(1, _numGen_)

#### create array to hold population sizes for each generation and set initial population size
abundances <- rep(NA, _numGen_)
abundances[1] <- _initPop_ 
#### for loop to fill array with population sizes
for (i in 2:_numGen_){
    abundances[i] <- abundances[i - 1] + (_r_ * abundances[i - 1] * (_K_ - abundances[i - 1]) / _K_)
}
#### plot number of generations by population size
plot(arrayGen, abundances, xlab = "Number of Generations", ylab = "Population Size")

#### leave the function and return the array containing population sizes
return(abundances)
}
    
## Example Code to Test Function
_initPopSize_ <- 300        _initial population size_
_numberGeneration_ <- 1000      _number of generations model will run through_
_carryingCap_ <- 20000      _carrying capacity of population_
_growRate_ <- 0.025         _growth rate of population_

**logGrowthModel**(_growRate_,_carryingCap_,_numberGeneration_,_initPopSize_)

## Additional Code to Save a Table with the Data
### The following code will create a table that contains two columns: generations and population size for each generation.

abundances <- **logGrowthModel**(_growRate_,_carryingCap_,_numberGeneration_,_initPopSize_)

growthMatrix <- cbind(seq(1,numberGeneration), abundances)      _create the table_
write.csv(x = growthMatrix, file = "/Users/katherinefeldmann/Desktop/CU Boulder/Junior Year/Computational Biology/CompBioLabsAndHomework/Labs/Lab08/LogisticGrowthMatrix.csv", row.names = F)       _write data to a csv file_

