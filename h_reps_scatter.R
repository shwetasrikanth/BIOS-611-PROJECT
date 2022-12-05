library(tidyverse)
library(tidyr)
library(ggplot2)
d1<- read.csv("derived_data/derived_data_reps.csv")

ggplot(d1, aes(x=avg_h, y=avg_reps)) + geom_point(size=2, color="#3F831E") +labs(y="Average Height", x= "Average Number of repetions")
ggsave("figures/h_reps_scatter.png")