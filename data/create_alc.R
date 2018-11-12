#Jone 8 
# 12.11.2018
#viikko3

setwd("C:\\Users\\pingv\\Documents\\GitHub\\IODS-project")
student_mat <- read.csv("student-mat.csv", sep=";")
student_por<- read.csv2("student-por.csv")

str(student_mat)
str(student_por)

dim(student_mat)
dim(student_por)



#3
library(dplyr)
colnames(student_mat)
colnames(student_por)

#4
# voi olla vastannut eri tavoin eri kysymyksiin, yhdistää näiden mukaan.

join_by= c( "school", "sex", "age", "address",
            "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", 
            "nursery","internet")
joined_data<-inner_join(student_mat, student_por, by= join_by, 
                        suffix= c("math", "por"))

str(joined_data)
dim(joined_data)

#5
alc <- select(joined_data, one_of(join_by))

# the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(student_mat)[!colnames(student_mat) %in% join_by]

# print out the columns not used for joining
notjoined_columns

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(joined_data, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- first_column
  }
}
alc

#6.
alc_days<-select(alc, "Dalc", "Walc")

alc$alc_use<- rowMeans(alc_days)

alc$high_use<- alc$alc_use>2

#7
glimpse(alc)

getwd()
write.csv2(alc, file="data/alc.csv", row.names = F)
testi<-read.csv2("data/alc.csv")
