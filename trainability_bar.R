library(tidyverse)
library(tidyr)
d1<- read.csv("source_data/dogdata.csv")
trainability_count<-table(d1$trainability_category)
dev.new()
png(file="figures/trainability_bar.png",
    width=600, height=350)
barplot(trainability_count, main="Trainability Category", las=2, cex.names=1, 
        names.arg = c("Missing", "Agreebale", "Eager to please", "Easy Training", "Independent", 
                      "May be Stubborn"), col="#FF9999")
dev.off()