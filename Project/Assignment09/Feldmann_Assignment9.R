##INSTALL AND UPLOAD NECESSARY PACKAGES##

#install.packages('pavo')
#install.packages('ggplot2')
#install.packages('dplyr')

#Upload necessary packages to R. If error, run lines 3, 4 and 5.
library('pavo')
library('ggplot2')
library('dplyr')

##PATH TO NECESSARY DATA##

#NOTE: the following line of code fails to set the working directory and only sets it to "/Users/home" the first time. 
#Run this line twice if problems arise in line 21
dataPath <- setwd("~/Desktop/CU_Boulder/Junior_Year/Computational_Biology/CompBioLabsAndHomework/Project/glossystarlings")
dataPath <- setwd("~/Desktop/CU_Boulder/Junior_Year/Computational_Biology/CompBioLabsAndHomework/Project/glossystarlings")

##CREATE ORIGINAL PLOT USING PAVO FROM MAIA ET AL. 2013##

specs <- getspec(where = dataPath, ext ='ttt', lim = c(300,700))  #Upload raw data and create list of values for each file.
specs <- aggspec(specs, by=3, FUN="mean")  #Average spectral data for each patch in all species. There are 3 measurements per patch.
specs <- procspec(specs, opt="smooth")  #Remove electrical noise from the data. This was produced by the spectrometer.
specs.belly <- subset(specs, "Belly")  #Isolate all wavelength and transmittance data for the "____" patch
spp <- substr(names(specs.belly), 1, 4)  #Obtain the headers (including species names) from the specified patch data
aggplot(specs.belly, by=spp)  #Create a plot of wavelength (nm) x reflectance (%) of all species for the specified patch

##REPRODUCE PAVO PLOT AND MODIFY TO VISUALIZE ALL PLUMAGE PATCHES##

#Step I: Import Data to New Data Frame

#LESS EFFICIENT METHOD FOR CREATING DATA FRAME
# firstFile <- T
# for(fileName in list.files(path = dataPath)){
#   data <- read.csv(fileName, skip = 5, sep = ";")
#   fileName <- sub(".ttt", "", fileName)
#   objectName <- fileName
#   assign(paste(fileName, sep = ""), data)
#   fileName <- as.data.frame(get(fileName))
#   if(firstFile == T){
#     plumageData <- fileName
#     colnames(plumageData)[which(names(plumageData) == tail(colnames(plumageData), n=1))] <- objectName
#   } else {
#     plumageData <- merge(plumageData, fileName, by = "Wave")
#     colnames(plumageData)[which(names(plumageData) == tail(colnames(plumageData), n=1))] <- objectName
#   }
#   firstFile <- F
# }

#MORE EFFICIENT METHOD FOR CREATING DATA FRAME
files <- list.files(path = dataPath)  #create vector of the filenames in 'glossystarlings'

#NOTE: This will generate a warning 'In readLines(file, skip) : line 5 appears to contain an embedded nul'.
data <- read.csv(files[1], skip = 5, sep = ";", stringsAsFactors=FALSE)  #read in first file and skip embedded nul
plumageData <- data.frame(Wave = data$Wave)  #use the 'Wave' column of the first file to create data frame

#populate plumageData data frame with Transmittance data for all files
for(fileName in list.files(path = dataPath)){
  #NOTE: This will generate a warning 'There were 50 or more warnings (use warnings() to see the first 50)'.
  data <- read.csv(fileName, skip = 5, sep = ";", stringsAsFactors=FALSE)  #read in file and skip embedded nul
  fileName <- sub(".ttt", "", fileName)  #remove '.ttt' from the file to create a column name
  plumageData[[fileName]] <- data$Transmittance  #create new column in data frame using file name and transmittance data
}

numericData <- data.frame(lapply(plumageData[-1,-1], as.numeric))  #create new data frame that turns all transmittance values into numeric values
numericData <- cbind(wl = as.numeric(as.character(plumageData$Wave[-1])), numericData)  #add 'Wave' column which contains wavelength values

plumageNames <- colnames(numericData)  #obtain 397 column names from the data frame (396 files + Wave)
plumageNames <- unique(append(plumageNames[1], substr(plumageNames[-1], 1, nchar(plumageNames[-1])-2)))  #delete .1, .2 and .3 from files

meanData <- data.frame(wl = numericData$wl)  #create new data frame to store mean data for each species.bird.patch
for(name in 2:length(plumageNames)){
  grepNames <- grep(plumageNames[name], colnames(numericData), value = "TRUE")  #find the 3 columns that need to be averaged together (.1, .2, .3)
  meanData <- cbind(meanData, data.frame(tempName <- rowMeans(select(numericData, grepNames))))  #add each species.bird.patch to data frame
  colnames(meanData)[length(meanData)] <- plumageNames[name]  #change column name to species.bird.patch
}

#use procspec from PAVO to smooth data (I do not know how to replicate this smoothing function yet it is needed to create a replicate plot.)
meanData <- procspec(meanData, opt="smooth")

#Step II: Recreate PAVO Plot

bellyPatch <- subset(meanData, "Belly")  #Isolate all wavelength and transmittance data for the "____" patch (Code from Maia et al. 2013)
speciesNames <- unique(substr(names(bellyPatch), 1, 4))  #Obtain the headers (including species names) from the specified patch data

meanBelly <- data.frame(wl = meanData$wl)  #create new data frame to store mean data for the "____" patch
for(name in 2:length(speciesNames)){
  grepNames <- grep(speciesNames[name], colnames(bellyPatch), value = "TRUE")  #find the column names to average together
  meanBelly <- cbind(meanBelly, data.frame(tempName <- rowMeans(select(bellyPatch, grepNames))))  #average selected columns and add to data frame
  colnames(meanBelly)[length(meanBelly)] <- speciesNames[name]  #rename new column with species
}

#plot wavelength (nm) x reflectance (%) for all species for the "____" patch
bellyPatch %>% ggplot() + 
  geom_smooth(aes(x = bellyPatch$wl, y = meanBelly$LAAC), color = 'red', method = 'loess', formula = y ~ x, span = 0.2) +  #draw line for mean values
  geom_smooth(aes(x = bellyPatch$wl, y = meanBelly$LACL), color = 'blue', method = 'loess', formula = y ~ x, span = 0.2) +  #draw line for mean values
  geom_smooth(aes(x = bellyPatch$wl, y = meanBelly$LAEL), color = 'green', method = 'loess', formula = y ~ x, span = 0.2) +  #draw line for mean values
  xlab('Wavelength (nm)') +  #change x-axis label
  ylab('Reflectance (%)') +  #change y-axis label
  ggtitle("Belly Patch")  #add title

#Step III: One Figure for All Plumage Patches

patchNames <- unique(substr(names(meanData[-1]), 13, length(names(meanData[-1]))))  #find all unique plumage patches
speciesNames <- unique(substr(names(meanData), 1, 4))  #find all unique species

patchData <- rep(NA, length(patchNames))  #create vector to store plumage patch data
patchData <- list(patchData)  #convert vector to list so that data frames added are preserved

iterator <- 0  #iterator to step through list
for(patch in patchNames){
  iterator <- iterator + 1  #move to next position in list
  pPatch <- subset(meanData, patch)  #produce data frame that contains all information for specified patch
  meanPatch <- data.frame(wl = meanData$wl)  #create data frame to hold all mean patch data
  for(name in 2:length(speciesNames)){
    grepNames <- grep(speciesNames[name], colnames(pPatch), value = "TRUE")  #find the column names to average together and find min and max
    meanPatch <- cbind(meanPatch, data.frame(tempName <- rowMeans(select(pPatch, grepNames))))  #average selected columns and add to data frame
    colnames(meanPatch)[length(meanPatch)] <- speciesNames[name]  #rename new column with species
    meanPatch <- cbind(meanPatch, data.frame(tempName <- apply(select(pPatch, grepNames), 1, FUN = min)))  #find min of selected columns and add to data frame
    colnames(meanPatch)[length(meanPatch)] <- paste(speciesNames[name], 'min', sep = "") #rename new column with species+min
    meanPatch <- cbind(meanPatch, data.frame(tempName <- apply(select(pPatch, grepNames), 1, FUN = max)))  #find max of selected columns and add to data frame
    colnames(meanPatch)[length(meanPatch)] <- paste(speciesNames[name], 'max', sep = "")  #rename new column with species+max
  }
  
  patchData[iterator] <- list(meanPatch)  #add data frame to list
  patchData[[iterator]]$patchID <- patch  #create new column that contains plumage patch
}

#plot wavelength (nm) x reflectance (%) for all species for all patches
ggplot(bind_rows(patchData, .id = 'df')) +
  geom_smooth(aes(x =  wl, y = LAAC, color = "LAAC"), method = 'loess', formula = y ~ x, span = 0.2) +  #draw line for mean values
  geom_ribbon(aes(x =  wl, ymin = LAACmin, ymax = LAACmax), fill = 'red', alpha = 0.15) +  #draw ribbon for the range of values within species
  geom_smooth(aes(x = wl, y = LACL, color = "LACL"), method = 'loess', formula = y ~ x, span = 0.2) +  #draw line for mean values
  geom_ribbon(aes(x =  wl, ymin = LACLmin, ymax = LACLmax), fill = 'blue', alpha = 0.15) +  #draw ribbon for the range of values within species
  geom_smooth(aes(x = wl, y = LAEL, color = "LAEL"), method = 'loess', formula = y ~ x, span = 0.2) +  #draw line for mean values
  geom_ribbon(aes(x =  wl, ymin = LAELmin, ymax = LAELmax), fill = 'green', alpha = 0.15) +  #draw ribbon for the range of values within species
  facet_wrap(vars(patchID), nrow = 2) +  #produce one plot for each plumage patch
  xlab('Wavelength (nm)') +  #change x-axis label
  ylab('Reflectance (%)') +  #change y-axis label
  scale_colour_manual(name = "", values = c("red", "blue", "green")) +  #add legend
  ggtitle("Comparing Light Reflectance of Plumage Patches Among Multiple Species")  #add title
