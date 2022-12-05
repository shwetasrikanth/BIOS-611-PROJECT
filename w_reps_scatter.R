library(tidyverse)
library(tidyr)
library(ggplot2)
d1<- read.csv("derived_data/derived_data_reps.csv")

ggplot(d1, aes(x=avg_w, y=avg_reps)) + geom_point(size=2, color="#2090B9") +labs(y="Average Weight", x= "Average Number of repetitions")
ggsave("figures/w_reps_scatter.png")