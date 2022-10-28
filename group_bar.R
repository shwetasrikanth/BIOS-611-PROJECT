library(tidyverse)
library(tidyr)
d1<- read.csv("source_data/dogdata.csv")
group_count<-table(d1$group)
dev.new()
png(file="group_bar.png",
    width=800, height=900)
barplot(group_count, main="Group Category", las=2, cex.names=1, 
        names.arg = c("Foundation Stock Service", "Herd Group", "Hound Group", "Miscellaneous Class", 
                      "Non Sporting Group", "Sporting Group", "Terrier Group", "Toy Group", 
                      "Working Group"), col="#CCCCFF")
dev.off()