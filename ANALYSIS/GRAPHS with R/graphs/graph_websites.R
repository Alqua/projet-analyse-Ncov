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

##make new column with name of website

data <- data %>%  
  mutate(url_new = case_when(grepl("weixin", url) ~ "weixin",
                             grepl("caixin", url) ~"caixin",
                             grepl("weibo", url) ~ "weibo",
                             grepl("bjnews", url) ~ "bjnews",
                             grepl("cb", url) ~ "cb",
                             grepl("ceweekly", url) ~ "ceweekly",
                             grepl("chuapp", url) ~ "chuapp",
                             grepl("dxy", url) ~ "dxy",
                             grepl("eeo", url) ~ "eeo",
                             grepl("gcores", url) ~ "gcores",
                             grepl("ifeng", url) ~ "ifeng",
                             grepl("inews.qq", url) ~ "inews.qq",
                             grepl("infzm", url) ~ "infzm",
                             grepl("jiemian", url) ~ "jiemian",
                             grepl("new.qq", url) ~ "new.qq",
                             grepl("neweekly", url) ~ "neweekly",
                             grepl("oeeee", url) ~ "oeeee",
                             grepl("sohu", url) ~ "sohu",
                             grepl("thepaper", url) ~ "thepaper",
                             grepl("titan24", url) ~ "titan24",
                             grepl("toutiao", url) ~ "toutiao",
                             grepl("whb", url) ~ "whb",
                             grepl("wxn", url) ~ "wxn",
                             grepl("xueqiu", url) ~ "xueqiu",
                             grepl("yicai", url) ~ "yicai",
                             grepl("yystv", url) ~ "yystv",
                             grepl("zhishifenzi", url) ~ "zhishifenzi",
                             grepl("zhisland", url) ~ "zhisland",
                             grepl("", url) ~ "no_url",
  ))

##table of column date to see what to expect
##we want to see the na which correspond to deleted/censored articles for which
##the original link is not available
url_new_table <- table(data$url_new)

url_new_table <- as.data.frame(url_new_table)
#we can check that we catch them all with url
sum(url_new_table$Freq)

##plotting with count
x <- ggplot(data, aes(y = factor(url_new), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per publication websites")+
  geom_text(stat='count',aes(label=..count..),vjust=-0.7) +
  labs(y = "Media", fill = "category")
print(y)

##plotting without count
x <- ggplot(data, aes(y = factor(url_new), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per publication websites")+
  labs(y = "Website", fill = "category")
print(y)


##plotting with graph ordered by count
y<- data %>% mutate(fct_infreq(data$url_new)) %>%
  rename(url_ordered = "fct_infreq(data$url_new)") %>%
  ggplot(aes(y = factor(url_ordered), fill=category))+
  geom_bar()+ggtitle("Number of articles per publication websites")+
  labs(y = "Website", fill = "category")
print(y)
#save
ggsave(plot = y, filename = "graph_websites.jpg")


##plotting without wechat/weixin since it is 82% of the data

y <- data %>% mutate(fct_infreq(data$url_new)) %>%
  rename(url_ordered = "fct_infreq(data$url_new)") %>%
  subset( url_ordered != "weixin") %>%
  ggplot(aes(y = factor(url_ordered), fill=category))+
  geom_bar()+ggtitle("Number of articles per publication websites without wechat/weixin")+
  labs(y = "Website", fill = "category")
print(y)

#save
ggsave(plot = y, filename = "graph_websites_without_weixin.jpg")

##save plot (when necessary change y in the environnement and title then save)
ggsave(plot = y, filename = "graph_websites.jpg")

##extra: crossing website and media
y <- data %>% mutate(fct_infreq(data$media)) %>%
  rename(media_ordered = "fct_infreq(data$media)") %>%
  ggplot(aes(y = factor(media_ordered), fill=url_new))+
  geom_bar()+ggtitle("Number of articles per media, crossing with publication website")+
  labs(y = "media", fill = "website")
print(y)

##save extra
ggsave(plot = y, width = 6, height = 20, filename = "media_x_website.jpg")

##without weixin

y <- data %>% mutate(fct_infreq(data$media)) %>%
  rename(media_ordered = "fct_infreq(data$media)") %>%
  subset( url_new != "weixin") %>%
  ggplot(aes(y = factor(media_ordered), fill=url_new))+
  geom_bar()+ggtitle("Number of articles per media, crossing with publication website, without weixin")+
  labs(y = "media", fill = "website")
print(y)

##save extra
ggsave(plot = y, width = 6, height = 20, filename = "media_x_website_without_weixin.jpg")
