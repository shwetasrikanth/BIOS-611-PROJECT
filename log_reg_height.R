library(tidyr)
library(tidyverse)
library(ggplot2)
library(dplyr)

d1<- read.csv("derived_data/derived_data_reps.csv")
model <- glm(easy_to_train ~avg_w + avg_h, data = d1, family="binomial")
summary(model)

probabilities <- model %>% predict(d1, type = "response")
predicted.classes <- ifelse(probabilities > 0.5, "Intelligent", "Not Intelligent")
predicted.classes

ggplot(d1, mapping=aes(x=avg_h, y=easy_to_train)) + geom_point() +
  stat_smooth(method="glm", color="blue", se=FALSE,
              method.args = list(family=binomial)) +xlab("Average Height of Dogs")+ylab("Easy to Train")+ggtitle("How size influences Intelligence in Dogs")
ggsave("figures/log_reg_height.png")