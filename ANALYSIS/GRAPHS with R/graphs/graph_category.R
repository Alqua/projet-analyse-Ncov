setwd()

library(ggplot2)
library(dplyr)
library(forcats)
library(data.table)
library(scales)
library(ggfortify)
library(tidyverse)

data <- fread("../../data.csv", key = "id", encoding = "UTF-8")

##table of column date to see what to expect
category_table <- table(data$category)

date_category <- as.data.frame(category_table)

##plotting with count
x <- ggplot(data, aes(y = factor(category))) 
y<- x+geom_bar()+ggtitle("Number of articles per category")+
  geom_text(stat='count',aes(label=..count..),vjust=-0.7) +
  labs(y = "category")
print(y)


##plotting without count
x <- ggplot(data, aes(y = factor(category))) 
y<- x+geom_bar()+ggtitle("Number of articles per category")+
  labs(y = "category")
print(y)

##save plot (when necessary change y in the environment then save)
ggsave(plot = y, filename = "graph_category.jpg")

##Plotly
x <- ggplot(data, aes(y = factor(category))) 
y<- x+geom_bar()+
  labs(y = "category")
z<-ggplotly(y, width = 700, height = 500)%>%
  layout(xaxis = list(fixedrange = TRUE), yaxis = list(fixedrange = TRUE))%>%
  config(displaylogo = FALSE)
z
##saving plotly object in html
htmlwidgets::saveWidget(as_widget(z), "graph_category.html")
