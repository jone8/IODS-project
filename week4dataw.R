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




