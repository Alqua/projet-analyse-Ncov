setwd()

library(ggplot2)
library(dplyr)
library(forcats)
library(data.table)
library(scales)
library(ggfortify)
library(tidyverse)

##read dataframe (Check if chinese characters are ok)
##this time with fread and set id as key (match rownumber and id column)
data <- fread("data.csv", key = "id", encoding = "UTF-8")

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

##select the row corresponding to deleted articles
censored_articles <- subset(data, data$is_deleted==TRUE)

## make new column with name of alternative
censored_articles<- censored_articles %>%  
  mutate(alternative_new = case_when(grepl("weixin", alternative) ~ "weixin",
                             grepl("206.189", alternative) ~"206.189",
                             grepl("360doc", alternative) ~ "360doc",
                             grepl("terminus2049", alternative) ~ "Terminus2049",
                             grepl("archive", alternative) ~ "archive",
                             grepl("aigupiao", alternative) ~ "aigupiao",
                             grepl("baidu", alternative) ~ "baidu",
                             grepl("careerengine", alternative) ~ "careerengine",
                             grepl("chinadigitaltimes", alternative) ~ "chinadigitaltimes",
                             grepl("google", alternative) ~ "google",
                             grepl("guancha", alternative) ~ "guancha",
                             grepl("hupu", alternative) ~ "hupu",
                             grepl("ipfs", alternative) ~ "ipfs",
                             grepl("ifeng", alternative) ~ "ifeng",
                             grepl("jiemian", alternative) ~ "jiemian",
                             grepl("jintiankansha", alternative) ~ "jintiankansha",
                             grepl("people", alternative) ~ "people",
                             grepl("sina", alternative) ~ "sina",
                             grepl("sohu", alternative) ~ "sohu",
                             grepl("Terminus2049", alternative) ~ "Terminus2049",
                             grepl("thepaper", alternative) ~ "thepaper",
                             grepl("toutiao", alternative) ~ "toutiao",
                             grepl("webcache", alternative) ~ "webcache",
                             grepl("wemp", alternative) ~ "wemp",
                             grepl("wordpress", alternative) ~ "wordpress",
                             grepl("xueqiu", alternative) ~ "xueqiu",
                             grepl("zhihu", alternative) ~ "zhihu",
                             grepl("", alternative) ~ "no_url",
  ))

##place column alternative_new next to alternative for easier comparison

censored_articles <- censored_articles %>% select(1:11, last_col(),everything())

##PLOT FOR CATEGORY
##table of column date to see what to expect
category_table <- table(censored_articles$category)

censored_category <- as.data.frame(category_table)

##plotting with count
x <- ggplot(censored_articles, aes(y = factor(category))) 
y<- x+geom_bar()+ggtitle("Number of articles per category")+
  geom_text(stat='count',aes(label=..count..),vjust=-0.7) +
  labs(y = "category")
print(y)


##plotting without count
x <- ggplot(data, aes(y = factor(category))) 
y<- x+geom_bar()+ggtitle("Number of articles per category")+
  labs(y = "category")
print(y)


##save plot (when necessary change y in the environnement then save)
ggsave(plot = y, filename = "censored_graph_category.jpg")

##PLOT FOR MEDIA

y<- censored_articles %>% mutate(fct_infreq(censored_articles$media)) %>%
  rename(media_ordered = "fct_infreq(censored_articles$media)") %>%
  ggplot(aes(y = factor(media_ordered), fill=category))+
  geom_bar()+ggtitle("Number of articles per media")+
  labs(y = "Media", fill = "Category")
print(y)
##save plot (when necessary change y in the environnement then save)
ggsave(plot = y, filename = "censored_graph_media.jpg", width = 7, height = 7)


##PLOT FOR DATE
x <- ggplot(censored_articles, aes(y = factor(date), fill=category)) 
y<- x+geom_bar()+ggtitle("Number of articles per date")+
  labs(y = "Date", fill = "Category") +
  scale_y_discrete(limits = rev(levels(factor(data$date))))
print(y)
##save plot
ggsave(plot = y, filename = "censored_graph_date.jpg",width = 7, height = 10)

##PLOT WEBSITE
y<- censored_articles %>% mutate(fct_infreq(censored_articles$url_new)) %>%
  rename(url_ordered = "fct_infreq(censored_articles$url_new)") %>%
  ggplot(aes(y = factor(url_ordered), fill=category))+
  geom_bar()+ggtitle("Number of articles per publication websites")+
  labs(y = "Website", fill = "Category")
print(y)
##save plot
ggsave(plot = y, filename = "censored_graph_websites.jpg")

##PLOT WEBSITE WITH MEDIA 
y <- censored_articles %>% mutate(fct_infreq(censored_articles$media)) %>%
  rename(media_ordered = "fct_infreq(censored_articles$media)") %>%
  ggplot(aes(y = factor(media_ordered), fill=url_new))+
  geom_bar()+ggtitle("Number of articles per media, crossing with publication website")+
  labs(y = "Media", fill = "Website")
print(y)
##save plot
ggsave(plot = y, filename = "censored_graph_websites_x_media.jpg",width = 7, height = 8)

##PLOT ALTERNATIVE (WEBSITE)
y<- censored_articles %>% mutate(fct_infreq(censored_articles$alternative_new)) %>%
  rename(alternative_ordered = "fct_infreq(censored_articles$alternative_new)") %>%
  ggplot(aes(y = factor(alternative_ordered), fill=category))+
  geom_bar()+ggtitle("Number of articles per alternative websites")+
  labs(y = "Website", fill = "Category")
print(y)
##save
ggsave(plot = y, filename = "censored_graph_alternative.jpg")

##table of column alternative to check (since it is new)
alternative_table <- table(censored_articles$alternative_new)

alternative_table <- as.data.frame(alternative_table)
##no problem

##EXTRA: ALTERNATIVE X WEBSITE
y<- censored_articles %>% mutate(fct_infreq(censored_articles$alternative_new)) %>%
  rename(alternative_ordered = "fct_infreq(censored_articles$alternative_new)") %>%
  ggplot(aes(y = factor(alternative_ordered), fill=url_new))+
  geom_bar()+ggtitle("Number of articles per alternative websites crossing with original website")+
  labs(y = "Website", fill = "Category")
print(y)
##save
ggsave(plot = y, filename = "censored_graph_alternative_x_website.jpg")
