library(arules)
library(arulesViz)

grocery <- read.transactions("Grocery.csv", sep=',')
summary(grocery)

itemFrequencyPlot(grocery,topN=80)

rules <- apriori(grocery, parameter = list(supp=0.01,conf=0.0))

inspect(sort(rules,by="lift")) #to see the rules within R

#to export the rules to excel for better understanding - common/standard method
write(rules,"GroceryRules.csv",sep=",")

plot(rules,method="grouped")

plot(rules,method="graph",control=list(type="item"),interactive=T)
