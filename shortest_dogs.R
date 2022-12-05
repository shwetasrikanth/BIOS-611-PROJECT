library(tidyverse)
library(tidyr)
library(ggplot2)
d1<- read.csv("derived_data/derived_data_reps.csv")
d2<-d1[order(-d1$avg_h),]


ggplot(d2[125:134,],aes(x=reorder(Breed, avg_h), y=avg_h)) + geom_bar(stat="identity", fill="purple") + 
  ggtitle("Top 10 shortest dogs") + labs(x= "Breed", y="Average Height of Dogs") + theme(text = element_text(size=10),
                                                                            axis.text.x = element_text(angle=90, hjust=1))


ggsave("figures/shortest_dogs.png")