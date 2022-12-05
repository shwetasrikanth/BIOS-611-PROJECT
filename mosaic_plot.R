dogs = read.csv("derived_data/derived_data_avg.csv")
wtLevel = 1+ as.integer(dogs$avg_w /20)
wtLevel[wtLevel > 6] = 6
weightLevels = c("w:000-19","w:020-39",
                 "w:040-59","w:060-79","w:080-99")
wtGroup=weightLevels[wtLevel]
Intelligence = rep("",277)
Intelligence[dogs$trainability_value ==
               0.8] = "IQ2.Excel"
Intelligence[dogs$trainability_value ==
               0.6] = "IQ3.Avg"
Intelligence[dogs$trainability_value ==
               1] = "IQ1.Bright"
Intelligence[dogs$trainability_value ==
               0.4] = "IQ4.Fair"
Intelligence[dogs$trainability_value ==
               0.2] = "IQ5.Lowest"
dogs2 = cbind(dogs, Intelligence,wtGroup)
wtIQ = xtabs(~ Intelligence + wtGroup, data=dogs2)
wtIQ2 = wtIQ[1,] + wtIQ[2,]
wtIQ2 = rbind(wtIQ2, wtIQ[3,])
wtIQ2 = rbind(wtIQ2, wtIQ[4,])
wtIQ2 = rbind(wtIQ2, wtIQ[5,])
rownames(wtIQ2) = c("High", "AboveAvg", "Avg", "Low")
chisq.test(wtIQ2,simulate.p.value=TRUE)

jpeg(file="figures/mosaic_plot.png")
mosaicplot(t(wtIQ2),
           main="Weight vs Intelligence of dogs ",
           col=c("red","orange","green","blue"),
           xlab="Weight in lbs",
           ylab="Intelligence classification",
           sub="Based on number of breeds for each size category")


dev.off()
