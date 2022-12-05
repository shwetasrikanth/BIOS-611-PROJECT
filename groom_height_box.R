library(tidyverse)
library(tidyr)
library(ggplot2)
d1<- read.csv("derived_data/derived_data_avg.csv")

ggplot(d1, aes(x=grooming_frequency_category, y=avg_h)) + geom_boxplot()+ theme(text = element_text(size=10),
                                                                                axis.text.x = element_text(angle=90, hjust=1))
ggsave("figures/groom_height_box.png")

