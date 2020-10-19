setwd()

library(ggplot2)
library(dplyr)
library(forcats)
library(data.table)
library(scales)
library(ggfortify)
library(tidyverse)

##read dataframe (Check if chinese characters are ok)
data<- read.csv("data.csv", encoding = "UTF-8")

##table of column date to see what to expect
date_table <- table(data$date)

date_table <- as.data.frame(date_table)

##plotting with count

x <- ggplot(data, aes(y = factor(date), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per date")+
  geom_text(stat='count',aes(label=..count..),vjust=-0.7) +
  labs(y = "date", fill = "category")
print(y)


##plotting without count, early to latest date

x <- ggplot(data, aes(y = factor(date), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per date")+
  labs(y = "date", fill = "category") +
scale_y_discrete(limits = rev(levels(factor(data$date))))
print(y)



##save plot
ggsave(plot = y, filename = "Number of articles per date.jpg",width = 7, height = 10)
