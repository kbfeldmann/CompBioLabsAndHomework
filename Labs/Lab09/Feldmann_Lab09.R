#LAB 09: PARSING DATES AND TIMES FROM A REAL DATA FILE

#read in camera trap data from .csv file
camData <- read.csv("~/Desktop/CU Boulder/Junior Year/Computational Biology/compBioSandBox/CompBio_on_git/Datasets/Cusack_et_al/Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)
setwd("~/Desktop/CU Boulder/Junior Year/Computational Biology/CompBioLabsAndHomework/Labs/Lab09")

#Problem I-3: Change Character DateTime to Dates and Times using strptime()

#isolate one DateTime from column to test code
oneData <- camData$DateTime[2]
#change character string into Date and Time
oneDate = strptime(oneData, format = '%d/%m/%Y %H:%M')

#isolate a vector of DateTimes to test code
setData <- camData$DateTime[1:10]
#change vector of DateTime character strings to vector of Dates and Times
setDate = strptime(setData, format = '%d/%m/%Y %H:%M')

#convert all DateTime data from camera trap file to Dates and Times
allDate = strptime(camData$DateTime, format = '%d/%m/%Y %H:%M')

# At this point in the problem I realized that there are two different DateTime formats present in the file.
# One format contains a four-digit format for the year while the other contains a two-digit format for the year.
# To prevent the code from translating 20/01/13 to 0013-01-20, I need to treat both cases differently.
# Dates with a four-digit year need %Y in the format while dates with a two-digit year need %y in the format.

#CREATE A TEST VECTOR TO CORRECT YEARS
#test vector contains one of each type of date
testData <- c('20/10/2013 18:45', '18/01/2018 04:25', '04/04/13 12:34', '15/11/98 20:30')

#convert all DateTime to dates and times
testDate = strptime(testData, format = '%d/%m/%Y %H:%M')

#find the dates that are problematic (2-digit years)
probYear <- (substr(format(testDate, '%Y'), start = 1, stop = 2) == '00')

#create vector that contains only converted 4-digit years
testDate1 = strptime(testData[!probYear], format = '%d/%m/%Y %H:%M')

#create vector that contains only converted 2-digit years
testDate2 = strptime(testData[probYear], format = '%d/%m/%y %H:%M')

#concatinate two vectors that contain correct dates
totalTestDate <- c(testDate1, testDate2)

#USE PREVIOUS METHOD ON ALL DATA
#convert all DateTime to dates and times
allDate = strptime(camData$DateTime, format = '%d/%m/%Y %H:%M')

#find the dates that are problematic (2-digit years)
problemYears <- (substr(format(allDate, '%Y'), start = 1, stop = 2) == '00')

#create vector that contains only converted 4-digit years
allDate1 = strptime(camData$DateTime[!problemYears], format = '%d/%m/%Y %H:%M')

#create vector that contains only converted 2-digit years
allDate2 = strptime(camData$DateTime[problemYears], format = '%d/%m/%y %H:%M')

#concatinate two vectors that contain correct dates
totalAllDate <- c(allDate1, allDate2)
