library(tidyverse)
library(tidyr)
library(ggplot2)
d1<- read.csv("derived_data/derived_data_avg.csv")

ggplot(d1, aes(x=avg_exp, y=avg_w)) + geom_point(size=2) +labs(y="Average Weight", x= "Average Expectancy")
ggsave("figures/w_exp_scatter.png")