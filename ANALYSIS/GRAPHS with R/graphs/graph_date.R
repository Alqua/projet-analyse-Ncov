setwd()

library(ggplot2)
library(dplyr)
library(forcats)
library(data.table)
library(scales)
library(ggfortify)
library(tidyverse)

##read dataframe (Check if chinese characters are ok)
data <- fread("../../data.csv", key = "id", encoding = "UTF-8")

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

##Plotly
x <- ggplot(data, aes(y = factor(date), fill=category)) 
y<- x+geom_bar()+
  labs(y = "date", fill = "category") +
  scale_y_discrete(limits = rev(levels(factor(data$date))))
z<-ggplotly(y, width = 700, height = 1000)%>%
  layout(xaxis = list(fixedrange = TRUE), yaxis = list(fixedrange = TRUE))%>%
  config(displaylogo = FALSE)
z
##saving plotly object in html
htmlwidgets::saveWidget(as_widget(z), "graph_date.html")

##plotting jiemian date
jiemian <- data[data$media== '界面新闻' ]

x <- ggplot(jiemian, aes(y = factor(date), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of jiemian's articles per date")+
  labs(y = "date", fill = "category") +
  scale_y_discrete(limits = rev(levels(factor(data$date))))
print(y)
ggsave(plot = y, filename = "Jiemian per date.jpg",width = 7, height = 10)

##Plotly
x <- ggplot(jiemian, aes(y = factor(date), fill=category)) 
y<- x+geom_bar()+
  labs(y = "date", fill = "category") +
  scale_y_discrete(limits = rev(levels(factor(data$date))))

z<-ggplotly(y, width = 700, height = 1000)%>%
  layout(xaxis = list(fixedrange = TRUE), yaxis = list(fixedrange = TRUE))%>%
  config(displaylogo = FALSE)
z
##saving plotly object in html
htmlwidgets::saveWidget(as_widget(z), "html/graph_date_jiemian.html")

##after checking Jiemian's date, I want to check the dates for all the newspaper
##loading handmande data, pay attention to directory location and file location
handmade<- fread("../../merging/data_merge_handmade.csv", key = "id", encoding = "UTF-8")

##selecting newspaper (and online media for that matter)
newspaper <-handmade[handmade$`media category`== c('newspaper','online media')]

##plotting newspaper
x <- ggplot(newspaper, aes(y = factor(date), fill=media)) 
y<- x+geom_bar()+ggtitle("Number of newspapers' articles per date")+
  labs(y = "date", fill = "media") +
  scale_y_discrete(limits = rev(levels(factor(data$date))))
print(y)

ggsave(plot = y, filename = "Newspaper_per_date.jpg",width = 7, height = 10)

##Plotly
x <- ggplot(newspaper, aes(y = factor(date), fill=media)) 
y<- x+geom_bar()+
  labs(y = "date", fill = "media") +
  scale_y_discrete(limits = rev(levels(factor(data$date))))
z<-ggplotly(y, width = 700, height = 1000)%>%
  layout(xaxis = list(fixedrange = TRUE), yaxis = list(fixedrange = TRUE))%>%
  config(displaylogo = FALSE)
z
##saving plotly object in html
htmlwidgets::saveWidget(as_widget(z), "html/graph_date_newspaper.html")

