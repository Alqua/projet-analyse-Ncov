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

##sort dataframe by the column we want for this graph, mutate create new col?

data<- mutate(data, fct_infreq(data$media))

##rename new col
data <-rename(data, media_ordered = "fct_infreq(data$media)")

##ggplot call for graphic
x <- ggplot(data, aes(factor(media), fill=category))

##using the extra column
x <- ggplot(data, aes(factor(media_ordered), fill=category))

x+geom_bar()+coord_flip()

##coord_flip() allow to turn the graphic
##another solution is simply to specify the y axis like this:
x <- ggplot(data, aes(y = factor(media_ordered), fill=category))

x+geom_bar()


## create and save plot

x <- ggplot(data, aes(y= factor(media_ordered), fill=category))

y <- x+geom_bar()+ggtitle("Number of articles per media")+
  labs(y = "Media", fill = "Category")
print(y)

ggsave(plot = y, width = 6, height = 20, filename = "Number of articles per media.jpg")

##check if "PlantifulSoul" is only narrative as in the graph
Planti <- filter(data, media=="PlantifulSoul")
##(yes)

##category separated in two graphs
t<-x+geom_bar()+ggtitle("Number of articles per media")+facet_wrap(. ~ category)+
  labs(y = "Media", fill = "Category")
print(t)
ggsave(plot = t, width = 6, height = 20, filename = "Graph_media_cat_sep.jpg")



##create new column to separate data because the first graph is too big
##to be readable
t <- as.data.frame(table(data$media_ordered))


quantile(t$Freq)
## 0%  25%  50%  75% 100% 
## 1    2    7   23  444 

var1 <- t$Var1
medvar1 <- var1[1:8]
##medvar1 <- as.character(var2)
medvar2 <- var1[9:49]
medvar3 <- var1[50:90]
medvar4 <- var1[91:128]
medvar5 <- var1[129:168]
##all but medvar4-5 article media
medvar6 <- var1[1:91]

medvar_without_8 <- var1[9:168]

##separate data into different dataframe

medcat1 <- subset(data, media %in% medvar1)
medcat2 <- subset(data,media %in% medvar2)
medcat3 <- subset(data,media %in% medvar3)
medcat4 <- subset(data,media %in% medvar4)
medcat5 <- subset(data,media %in% medvar5)

medcat_without_8<- subset(data, media %in% medvar_without_8)

##all but medvar4-5 article media
medcat6 <- subset(data,media %in% medvar6)

##plotting the different dataframes
##part1 132-444 articles
x <- ggplot(medcat1, aes(y = factor(media_ordered), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per media (part 1)")+
  labs(y = "Media", fill = "Category")
print(y)
ggsave(plot = y, filename = "graphique_medcat_no1.jpg")

##part2 20-85 articles
x <- ggplot(medcat2, aes(y = factor(media_ordered), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per media (part 2)")+
  labs(y = "Media", fill = "Category")
print(y)
ggsave(plot = y, filename = "graphique_medcat_no2.jpg", width = 7, height = 10)

##part3 5-18 articles
x <- ggplot(medcat3, aes(y = factor(media_ordered), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per media (part 3)")+
  labs(y = "Media", fill = "Category")
print(y)
ggsave(plot = y, filename = "graphique_medcat_no3.jpg", width = 7, height = 10)

##part4 2-5 articles
x <- ggplot(medcat4, aes(y= factor(media_ordered), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per media (part 4)")+
  labs(y = "Media", fill = "Category")
print(y)
ggsave(plot = y, filename = "graphique_medcat_no4.jpg", width = 7, height = 10)

##part5 1 articles
x <- ggplot(medcat5, aes(y = factor(media_ordered), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per media (part 5)")+
  labs(y = "Media", fill = "Category")
print(y)
ggsave(plot = y, filename = "graphique_medcat_no5.jpg", width = 7, height = 10)

##part without Media with 1-5 articles
x <- ggplot(medcat6, aes(y = factor(media_ordered), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per media (no medias with 1-5 articles)")+
  labs(y = "Media", fill = "Category")
print(y)
ggsave(plot = y, filename = "graphique_medcat_no6.jpg",width = 7, height = 10)


##with count at the end of column (here part1 for the example)
x <- ggplot(medcat1, aes(y = factor(media_ordered), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per Media (part1)")+
  geom_text(stat='count',aes(label=..count..),vjust=-0.7) +
  labs(y = "Media", fill = "category")
print(y)

##without 8 first media
x <- ggplot(medcat_without_8, aes(y = factor(media_ordered), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per media (no medias with 1-5 articles)")+
  labs(y = "Media", fill = "Category")
print(y)
ggsave(plot = y, filename = "graphique_medcat_without_8.jpg",width = 7, height = 10)

#compairing percentage category with and without 8 first medias
catefull <-as.data.frame(table(data$category))
c<-sum(catefull$Freq)
label_percent(accuracy = 0.01)(3843/c)
##[1] "78.73%"

without8table<-as.data.frame(table(medcat_without_8$category))
s<-sum(without8table$Freq)
label_percent(accuracy = 0.01)(1480/s)
##[1] "59.08%"