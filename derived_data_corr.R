library(tidyverse)
library(tidyr)
library(dplyr)
d1<- read.csv("derived_data/derived_data_reps.csv")
d2<-d1[, c(2,3,4,5,6,7,8,9,10)]
write.csv(d2,"derived_data/derived_data_corr.csv")