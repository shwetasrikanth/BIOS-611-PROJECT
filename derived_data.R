library(tidyverse)
library(tidyr)
d1<- read.csv("source_data/dogdata.csv")
d2<-d1 %>%
  mutate(avg_h =(d1$min_height+d1$max_height)/2)
d2<-d2 %>%
  mutate(avg_w =(d1$min_weight+d1$max_weight)/2)
d2<-d2 %>%
  mutate(avg_exp =(d1$min_expectancy+d1$max_expectancy)/2)

write_csv(d2, "derived_data/derived_data_avg.csv")


