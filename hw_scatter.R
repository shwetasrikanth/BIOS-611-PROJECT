library(tidyverse)
library(tidyr)
d1<- read.csv("derived_data/derived_data_avg.csv")

dev.new()
png(file="figures/hw_scatter.png",
    width=600, height=350)
plot(d1$avg_h, d1$avg_w, main="Scatterplot of Average Height and Weight",
     xlab="Average Height ", ylab="Average Weight ", pch=19)
dev.off()
