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


----
  
  getwd()

human<-read.csv("data\\human.csv")
dim(human)
str(human)

library(MASS)
library(dplyr)

class(human$GNICapita)

human<-transform(human, GNICapita=as.numeric(GNICapita))

human<- dplyr::select(human,   "Country", "edu2F", "LabourF", "ExpYEd", 
                      "LEAB", "GNICapita", "MatMortRatio", "ABR", "ParlRep")

human<- human[complete.cases(human),]

tail(human, n=10)
last <- nrow(human) - 7
human_ <- human[1:last, ]

row.names(human_)<- human_$Country
human_<- dplyr::select(human_, -Country)

human<- write.csv(human_,"data\\human.csv", row.names = T)
testi<-read.csv("data\\human.csv", row.names =1)
