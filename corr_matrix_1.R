library(tidyr)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(reshape2)

d1<- read.csv("derived_data/derived_data_corr.csv")

cormat <-round(cor(d1),2)
head(cormat)


melted_cormat <- melt(cormat)
head(melted_cormat)
ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile()
ggsave("figures/corr_1.png")