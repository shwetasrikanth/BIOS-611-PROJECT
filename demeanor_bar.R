library(tidyverse)
library(tidyr)
d1<- read.csv("source_data/dogdata.csv")
demeanor_count<-table(d1$demeanor_category)
dev.new()
png(file="figures/demeanor_bar.png",
    width=600, height=350)
barplot(demeanor_count, main="Demenaour Category", las=2, cex.names=1, 
        names.arg = c("Missing", "Alert", "Aloof", "Friendly", "Outgoing", "Reserved with Strangers"), 
        col="#CCFFCC")
dev.off()
