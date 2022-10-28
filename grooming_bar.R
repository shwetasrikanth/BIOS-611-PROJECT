library(tidyverse)
library(tidyr)
d1<- read.csv("source_data/dogdata.csv")
grooming_count<-table(d1$grooming_frequency_category)
dev.new()
png(file="figures/grooming_bar.png",
    width=600, height=350)
barplot(grooming_count, main="Grooming Category",las=2, 
        names.arg = c("Missing", "2-3 times a week", "Daily", "Occasional", "Professional", "Weekly"), 
        col="#99CCFF")
dev.off()