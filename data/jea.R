lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

library(dplyr)
# Check the dims
dim(lrn14)

# Check structure of the data
str(lrn14)

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D07","D14","D22","D30")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# columns related to surface learning. surf by rowMeans
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

#Scale attitude
lrn14$attitude <- lrn14$Attitude / 10

# choose cols
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")

# create learning
learning2014 <- select(lrn14, one_of(keep_columns))

# Filter by points > 0
learning2014 <- filter(learning2014, Points > 0)

# see the stucture of the new dataset
pstdim<- dim(learning2014)
pststr<-str(learning2014)
psthead<-head(learning2014)
psttail<-tail(learning2014)

