# Johanna, pvm, dataa



lrn2014<- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt",
                     header=T)

?read.table()


str(lrn2014)
dim(lrn2014)

#getOption("repos")
  
#install.packages("dplyr")
library(dplyr)

#find.package("devtools")


deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

deep_columns<- select(lrn2014, deep_questions)
lrn2014$deep <- rowMeans(deep_columns)

surface_columns <- select(lrn2014, surface_questions)
lrn2014$surf <- rowMeans(surface_columns)

strategic_columns <- select(lrn2014, strategic_questions)
lrn2014$stra <- rowMeans(strategic_columns)


keep<- c("gender", "Age", "Attitude")


lrn2014[keep]

lrn2014$Attitude <- lrn2014$Attitude / 10

library(dplyr)

analysis_lrn2014 <- select(lrn2014, gender, Age, Attitude, deep, stra, surf, 
                           Points)



analysis_lrn2014<- filter (analysis_lrn2014, Points>0)

#ab<- subset(analysis_lrn20142, Points>30)

setwd("C:\\Users\\pingv\\Documents\\GitHub\\IODS-project\\data")

write.table(analysis_lrn2014, "analysis_lrn2014_teksti.txt")
write.csv(analysis_lrn2014, "analysis_lrn2014_csv.csv")

analysis_lrn2014_teksti<-read.table("analysis_lrn2014_teksti.txt")
dim(analysis_lrn2014_teksti)
str(analysis_lrn2014_teksti)

analysis_lrn2014_csv<- read.csv("analysis_lrn2014_csv.csv")
analysis_lrn2014_csv<- (analysis_lrn2014_csv)[2:8]
miedim<-dim(analysis_lrn2014_csv)
miestr<-str(analysis_lrn2014_csv)
miehead<-head(analysis_lrn2014_csv)

#Na
#select
#keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")
#learning2014testi <- lrn2014[keep_columns]

?colnames

#install.packages("ggplot2")
#install.packages("GGally")

?plot.lm
#NA
#dplyr

#select
# cheatsheets