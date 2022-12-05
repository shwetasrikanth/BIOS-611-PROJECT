library(tidyverse)
library(tidyr)
library(dplyr)
data= read.csv("source_data/reps_data.csv")

data_2<-na.omit(data)
data_2<-data_2 %>%mutate(avg_w =(data_2$weight_low_lbs+data_2$weight_high_lbs)/2)
data_2<-data_2 %>%mutate(avg_h =(data_2$height_high_inches+data_2$height_low_inches)/2)
data_2<-data_2 %>%mutate(avg_reps =(data_2$reps_lower+data_2$reps_upper)/2)

data_2<-data_2 %>%
  mutate(easy_to_train = case_when(
    data_2$avg_reps <15~ 1,
    data_2$avg_reps>=15 ~0,
     ))


write_csv(data_2, "derived_data/derived_data_reps.csv")
