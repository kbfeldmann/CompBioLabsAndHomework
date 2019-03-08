# LAB 8: Create a Function to Model Population Growth
## Code by **Katherine Feldmann**

The following code creates a function that models population growth given _growth rate_, _carrying capacity_, _number of generations_ and _initial population size_.

_r_: growth rate
_K_: carrying capacity
_numGen_: number of generations
_initPop_: initial population size

'''
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
'''
