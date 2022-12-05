library(tidyverse)
library(tidyr)
library(dplyr)
library(ggplot2)
d1<- read.csv("derived_data/derived_data_reps.csv")
d2<-d1[order(-d1$avg_w),]


ggplot(d2[1:10,],aes(x=reorder(Breed, avg_w), y=avg_w)) + geom_bar(stat="identity", fill="blue") + 
  ggtitle("Top 10 heaviest dogs") + labs(x= "Breed", y="Average Weight of Dogs") + theme(text = element_text(size=10),
                                                                            axis.text.x = element_text(angle=90, hjust=1))


ggsave("figures/heaviest_dogs.png")