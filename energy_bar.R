library(tidyverse)
library(tidyr)
d1<- read.csv("source_data/dogdata.csv")
energy_count<-table(d1$energy_level_category)
dev.new()
png(file="figures/energy_bar.png",
    width=600, height=350)
barplot(energy_count, main="Energy Category", las=2, cex.names=1, 
        names.arg = c("Missing", "Calm", "Couch Potato", "Energetic", "Lots of activity", 
                      "Regular Exercise"), col="#69b3a2")
dev.off()
