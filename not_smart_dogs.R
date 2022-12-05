library(tidyverse)
library(tidyr)
library(ggplot2)
d1<- read.csv("derived_data/derived_data_reps.csv")
d2<-d1[order(-d1$avg_reps),]


ggplot(d2[1:10,],aes(x=reorder(Breed, avg_reps), y=avg_reps)) + geom_bar(stat="identity", fill="purple") + 
  ggtitle("Top 10 least smartest dogs") + labs(x= "Breed", y="Average Number of Repetitions") + theme(text = element_text(size=10),
                                                                                         axis.text.x = element_text(angle=90, hjust=1))


ggsave("figures/not_smart_dogs.png")
