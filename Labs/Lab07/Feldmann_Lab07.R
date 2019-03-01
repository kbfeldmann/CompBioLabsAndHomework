#Lab 07: Put the FUN in FUNction!

#Problem I: Write a function to compute the area of a triangle

#function that computes area given base and height arguments
triangleArea <- function(base, height){
  area <- 0.5 * base * height
  return(area)
}

#test function by computing the area of a triangle with base = 10 and height = 9
triangleArea(10, 9)

#Problem II: Write a function to produce absolute values
myAbs <- function(number){
  positive <- number >= 0  #assigns TRUE and FALSE values based on if the number is positive
  for(i in 1:length(number)){
    if(positive[i] == FALSE){
      number[i] <- -number[i]  #changes FALSE values to positive number
    }
  }
  return(number)
}

#test myAbs using numbers of length 1
myAbs(5)
myAbs(-2.3)

#test myAbs using vector
values <- c(1.1, 2, 0, -4.3, 9, -12)
myAbs(values)

#Problem III: Write a function to return a Fibonacci sequence based upon user input
fibSequence <- function(n, startNum){
  if(n > 0 && n == round(n)){ #check to see if n is greater than 0 and is an integer
    sequence <- rep(NA, n) #create vector of NA with length n
    sequence[1] <- startNum #initialize first position in vector to 0 or 1
    if(n > 1){ #conditional to ensure n = 1 works
      sequence[2] <- 1
    }
    if(n > 2){ #conditional to ensure n = 2 works
      for(i in 1:(n - 2)){
        sequence[i + 2] <- sequence[i] + sequence[i + 1]
      }
    }
    return(sequence)
  } else {
    print("Warning: The number you have entered needs to be integer greater than 0.") #print warning statement if n is less than 0 or not an integer
  }
}

#test function using both startNum options
fibSequence(15, 0)
fibSequence(8, 1)

#test function for when n is less than 3
fibSequence(2,1)
fibSequence(1,0)

#test function for non-numeric numbers and for values less than 0
fibSequence(-10, 0)
fibSequence(3.5, 1)

#Problem IV:

#PART 1: write a function to calculate the square of the difference between numbers
squareDiff <- function(x, y){
  return((x-y)^2)
}

#test function using two single values
squareDiff(3,5)

#test function using a vector and a single value
squareDiff(c(2,4,6), 4)

#PART 2: write a function that takes a vector and computes the average
average <- function(values){
  return(sum(values)/length(table(values))) #sum values together and divide by number of values in vector/data frame
}

#test function using vector
average(c(5, 15, 10))

#read .csv that contains a data frame
myData <- read.csv("/Users/katherinefeldmann/Desktop/CU Boulder/Junior Year/Computational Biology/compBioSandBox/CompBio_on_git/Labs/Lab07/DataForLab07.csv")

#test function using date frame
average(myData)

#PART 3: use squareDiff and average to compute the sum of squares for a given vector or data frame
sumOfSquares <- function(numbers){
  nAverage <- average(numbers) #compute average of values
  nSquare <- squareDiff(numbers, nAverage) #subtract the average from every value in the original data set and square difference
  return(sum(nSquare)) #sum new values together
}

#test function using data frame
sumOfSquares(myData)