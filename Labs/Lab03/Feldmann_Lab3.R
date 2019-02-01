#LAB 03:

#PART 1:
#lab step #3:
Chips <- 5 #the number of Flaming Hot Cheetos at the start of the night
Guests <- 8 #the number of guests coming to the party

#lab step #5:
ChipsPerPerson <- 0.4 #how many bags of chips each person is expected to eat

#lab step #6:
LeftOver <- Chips - ((Guests + 1) * ChipsPerPerson) #compute how many bags of chips will be leftover

#PART 2:

#lab step #8:
#create 5 vectors that contain Star Wars movie preferences in order starting with Episode I and ending with Episode VII
Self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3, 1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1)
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)

#lab step #9:
PennyIV <- Penny[4] #Penny's preference for Episode IV
LennyIV <- Lenny[4] #Lenny's preference for Episode IV

#lab step #10:
GroupPreferences <- cbind(Self, Penny, Jenny, Lenny, Stewie) #a matrix containing the movie preferences for all members of the group

#lab step #11:
str(PennyIV) #PennyIV contains a single numeric value (3)
str(Penny) #Penny contains seven numeric values (starting with position 1 and ending with position 7 in the vector)
str(GroupPreferences) #GroupPreferences contains numeric values that go from position 1 to 7 vertically and 1 to 5 horizontally (the matrix is 5x7)

#lab step #12:
data.frame(Self, Penny, Jenny, Lenny, Stewie) #create a data frame using the preference vectors
GroupDataFrame <- as.data.frame(GroupPreferences, row.names = NULL) #use the matrix, GroupPreferences, to create a data frame

#lab step #13:
"In R, cbind() creates a matrix of values while data.frame() creates a data frame of values.
When using str() to view GroupPreferences and GroupDataFrame, the structures are different. A matrix (GroupPreferences)
stores a grouping of the same type of value (ex. numeric) in a 5x7 format (shown as [1:7, 1:5]. A data frame (GroupDataFrame),
on the other hand, can contain multiple types of variables and stores them as observations of variables (7 obs. of 5 variables)."

#lab step #14:
EpisodeName <- c("I", "II", "III", "IV", "V", "VI", "VII") #vector containing Star Wars episode names

#lab step #15:
row.names(GroupDataFrame) <- EpisodeName #change the row names of GroupDataFrame

#lab step #16-22:
GroupPreferences[3,] #third row of matrix
GroupDataFrame[, 4] #fourth column of data frame
GroupDataFrame[5, 1] #Self preference for Episode V
GroupDataFrame[2, 2] #Penny's preference for Episode II
GroupDataFrame[4:6, ] #everyone's rankings for Episodes IV-VI
GroupDataFrame[c(2, 5, 7), ] #everyone's rankings for Episodes II, V and VII
GroupDataFrame[c(4, 6), c(2, 3, 5)] #Penny, Jenny and Stewie's rankings for IV and VI

#lab step #23:
LennyII <- GroupDataFrame[2, 4] #assign variable that holds Lenny's original preference for Episode II
LennyV <- GroupDataFrame[5, 4] #assign variable that holds Lenny's original preference for Episode V
GroupDataFrame[2, 4] <- LennyV #place LennyV into Lenny's preference for Episode II
GroupDataFrame[5, 4] <- LennyII #place LennyII into Lenny's preference for Episode V

#lab step #24:
GroupPreferences[3, "Penny"] #use the string, Penny, to find value in matrix
GroupDataFrame["III", "Penny"] #use the strings, Penny and III, to find value in data frame

#lab step #25:
GroupDataFrame["II", "Lenny"] <- LennyII #place the value for preference II back in original position
GroupDataFrame["V", "Lenny"] <- LennyV #place the value for preference V back in the original position

#lab step #26:
GroupDataFrame$Lenny[2] <- LennyV #place original preference from Episode V in Episode II
GroupDataFrame$Lenny[5] <- LennyII #place original preference from Episode II in Episode V