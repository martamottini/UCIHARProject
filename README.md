### Introduction

This repository contains the files for the Getting and Cleaning Data Course Project: a README file (the one you are reading), a R script file (run_analysis.R) and a code book file (CodeBook.md).
The scope of the project is to collect and clean a data set, more specifically to work on the Human Activity Recognition Using Smartphones Dataset (Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012).

### R script file

This file contains the code used to obtain a tidy data set from the raw data that is provided and also a second, independent tidy data set, that contains variables obtained through transformations of the first data set. The script is pretty staightforward and, if it saved in the working directory, it can be called with a source command.
For semplicity I'll break down the description of what the code does into steps:

1. It checks if there is a directory called "UCI HAR Dataset" in the working directory, this is the one containing the raw data set, splitted into different files and subdirectories. If "UCI HAR Dataset" doesn't exist, it prints an error message and then procedes to download and unzip the necessary file (as per link provided by the course instructor).

2. It reads all the necessary files into data frames, thus setting up the building blocks needed to obtain one data set from the two sets (test and train).

3. It binds two columns (subject ID and activity ID) to the test and train data frames, making them respectively: 2947 values of 563 variables and 7352 values of 563 variables. 

4. It binds the two data frames just obtained into one with 7352+2947=10299 values of 563 variables. 

5. It subsets the data frame using regular expressions to select only the colums that report a mean or a standard deviation of a measured feature plus the subject and activity IDs. This new data frame has 10299 values for 68 variables.

6. It assigns descriptive activity names to the activities in the data frame (identified so far with an ID).

7. It renames the columns with descriptive names for the listed variables. 

8. It calculates the average of each variable of interest (first 66 colums) from the data set, grouping them by activity and subject (6 activites for the 30 subjects). It's a very simple approach that uses "aggregate", an alternative approach (using "split" and "sapply") is also added but as comment. In the former case the code generates a data frame of 180 observations of 66 variables but the Activity and the Subject_Id are also included as columns (180x68 total), while in the latter approach, Activity and Subject_ID are combined together as row labels. Depending on one's need for the structure of the tidy data set, one can choose the first or the second approach.

The final tidy data set has been written into a txt file with the following command:

write.table(tidydata,file="tidydataset.txt",row.names=FALSE)

It can be read into R using the following command:

read.table("tidydataset.txt",header=TRUE,as.is=TRUE)


### Code book
All the information regarding the variables of the data set and their transformations can be found in the CodeBook.md file.

### Acknowledgements
Many thanks to my fellow students and the Community TAs for the helpful suggestions and advices. In particular the thread "David's project FAQ" (in the Discussion Forums/Course Project section) initiated by David Hood (Community TA). 

