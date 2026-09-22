# MB5370: Techniques in Marine Science 1
# Programming Fundamentals 
# Kylah Kalblfeisch
# 15/09/26

#---------------------------------------------#
# Workshop 01. Introduction ####

# R syntax and working in scripts ####
# this section introduces us to R by running simple calculations inside a script

2 + 1
1:30

# Functions and arguments ####

#round and floor to round up or down
years_old <- 25.7
round(years_old) #rounds up
floor(years_old) #rounds down

years_old <- 25.765
round(years_old, 2) #comma after the object to specify argument (eg. how many decimal places wanted)

# Objects and Assignment ####
## This section focuses on understanding how data is stored in R and why that matters 

# assignment operator (<-) takes whatever is on the right-hand side and saves it inside an object named the left-hand side
#saving a single value

coral_count <- 42
#saving a vector of multiple fish lengths (in mm)
fish_lengths <- c(124, 152, 98, 221, 146)

# option - lets you get an <- 

#object names are case senstiive, can't use a number at the beginning or special symbols
# can corrent with backticks (``)
#coral count <- 25 #space, will error
`coral count` <- 25 #backticks, space will work

#Debugging Code ####
##Exercise - copy and fix errors
quadrat_area_m2 <- 0.25
number_of_quadrats <- 16
total_area_surveyed <- quadrat_area_m2 * number_of_quadrats

print(total_area_surveyed)


# Installing and Loading Packages ####

#install.packages("tidyverse") #download and install. (don't need to install everytime or it can screw it up)
library(tidyverse) #load into current session

#Data Types ####
#R categorises data to know what transformations are permitted 
# 1. Numeric: continuous decimals (eg. pH levels: 8.1, 7.95)
# 2. Integer: whole numbers (eg. count of sea turtles seen: 5)
# 3. Character: text strings enclosed in quotation marks (eg. species name: "bird whatever")
# 4. Logical: values that are either true or false (eg. bleaching observed: TRUE)

## Checking structures exercise 
# Assign variable values
site_name <- "Heron_Island"
transect_depth_m <- 12.5
bleaching_present <- TRUE

# Check using function class()
class(site_name)
class(transect_depth_m)
class(bleaching_present)

# Check using function str()
str(site_name)
str(transect_depth_m)
str(bleaching_present)

#Data Structures####
#can make a vector with numeric elemnents in it 
fish_lengths <- c(124, 152, 98, 221, 146)
#can also make a vector with character elements
coral_spp <- c("Porites", "Acropora", "Montastrea")

#Vectors##
notes <- c("Acropora", 27.5, TRUE)

#Lists##
notes <- list("Acropora", 27.5, TRUE)
notes
notes[[1]]

#Data frames and tibbles##
my_dataframe <- data.frame(no = c(1,2,3), c("Plectropomus", "Scarus", "Pomacentrus"), c(TRUE, FALSE, TRUE))
                           my_dataframe
                           str(my_dataframe)
                           
my_dataframe$no = as.factor(my_dataframe$no)
str(my_dataframe)

# Setting up R Project ####

#avoid setwd(), use .Rproj
#navigate to top menu and select file > new project
#choose new directory > new project
#name your directory clearly, save somewhere logical
#look at lower-right files pane for active file 
#use R console to generate a clean, automated subfolder tree by running these commands 
dir.create("data") #for raw, unedited data files 
dir.create("code") #for dirty, heavy data manipulation code
dir.create("output") #for processed tables, figures, and saved objects
dir.create("docs") #for your rendered write-ups and final documents



