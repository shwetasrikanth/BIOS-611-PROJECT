library(tidyverse)
library(tidyr)
d1<- read.csv("source_data/dogdata.csv")
shedding_count<-table(d1$shedding_category)
dev.new()
png(file="figures/shedding_bar.png",
    width=600, height=350)
barplot(shedding_count, main="Shedding Category", las=2, cex.names=1, 
        names.arg = c("Missing", "Frequent", "Infrequent", "Occasional", "Regularly", "Seasonal"), 
        col="#FFB266")
dev.off()