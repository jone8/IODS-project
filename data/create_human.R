hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

3.
str(hd)
str(gii)

dim(hd)
dim(gii)

4.

colnames(hd)
colnames(hd)<- colnames(hd) <- c("HDIr", "Country", "HDI", "LEAB", "ExpYEd", 
                                 "MeanYEd", "GNICapita", "GNI-HDI")
names(gii)
colnames(gii)<-c("GIII", "Country", "GII", "MatMortRatio", "ABR", "ParlRep", "edu2F",
                 "edu2M", "LabourF", "LabourM")
colnames(gii)

5.
library(dplyr)
gii<-mutate(gii, FMratio=edu2F / edu2M, labRatio=LabourF / LabourM)

dim(gii)
6.
joined_human<-inner_join(hd, gii, by= "Country")
 dim(joined_human)
 
 setwd("C:\\Users\\pingv\\Documents\\GitHub\\IODS-project")

 joined_human<- write.csv(joined_human, "data\\human.csv", row.names = F)
 